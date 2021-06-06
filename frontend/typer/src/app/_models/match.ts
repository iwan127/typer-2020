import { BaseModel } from './base-model';
import { Team } from './team';
import { Stadium } from './stadium';
import { Round } from './round';
import { Group } from './group';
import { Score } from './score';

export class Match extends BaseModel {
  id: number = null;
  teamHome: Team = null;
  teamAway: Team = null;
  datetime: string = null;
  stadium: Stadium = null;
  round: Round = null;
  group: Group = null;
  score: Score = null;
  predictionEnabled = true;

  date: string;
  time: string;
  place: string;
  datetimeObj: Date;
  datetimeString: string;

  protected fkFields: any = {
    teamHome: Team,
    teamAway: Team,
    stadium: Stadium,
    round: Round,
    group: Group,
    score: Score
  };

  constructor(
    options?: any
  ) {
    super();
    this.setValuesByJson(options);
    this.init();
  }

  private init(): void {
    this.datetimeObj = this.getDatetimeObj();
    this.date = this.getDate();
    this.time = this.getTime();
    this.datetimeString = this.getDatetimeString();
    this.place = this.getPlace();
  }

  private getDatetimeObj(): Date {
    // TODO: użyć momentjs
    return new Date(this.datetime);
  }

  private getDatetimeString(): string {
    return this.date + ' ' + this.time;
  }

  private getDate(): string {
    const d = this.datetimeObj;
    return d.toLocaleDateString();
  }

  private getTime(): string {
    const d = this.datetimeObj;
    return d.toLocaleTimeString([], {hour: '2-digit', minute: '2-digit'});
  }

  private getPlace(): string {
    return this.stadium ? this.stadium.name + ', ' + this.stadium.city : null;
  }

  getPlaceStadium(): string {
    return this.stadium ? this.stadium.name : null;
  }

  getPlaceCity(): string {
    return this.stadium ? this.stadium.city : null;
  }

  // ustawianie pól obiektu na podstawie danych w formacie JSON - główna logika
  protected setValuesByJsonCore(data: {}, field: any): void {
    if (field === 'group' && data && 'groupObj' in data) {
      this.group = new Group(data['groupObj']);
    } else if (field === 'round' && data && 'roundObj' in data) {
      this.round = new Round(data['roundObj']);
    } else {
      super.setValuesByJsonCore(data, field);
    }
  }
}
