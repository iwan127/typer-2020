import { BaseModel } from './base-model';
import { ExtraQuestion } from './extra-question';
import { User } from './user';

export const AT_TEXT = 1;
export const AT_SELECT_TEAM = 2;
export const AT_SELECT_2_TEAMS = 3;
export const AT_SELECT_2_TEAMS_GROUP = 4;
export const AT_SELECT_ROUND = 5;

export class Answer extends BaseModel {
  id: number = null;
  editable = true;
  points: number = null;
  answer: string = null;
  questionId: number = null;
  answer1Data: number = null;
  answer2Data: number = null;
  user: User = null;

  constructor(
    options?: any
  ) {
    super();
    this.setValuesByJson(options);
  }

  // ustawianie pól obiektu na podstawie danych w formacie JSON - główna logika
  protected setValuesByJsonCore(data: {}, field: any): void {
    if (field === 'answer' && data && 'answer' in data) {
      this.answer = data['answer'];
      if (this.answer) {
        const answers = this.answer.split(',');
        const a1 = parseInt(answers[0], null);
        if (!isNaN(a1)) {
          this.answer1Data = a1;
        }
        if (answers.length > 1) {
          const a2 = parseInt(answers[1], null);
          if (!isNaN(a2)) {
            this.answer2Data = a2;
          }
        }
      }
    } else if (field === 'user' && data && 'userObj' in data) {
      this.user = new User(data['userObj']);
    } else {
      super.setValuesByJsonCore(data, field);
    }
  }

  set answer0(answer: number) {
    this.answer = answer.toString();
  }

  get answer0(): number {
    return this.answer ? parseInt(this.answer, null) : null;
  }

  set answer1(answer: number) {
    this.answer1Data = answer;
    this.setAnswer();
  }

  get answer1(): number {
    return this.answer1Data;
  }

  set answer2(answer: number) {
    this.answer2Data = answer;
    this.setAnswer();
  }

  get answer2(): number {
    return this.answer2Data;
  }

  hasOneAnswer(): boolean {
    if (this.answer0 !== null && this.answer0 !== undefined) {
      return true;
    }
    return false;
  }

  hasTwoAnswers(): boolean {
    if (this.answer1 !== null && this.answer1 !== undefined && this.answer2 !== null && this.answer2 !== undefined) {
      return true;
    }
    return false;
  }

  hasAnswer(): boolean {
    if (this.hasOneAnswer() || this.hasTwoAnswers()) {
      return true;
    }
    return false;
  }

  setAnswer(): void {
    if ((this.answer1Data || this.answer1Data === 0) && (this.answer2Data || this.answer2Data === 0)) {
      this.answer = this.answer1Data + ',' + this.answer2Data;
    } else {
      this.answer = null;
    }
  }

  isValid(): boolean {
    return true;
  }

}
