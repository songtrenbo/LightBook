import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css'],
})
export class HeaderComponent implements OnInit {
  token: any;
  role: string;
  constructor(private router: Router) {}

  ngOnInit(): void {
    var tokenStr = localStorage.getItem('Token');
    this.token = JSON.parse(tokenStr!);
    if (this.token != null) {
      this.role = this.token.role;
    }
  }

  logoutUser() {
    localStorage.removeItem('Token');
    this.router.navigate(['/home']);
    this.token='';
    this.role='';
    this.ngOnInit();
  }
}
