import { BaseModel } from './base-model';
import { User } from './user';

export class UserPoints extends BaseModel {
  id: number = null;
  user: User = null;
  points: number = null;
  nExactScores: number = null;
  nResults: number = null;
  nExtraQuestions: number = null;
  position: number = null;

  constructor(
    options?: any
  ) {
    super();
    this.points = 0;
    this.nExtraQuestions = 0;
    this.setValuesByJson(options);
  }

  protected fkFields: any = {
    user: User
  };

  // ustawianie pól obiektu na podstawie danych w formacie JSON - główna logika
  protected setValuesByJsonCore(data: {}, field: any): void {
    if (field === 'user' && data && 'userObj' in data) {
      this.user = new User(data['userObj']);
    } else {
      super.setValuesByJsonCore(data, field);
    }
  }

  get pointsPredictions(): number {
    const points = this.points ? this.points : 0;
    const extra = this.nExtraQuestions ? this.nExtraQuestions : 0;
    return points - extra;
  }
}
