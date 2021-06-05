import { Component, Injector } from '@angular/core';

import * as services from '../../../_services';
import { BaseComponent } from '../../common/base/base.component';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent extends BaseComponent {
  private authService: services.AuthService;
  username: string;
  password: string;

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.authService = injectorObj.get(services.AuthService);
  }

  submit(): void {
    this.authService.login({
      username: this.username,
      password: this.password
    }).subscribe(data => {
    });
  }

}
