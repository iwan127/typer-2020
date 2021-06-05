import { Component, Injector } from '@angular/core';

import * as services from '../../../_services';
import { BaseComponent } from '../../common/base/base.component';

@Component({
  selector: 'app-activate',
  templateUrl: './activate.component.html',
  styleUrls: ['./activate.component.scss']
})
export class ActivateComponent extends BaseComponent {
  private authService: services.AuthService;
  errors: Array<{field: string, message: string}>;
  token: string;
  submitted = false;

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.authService = injectorObj.get(services.AuthService);
  }

  actionsOnInit(): void {
    this.authService.activate({
      token: this.token
    }).subscribe(data => {
      if (data) {
        // TODO: prawidłowa aktywacja
        this.submitted = true;
      } else {
        // TODO: nieprawidłowa aktywaja - dodać parsowanie błędu
        const error = this.authService.getError();
      }
    });
  }

}
