import { Component, Injector, ViewChild, ElementRef, ChangeDetectionStrategy, Input, NgZone, ViewContainerRef } from '@angular/core';
import { Router } from '@angular/router';

import * as services from '../../_services';
import { BaseComponent } from '../common';
import { Prediction, Match, User } from '../../_models';
import { Subject, throwError as observableThrowError } from 'rxjs';
import { debounceTime, distinctUntilChanged, switchMap, catchError } from 'rxjs/operators';
import { NgForm } from '@angular/forms';
import { appSettings } from '../../utils/app-settings';
import { DOCUMENT } from '@angular/common';

@Component({
  selector: 'app-prediction',
  templateUrl: './prediction.component.html',
  styleUrls: ['./prediction.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class PredictionComponent extends BaseComponent {
  @Input() match: Match;
  @Input() prediction: Prediction;
  @Input() index: number;
  @Input() showDate: boolean;

  private router: Router;

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.router = injectorObj.get(Router);
  }

  log(): void {
    console.log('render single');
  }

  // wywoływane po zmianie jakiegoś typu
  predictionChanged(): void {
    console.log('predictionChanged');
    // this.formTouched = true;
    if (!this.prediction.goalsHomeValid()) {
      this.prediction.errorGoalsHome = 'Błędna wartość H';
    } else {
      this.prediction.errorGoalsHome = null;
    }
    if (!this.prediction.goalsAwayValid()) {
      this.prediction.errorGoalsAway = 'Błędna wartość A';
    } else {
      this.prediction.errorGoalsAway = null;
    }
  }

  // przekierowanie na stronę ze wszystkimi typami tego meczu
  goToAllMatchPredictions(match: Match): void {
    this.router.navigate(['/', 'predictions', 'match', match.id]);
  }

}
