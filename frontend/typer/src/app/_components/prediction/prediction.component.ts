import { Component, Injector, ViewChild, ElementRef, ChangeDetectionStrategy, Input, NgZone, ViewContainerRef, ChangeDetectorRef, Output, EventEmitter } from '@angular/core';
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
  @Output() onFormTouched = new EventEmitter<boolean>();

  _formTouched: boolean;
  get formTouched(): boolean {
    return this._formTouched;
  }
  set formTouched(formTouched: boolean) {
    this._formTouched = formTouched;
    this.onFormTouched.next(this.formTouched);
  }

  isPredictionDisabled = false;
  private isPredictionEmpty = true;

  private predictionDisabledPlaceholder = '?';
  private predictionEmptyPlaceholder = 'x';
  predictionPlaceholder: string;

  private router: Router;
  private cdr: ChangeDetectorRef;

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.router = injectorObj.get(Router);
    this.cdr = injectorObj.get(ChangeDetectorRef);
  }

  ngOnInit(): void {
    this.isPredictionDisabled = !this.prediction.editable || !this.match.predictionEnabled || this.prediction.forceDisabled;
    this.predictionPlaceholder = this.getPredictionPlaceholder();
  }

  log(): void {
    // console.log('render single');
  }

  private getPredictionPlaceholder(): string {
    return this.isPredictionDisabled ? this.predictionDisabledPlaceholder : null;
  }

  // wywoływane po zmianie jakiegoś typu
  predictionChanged(): void {
    this.formTouched = true;
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
    this.cdr.detectChanges();
  }

  // przekierowanie na stronę ze wszystkimi typami tego meczu
  goToAllMatchPredictions(match: Match): void {
    this.router.navigate(['/', 'predictions', 'match', match.id]);
  }

}
