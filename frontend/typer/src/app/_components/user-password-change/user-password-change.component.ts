import { Component, Injector } from '@angular/core';

import * as services from '../../_services';
import { BaseFormComponent } from '../common/base-form/base-form.component';
import { Prediction, Match } from '../../_models';
import { catchError } from 'rxjs/operators';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-user-password-change',
  templateUrl: './user-password-change.component.html',
  styleUrls: ['./user-password-change.component.scss']
})
export class UserPasswordChangeComponent extends BaseFormComponent {
  // private userService: services.UserService;
  protected fieldNames = ['email', 'username', 'password1', 'password2'];
  showSpinner = true;

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    // this.userService = injectorObj.get(services.UserService);
  }

  afterGetUser(): void {
    this.userService.getItem(this.user).subscribe(data => {
      this.userService.currentUser = data;
      this.setLoaded();
    });
  }

  getAvatarUploadLabel(): string {
    return this.user.avatar || this.user.avatarFile ? 'Zmień' : 'Dodaj';
  }

  submit(): void {
    this.messagesService.removeAllMessages();
    if (this.user.password !== this.user.password2) {
      this.messagesService.addErrorMessage('Hasła się różnią');
    } else {
      this.userService.changePassword({
        new_password1: this.user.password,
        new_password2: this.user.password2
      })
      .pipe(
        catchError((error: any, caught: Observable<boolean>) => {
          return this.addErrorsObservable(error);
        })
      ).subscribe(data => {
        this.messagesService.addSuccessMessage('Hasło zostało zmienione');
      });
    }
  }

}
