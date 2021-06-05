import { BaseModel } from './base-model';
import { User } from './user';
import { Match } from './match';

export class Prediction extends BaseModel {
  id: number = null;
  user: User = null;
  match: Match = null;
  matchId: number = null;
  goalsHome: number = null;
  goalsAway: number = null;
  prevGoalsHome: number = null;
  prevGoalsAway: number = null;
  points: number = null;
  editable = true;
  forceDisabled = false;
  markedSuccess = false;
  markedError = false;
  errorGoalsHome: string = null;
  errorGoalsAway: string = null;

  constructor(
    options?: any
  ) {
    super();
    this.setValuesByJson(options);
    this.matchId = this.match ? this.match.id : null;
  }

  private isInteger(val: any): boolean {
    return /^\+?(0|[1-9]\d*)$/.test(val.toString());
  }

  goalsValid(goals: number, checkEmpty: boolean = false): boolean {
    let isNotEmpty = true;
    if (checkEmpty) {
      isNotEmpty = goals !== null && goals !== undefined ? true : false;
    }
    return (isNotEmpty && this.isInteger(goals) && goals >= 0);
  }

  goalsHomeAwaySet(): boolean {
    if (!this.goalsAway && this.goalsAway !== 0 && !this.goalsHome && this.goalsHome !== 0) {
      return false;
    }
    return true;
  }

  goalsHomeValid(): boolean {
    if (this.goalsHomeAwaySet()) {
      return this.goalsValid(this.goalsHome, true);
    }
    return true;
  }

  goalsAwayValid(): boolean {
    if (this.goalsHomeAwaySet()) {
      return this.goalsValid(this.goalsAway, true);
    }
    return true;
  }

  isValid(): boolean {
    return this.goalsHomeValid() && this.goalsAwayValid();
  }

  // ustawianie pól obiektu na podstawie danych w formacie JSON - główna logika
  protected setValuesByJsonCore(data: {}, field: any): void {
    if (field === 'match' && data && 'matchId' in data) {
      this.match = new Match({
        id: data['matchId']
      });
    } else if (field === 'user' && data && 'userObj' in data) {
      this.user = new User(data['userObj']);
    } else {
      super.setValuesByJsonCore(data, field);
    }
  }
}
