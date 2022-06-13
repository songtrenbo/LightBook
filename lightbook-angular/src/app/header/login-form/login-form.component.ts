import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from 'src/app/service/user.service';
import Swal from 'sweetalert2';
import { HeaderComponent } from '../header.component';

@Component({
  selector: 'app-login-form',
  templateUrl: './login-form.component.html',
  styleUrls: ['./login-form.component.css'],
})
export class LoginFormComponent implements OnInit {
  user = {
    userName: '',
    password: '',
  };
  submitted = false;
  constructor(private userService: UserService, private router: Router, private header: HeaderComponent) {}

  ngOnInit(): void {}

  login(): void {
    var tokenInfo;
    const data = {
      userName: this.user.userName,
      password: this.user.password,
    };

    this.userService.login(data).subscribe(
      (response) => {
        tokenInfo = response;
        this.submitted = true;
        localStorage.setItem('Token', JSON.stringify(tokenInfo));
        if(tokenInfo.role === "Admin"){
          this.router.navigate(['/admin']);
        }
        this.header.ngOnInit();
      },
      (error) => {        
        Swal.fire({
          icon: 'error',
          title: 'Please try again',
          text: 'Wrong username or password!'
        })
      }
    );
  }
}
