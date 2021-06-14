import { Component, Injector, ViewChild, ElementRef, ChangeDetectionStrategy } from '@angular/core';
import { Router } from '@angular/router';

import * as services from '../../_services';
import { BaseComponent } from '../common';
import { Prediction, Match, User } from '../../_models';
import { Subject, throwError as observableThrowError } from 'rxjs';
import { debounceTime, distinctUntilChanged, switchMap, catchError } from 'rxjs/operators';
import { NgForm } from '@angular/forms';
import { appSettings } from '../../utils/app-settings';

@Component({
  selector: 'app-predictions',
  templateUrl: './predictions.component.html',
  styleUrls: ['./predictions.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class PredictionsComponent extends BaseComponent {
  private router: Router;
  private predictionsService: services.PredictionsService;
  private matchesService: services.MatchesService;
  predictions: Array<Prediction> = null;
  matches: Array<Match> = null;
  private prevMatch: Match = null;
  showSpinner = true;
  private updatedPredictionStreams: any;
  private updatedPredictionTimeoutHandlers: any;

  private predictionsLoaded = false;
  private matchesLoaded = false;
  private predictionsCreated = false;
  private predictionsEdited = false;

  formValid = true;
  formTouched = false;

  userPredictionId: number = null;
  userPrediction: User = null;

  predictionPlaceholder: string = null;

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.router = injectorObj.get(Router);
    this.predictionsService = injectorObj.get(services.PredictionsService);
    this.matchesService = injectorObj.get(services.MatchesService);
    this.updatedPredictionTimeoutHandlers = {};
    this.predictionsService.setPrimaryId('id');
    this.predictionPlaceholder = appSettings.predictions.placeholder;
  }

  get title(): string {
    return this.userPrediction ? 'Typy użytkownika ' + this.userPrediction.nickname : 'Twoje typy';
  }

  getPredictionUserId(): void {
    this.userPredictionId = this.getUrlParam('uid');
  }

  afterGetUser(): void {
    this.getPredictionUserId();
    if (this.userPredictionId) {
      this.getUserPrediction();
    } else {
      this.prepareMatchService();
      this.preparePredictionService();
    }
  }

  getUserPrediction(): void {
    this.userService.getItemPreview({id: this.userPredictionId}).subscribe(data => {
      this.userPrediction = data;
      this.prepareMatchService();
      this.preparePredictionService();
    });
  }

  prepareMatchService(): void {
    this.matchesService.getItemsList().subscribe(resp => {
      this.matches = [];
      this.matchesLoaded = true;
      this.updatedPredictionStreams = {};
      resp.forEach(match => {
        this.matches.push(new Match(match));
        this.updatedPredictionStreams[match.id] = new Subject<Prediction>();
      });
      if (this.predictionsLoaded) {
        this.predictionSavingInit();
        this.setLoaded();
      }
    });
  }

  preparePredictionService(): void {
    this.predictionsService.setListPrimaryKey('user');
    this.predictionsService.setListPrimaryId(this.userPredictionId ? this.userPredictionId : this.user.id);
    this.predictionsService.getItemsList().subscribe(resp => {
      this.predictions = resp;
      this.predictionsLoaded = true;
      if (this.matchesLoaded) {
        this.setLoaded();
      }
    });
  }

  getMatchPrediction(match: Match): Prediction {
    let disablePredictions = false;
    if (this.userPredictionId && this.userPredictionId !== this.user.id) {
      disablePredictions = true;
    }
    // TODO: API zwraca id meczu zamiast całego obiektu
    const pr = this.predictions.find(pred => pred.match.id === match.id);
    // console.log(match.id, pr);
    if (!pr) {
      const newPr = new Prediction({
        match: match,
        editable: match.predictionEnabled,
        forceDisabled: disablePredictions
      });
      this.predictions.push(newPr);
      return newPr;
    } else {
      pr.forceDisabled = disablePredictions;
      return pr;
    }
  }

  getShowDate(match: Match, index: number): any {
    let showDate = true;

    // jeśli data obecnego meczu jest taka, jak poprzedniego, to nie pokazujemy jej
    if (this.prevMatch) {
      const prevD = this.prevMatch.datetimeObj;
      const curD = match.datetimeObj;
      if (prevD.getFullYear() === curD.getFullYear()
          && prevD.getMonth() === curD.getMonth()
          && prevD.getDate() === curD.getDate()
      ) {
        showDate = false;
      }
    }
    this.prevMatch = match;
    return showDate;
  }

  // przekierowanie na stronę ze wszystkimi typami tego meczu
  goToAllMatchPredictions(match: Match): void {
    this.router.navigate(['/', 'predictions', 'match', match.id]);
  }

  isFormValid(): boolean {
    const invalidPrs = this.predictions.filter(pr => !pr.isValid());
    const isValid = invalidPrs.length === 0;
    return isValid;
  }

  onFormTouched(formTouched: boolean): void {
    this.formTouched = formTouched;
  }

  showSubmitButton(): boolean {
    return this.isFormValid() && this.formTouched;
  }

  // wywoływane po zmianie jakiegoś typu
  predictionChanged(prediction: Prediction): void {
    this.formTouched = true;
    if (!prediction.goalsHomeValid()) {
      prediction.errorGoalsHome = 'Błędna wartość H';
    } else {
      prediction.errorGoalsHome = null;
    }
    if (!prediction.goalsAwayValid()) {
      prediction.errorGoalsAway = 'Błędna wartość A';
    } else {
      prediction.errorGoalsAway = null;
    }
    // if (prediction.prevGoalsHome === prediction.goalsHome && prediction.prevGoalsAway === prediction.goalsAway) {
    //   console.log('same');
    //   return;
    // }
    // console.log('different');
    // prediction.prevGoalsHome = prediction.goalsHome;
    // prediction.prevGoalsAway = prediction.goalsAway;
    // if (prediction.goalsHome !== null && prediction.goalsHome !== undefined
    //     && prediction.goalsAway !== null && prediction.goalsAway !== undefined) {
    //   if (prediction.isValid()) {
    //     console.log('prediction valid');
    //     this.savePrediction(prediction);
    //   }
    // }
  }

  savePrediction(prediction: Prediction): void {
    this.updatePrediction(prediction);
    // this.predictionsService.createOrUpdateItem(prediction).subscribe(
    //   data => {
    //     console.log('zapisano');
    //   }
    // );
  }

  savePredictions(): void {
    this.predictionsCreated = false;
    this.predictionsEdited = false;
    this.predictionsService.createItems(this.predictions.filter(pr => !pr.id && pr.isValid() && pr.editable))
      .subscribe(data => {
        const dataArr = <Array<Prediction>> data;
        dataArr.forEach(newPr => {
          const prToUpt = this.predictions.find(pr => pr.matchId === newPr.matchId);
          if (prToUpt) {
            prToUpt.id = newPr.id;
          }
        });
        this.predictionsCreated = true;
        if (this.predictionsCreated && this.predictionsEdited) {
          this.formTouched = false;
          this.messagesService.addSuccessMessage('Typy zostały zapisane', true);
        }
      }, error => {
        if (this.predictionsCreated && this.predictionsEdited) {
          this.messagesService.addErrorMessage('Wystąpił błąd. Niektóre typy mogły nie zostać zapisane', true);
        }
      });
    this.predictionsService.updateItems(this.predictions.filter(pr => pr.id && pr.isValid() && pr.editable))
      .subscribe(data => {
        this.predictionsEdited = true;
        if (this.predictionsCreated && this.predictionsEdited) {
          this.formTouched = false;
          this.messagesService.addSuccessMessage('Typy zostały zapisane', true);
        }
      }, error => {
        if (this.predictionsCreated && this.predictionsEdited) {
          this.messagesService.addErrorMessage('Wystąpił błąd. Niektóre typy mogły nie zostać zapisane', true);
        }
      });
  }

  updatePrediction(prediction: Prediction): void {
    if (prediction.match.id in this.updatedPredictionTimeoutHandlers && this.updatedPredictionTimeoutHandlers[prediction.match.id]) {
      clearTimeout(this.updatedPredictionTimeoutHandlers[prediction.match.id]);
    }
    this.resetMarkedPrediction(prediction);
    this.updatedPredictionStreams[prediction.match.id].next(prediction);
  }

  resetMarkedPrediction(prediction: Prediction): void {
    prediction.markedSuccess = false;
    prediction.markedError = false;
  }

  markPrediction(prediction: Prediction, markType: string): void {
    if (markType === 'success') {
      prediction.markedSuccess = true;
      this.messagesService.addSuccessMessage('Typ zapisany', true);
    } else if (markType === 'error') {
      prediction.markedError = true;
      this.messagesService.addErrorMessage('Wystąpił błąd', true);
    }
    this.updatedPredictionTimeoutHandlers[prediction.match.id] = setTimeout(() => {
      this.resetMarkedPrediction(prediction);
    }, 1500);
  }

  predictionSavingInit(matchId: string = null): void {
    const keys = Object.keys(this.updatedPredictionStreams);
    for (const key of keys) {
      if (matchId === null || key === matchId) {
        const stream = this.updatedPredictionStreams[key];
        // TODO: przeniesc pipe do serwisu
        stream
          .pipe(
            debounceTime(500),
            distinctUntilChanged(),
            switchMap((prediction: Prediction) => this.predictionsService.createOrUpdateItem(prediction)),
            catchError((error, caught) => {
              this.predictionSavingInit(key);
              const curPrediction = this.predictions.find(pred => pred.match.id.toString() === key);
              this.markPrediction(curPrediction, 'error');
              return observableThrowError(error);
            })
          )
          .subscribe(data => {
            const newPrediction = new Prediction();
            newPrediction.setValuesByJson(data);
            const curPrediction = this.predictions.find(pred => pred.match.id === newPrediction.match.id);
            curPrediction.id = newPrediction.id;
            this.markPrediction(curPrediction, 'success');
          });
      }
    }
  }

  matchTrackbyFn(index: number, match: Match): number {
    return match.id;
  }

  log(): void {
    // console.log('render plural');
  }

}
