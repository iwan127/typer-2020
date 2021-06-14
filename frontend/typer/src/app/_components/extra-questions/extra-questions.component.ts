import { Component, Injector, ViewChild, ElementRef } from '@angular/core';
import { Router } from '@angular/router';

import * as services from '../../_services';
import { BaseComponent } from '../common';
import { ExtraQuestion, Answer } from '../../_models';
import { throwError as observableThrowError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { NgForm } from '@angular/forms';
import { appSettings } from '../../utils/app-settings';

@Component({
  selector: 'app-extra-questions',
  templateUrl: './extra-questions.component.html',
  styleUrls: ['./extra-questions.component.scss']
})
export class ExtraQuestionsComponent extends BaseComponent {
  private router: Router;
  private extraQuestionsService: services.ExtraQuestionsService;
  private answersService: services.AnswersService;
  showSpinner = true;
  extraQuestions: ExtraQuestion[];
  answers: Answer[];

  private answersCreated = false;
  private answersEdited = false;

  formValid = true;
  formTouched = false;

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.router = injectorObj.get(Router);
    this.extraQuestionsService = injectorObj.get(services.ExtraQuestionsService);
    this.answersService = injectorObj.get(services.AnswersService);
  }

  get title(): string {
    return 'Pytania dodatkowe';
  }

  afterGetUser(): void {
    this.prepareExtraQuestionsService();
  }

  prepareExtraQuestionsService(): void {
    this.extraQuestionsService.getItemsList().subscribe(resp => {
      this.extraQuestions = resp;
      this.prepareAnswersService();
    });
  }

  prepareAnswersService(): void {
    this.answersService.getItemsList().subscribe(resp => {
      this.answers = resp;
      this.setLoaded();
    });
  }

  // wywoływane po zmianie jakiegoś typu
  answerChanged(answer: Answer): void {
    this.formTouched = true;
  }

  isFormValid(): boolean {
    const invalidPrs = []; // this.extraQuestions.filter(pr => !pr.isValid());
    const isValid = invalidPrs.length === 0;
    return isValid;
  }

  showSubmitButton(): boolean {
    return this.isFormValid() && this.formTouched;
  }

  savePredictions(): void {
    this.answersCreated = false;
    this.answersEdited = false;
    this.answersService.createItems(this.answers.filter(ans => !ans.id && ans.isValid() && ans.editable))
      .subscribe(data => {
        const dataArr = <Array<Answer>> data;
        dataArr.forEach(newAns => {
          const ansToUpt = this.answers.find(ans => ans.questionId === newAns.questionId);
          if (ansToUpt) {
            ansToUpt.id = newAns.id;
          }
        });
        this.answersCreated = true;
        if (this.answersCreated && this.answersEdited) {
          this.formTouched = false;
          this.messagesService.addSuccessMessage('Odpowiedzi zostały zapisane', true);
        }
      }, error => {
        if (this.answersCreated && this.answersEdited) {
          this.messagesService.addErrorMessage('Wystąpił błąd. Niektóre odpowiedzi mogły nie zostać zapisane', true);
        }
      });
    this.answersService.updateItems(this.answers.filter(ans => ans.id && ans.isValid() && ans.editable))
      .subscribe(data => {
        this.answersEdited = true;
        if (this.answersCreated && this.answersEdited) {
          this.formTouched = false;
          this.messagesService.addSuccessMessage('Odpowiedzi zostały zapisane', true);
        }
      }, error => {
        if (this.answersCreated && this.answersEdited) {
          this.messagesService.addErrorMessage('Wystąpił błąd. Niektóre odpowiedzi mogły nie zostać zapisane', true);
        }
      });
  }

  getAnswer(question: ExtraQuestion): Answer {
    const ansObj = this.answers.find(ans => ans.questionId === question.id);
    if (!ansObj) {
      const newAns = new Answer({
        questionId: question.id,
        editable: question.answerEnabled
      });
      this.answers.push(newAns);
      return newAns;
    } else {
      return ansObj;
    }
  }

  getContext(question: ExtraQuestion, index: number): any {
    const ctx = {
      question: question,
      answer: this.getAnswer(question),
      index: index
    };
    return ctx;
  }

}
