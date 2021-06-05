import { Component, Injector } from '@angular/core';

import * as services from '../../../_services';
import { BaseFormComponent } from '../../common/base-form/base-form.component';
import { catchError } from 'rxjs/operators';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-reset-password',
  templateUrl: './reset-password.component.html',
  styleUrls: ['./reset-password.component.scss']
})
export class ResetPasswordComponent extends BaseFormComponent {
  private authService: services.AuthService;
  protected fieldNames = ['email'];
  email: string;
  submitted = false;

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.authService = injectorObj.get(services.AuthService);
  }

  submit(): void {
    this.authService.resetPassword({email: this.email})
    .pipe(
      catchError((error: any, caught: Observable<boolean>) => {
        return this.addErrorsObservable(error);
      })
    ).subscribe(data => {
      this.submitted = data;
    });
  }

}
