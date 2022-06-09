import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from 'src/app/service/user.service';

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
  constructor(private userService: UserService, private router: Router) {}

  ngOnInit(): void {}

  login(): void {
    let tokenInfo;
    const data = {
      userName: this.user.userName,
      password: this.user.password,
    };

    this.userService.login(data).subscribe(
      (response) => {
        tokenInfo = response;
        this.submitted = true;
        localStorage.setItem('AccessToken', tokenInfo.accessToken);
        localStorage.setItem('Name', tokenInfo.name);
        window.location.reload();
      },
      (error) => {
        if (400 === error.response.status) {
          console.log('wrong username or password');
        }
      }
    );
  }
}
