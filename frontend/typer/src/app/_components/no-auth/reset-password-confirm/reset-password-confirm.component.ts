import { Component, Injector } from '@angular/core';

import * as services from '../../../_services';
import { BaseFormComponent } from '../../common/base-form/base-form.component';
import { catchError } from 'rxjs/operators';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-reset-password-confirm',
  templateUrl: './reset-password-confirm.component.html',
  styleUrls: ['./reset-password-confirm.component.scss']
})
export class ResetPasswordConfirmComponent extends BaseFormComponent {
  private authService: services.AuthService;
  protected fieldNames = ['password1', 'password2'];
  token: string;
  userId: string;
  password: string;
  password2: string;
  submitted = false;

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.authService = injectorObj.get(services.AuthService);
  }

  actionsOnInit(): void {
    this.getUserId();
    this.getToken();
  }

  getUserId(): void {
    this.userId = this.getUrlParam('uid');
  }

  getToken(): void {
    this.token = this.getUrlParam('token');
  }

  submit(): void {
    const data = {
      token: this.token,
      uid: this.userId,
      new_password1: this.password,
      new_password2: this.password2
    };
    this.authService.confirmResetPassword(data)
      .pipe(
        catchError((error: any, caught: Observable<boolean>) => {
          return this.addErrorsObservable(error);
        })
      ).subscribe(resp => {
        this.submitted = true;
        this.messagesService.addSuccessMessage('Hasło zostało zmienione.', false, true);
        this.authService.redirectToLogin();
      });
  }

}
