import { Component, Injector } from '@angular/core';

import { BaseComponent } from '../base/base.component';
import { throwError, Observable } from 'rxjs';

@Component({
  selector: 'app-base-form',
  templateUrl: '../base/base.component.html'
})
export class BaseFormComponent extends BaseComponent {
  protected fieldNames = [];
  errors = {};

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
  }

  addErrors(error): void {
    if (typeof error === 'object') {
      const errObj = 'error' in error ? error.error : error;
      const errKeys = Object.keys(errObj);
      for (const key of errKeys) {
        if (this.fieldNames.indexOf(key) > -1) {
          this.errors[key] = errObj[key];
        }
      }
    }
  }

  addErrorsObservable(error): Observable<never> {
    this.addErrors(error);
    return throwError(error);
  }

  removeErrors(): void {
    this.errors = {};
  }

  fieldHasError(fieldName: string): boolean {
    if (fieldName in this.errors) {
      return true;
    }
    return false;
  }

  getFieldError(fieldName: string): string {
    return this.errors[fieldName];
  }
}
