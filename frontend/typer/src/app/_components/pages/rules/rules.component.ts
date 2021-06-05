import { Component, Injector } from '@angular/core';

import * as services from '../../../_services';
import { BaseComponent } from '../../common';
import { Page } from '../../../_models';
import { catchError } from 'rxjs/operators';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-rules',
  templateUrl: './rules.component.html'
})
export class RulesComponent extends BaseComponent {
  private pagesService: services.PagesService;
  rules: Page;

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.pagesService = injectorObj.get(services.PagesService);
  }

  actionsOnInit(): void {
    this.pagesService.page = 'rules';
    this.pagesService.getItem({})
      .pipe(
        catchError((error: any, caught: Observable<Page>) => {
          return this.messagesService.addErrorMessageFromApiObservable(error);
        })
      ).subscribe(resp => {
        this.rules = resp;
        this.setLoaded();
      });
  }

}
