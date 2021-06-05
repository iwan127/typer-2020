import { Component, Injector } from '@angular/core';

import * as services from '../../../_services';
import { BaseFormComponent } from '../../common/base-form/base-form.component';
import { catchError } from 'rxjs/operators';
import { Observable, of as observableOf } from 'rxjs';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent extends BaseFormComponent {
  private authService: services.AuthService;
  protected fieldNames = ['email', 'username', 'password1', 'password2'];
  username: string;
  password: string;
  password2: string;
  email: string;
  submitted = false;

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.authService = injectorObj.get(services.AuthService);
  }

  submit(): void {
    this.authService.register({
      username: this.username,
      password1: this.password,
      password2: this.password2,
      email: this.email
    }).pipe(
      catchError((error: any, caught: Observable<boolean>) => {
        return this.addErrorsObservable(error);
      })
    ).subscribe(data => {
      this.messagesService.addSuccessMessage('Rejestracja przebiegła pomyslnie! Od teraz możesz typować mecze.', false, true);
      this.authService.redirectToHome();
    });
  }

}
