import { Component, Injector, ViewChild, ElementRef } from '@angular/core';
import { Router } from '@angular/router';

import * as services from '../../_services';
import { BaseComponent } from '../common';
import { ExtraQuestion, Answer, Team, Round, AT_SELECT_ROUND } from '../../_models';
import { throwError as observableThrowError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { NgForm } from '@angular/forms';
import { appSettings } from '../../utils/app-settings';

@Component({
  selector: 'app-extra-questions-results',
  templateUrl: './extra-questions-results.component.html',
  styleUrls: ['./extra-questions-results.component.scss']
})
export class ExtraQuestionsResultsComponent extends BaseComponent {
  private router: Router;
  private extraQuestionsService: services.ExtraQuestionsService;
  private answersService: services.AnswersService;
  private teamsService: services.TeamsService;
  private roundsService: services.RoundsService;
  showSpinner = true;
  extraQuestions: ExtraQuestion[];
  answers: Answer[];
  teams: Team[];
  rounds: Round[];

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.router = injectorObj.get(Router);
    this.extraQuestionsService = injectorObj.get(services.ExtraQuestionsService);
    this.answersService = injectorObj.get(services.AnswersService);
    this.teamsService = injectorObj.get(services.TeamsService);
    this.roundsService = injectorObj.get(services.RoundsService);
  }

  get title(): string {
    return 'Pytania dodatkowe - odpowiedzi';
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
    this.answersService.getAllItemsList().subscribe(resp => {
      this.answers = resp;
      this.setLoaded();
    });
  }

  prepareTeamsService(): void {
    this.teamsService.getItemsList().subscribe(resp => {
      this.teams = resp;
      this.prepareRoundsService();
    });
  }

  prepareRoundsService(): void {
    this.roundsService.getItemsList().subscribe(resp => {
      this.rounds = resp;
      this.setLoaded();
    });
  }

  getTeamOrRound(answer: string, question: ExtraQuestion): any {
    return question.possibleAnswers.find(a => a.id.toString() === answer.toString()) || null;
  }

  getAnswers(question: ExtraQuestion): Answer[] {
    return this.answers.filter(ans => ans.questionId === question.id);
  }

  getContext(question: ExtraQuestion, index: number): any {
    const ctx = {
      question: question,
      answers: this.getAnswers(question),
      index: index
    };
    return ctx;
  }

  getAnswerContext(answer: string, question: ExtraQuestion): any {
    const ctx = {
      answer: this.getTeamOrRound(answer, question)
    };
    return ctx;
  }

}
