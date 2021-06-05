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
  }

  getDatetime(): Date {
    // TODO: użyć momentjs
    return new Date(this.datetime);
  }

  getDatetimeString(): string {
    return this.getDate() + ' ' + this.getTime();
  }

  getDate(): string {
    const d = this.getDatetime();
    return d.toLocaleDateString();
  }

  getTime(): string {
    const d = this.getDatetime();
    return d.toLocaleTimeString([], {hour: '2-digit', minute: '2-digit'});
  }

  getPlace(): string {
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
