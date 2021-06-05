import { Component, Injector } from '@angular/core';

import { catchError } from 'rxjs/operators';
import { Observable } from 'rxjs';

import * as services from '../../_services';
import { BaseComponent } from '../common';
import { Prediction, Match } from '../../_models';

@Component({
  selector: 'app-predictions-match',
  templateUrl: './predictions-match.component.html',
  styleUrls: ['./predictions-match.component.scss']
})
export class PredictionsMatchComponent extends BaseComponent {
  private predictionsService: services.PredictionsService;
  private matchesService: services.MatchesService;
  predictions: Array<Prediction> = null;
  match: Match = null;
  showSpinner = true;

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.predictionsService = injectorObj.get(services.PredictionsService);
    this.matchesService = injectorObj.get(services.MatchesService);
  }

  getMatchId(): void {
    const id = this.getUrlParam('uid');
    if (id) {
      this.match = new Match({id: id});
    }
  }

  getMatch(): void {
    if (this.match) {
      this.matchesService.getItem(this.match)
        .pipe(
          catchError((error: any, caught: Observable<Match>) => {
            return this.messagesService.addErrorMessageFromApiObservable(error);
          })
        )
        .subscribe(data => {
          this.match = data;
          this.getPredictions();
        });
    }
  }

  actionsOnInit(): void {
    this.getMatchId();
    this.getMatch();
  }

  getPredictions(): void {
    this.predictionsService.getMatchItemsList(this.match.id)
      .pipe(
        catchError((error: any, caught: Observable<Array<Prediction>>) => {
          return this.messagesService.addErrorMessageFromApiObservable(error);
        })
      ).subscribe(resp => {
        this.predictions = resp;
        // resp.forEach(up => {
        //   this.rank.push(new UserPoints(up));
        // });
        this.setLoaded();
      });
  }

}
