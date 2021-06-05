import { Component, Injector } from '@angular/core';

import * as services from '../../_services';
import { BaseComponent } from '../common';
import { UserPoints } from '../../_models';
import { catchError } from 'rxjs/operators';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-rank',
  templateUrl: './rank.component.html',
  styleUrls: ['./rank.component.scss']
})
export class RankComponent extends BaseComponent {
  private rankService: services.RankService;
  rank: Array<UserPoints> = null;
  showSpinner = true;

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.rankService = injectorObj.get(services.RankService);
  }

  actionsOnInit(): void {
    // przenieść tutaj zawartość afterGetUser()
  }

  afterGetUser(): void {
    // this.rank = [
    //   new UserPoints({
    //     user: this.user,
    //     points: 10
    //   }),
    //   new UserPoints({
    //     user: this.user,
    //     points: 7
    //   }),
    //   new UserPoints({
    //     user: this.user,
    //     points: 5
    //   }),
    //   new UserPoints({
    //     user: this.user,
    //     points: 2
    //   })
    // ];
    // setTimeout(() => {
    //   this.setLoaded();
    // }, 3000);
    this.rankService.getItemsList()
      .pipe(
        catchError((error: any, caught: Observable<Array<UserPoints>>) => {
          return this.messagesService.addErrorMessageFromApiObservable(error);
        })
      ).subscribe(resp => {
        this.rank = resp;
        // resp.forEach(up => {
        //   this.rank.push(new UserPoints(up));
        // });
        this.setLoaded();
      });
  }

}
