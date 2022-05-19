import { Component, OnInit } from '@angular/core';
@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css'],
})
export class HeaderComponent implements OnInit {
  username: string | null;
  constructor() {
    this.username = localStorage.getItem('Name');
  }

  ngOnInit(): void {}

  logoutUser() {
    //clear local storage
    localStorage.clear();
    window.location.reload();
  }
}
