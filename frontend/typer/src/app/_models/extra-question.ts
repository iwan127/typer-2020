import { BaseModel } from './base-model';
import { Group } from './group';

export class ExtraQuestion extends BaseModel {
  id: number = null;
  answerEnabled = true;
  text: string = null;
  points: number = null;
  answerType: number = null;
  group: Group = null;
  possibleAnswers: any[] = null;

  constructor(
    options?: any
  ) {
    super();
    this.setValuesByJson(options);
  }

  // ustawianie pól obiektu na podstawie danych w formacie JSON - główna logika
  protected setValuesByJsonCore(data: {}, field: any): void {
    if (field === 'group' && data && 'groupObj' in data) {
      this.group = new Group(data['groupObj']);
    } else if (field === 'answerType' && data && 'answer_type' in data) {
      this.answerType = data['answer_type'];
    } else if (field === 'answerEnabled' && data && 'answer_enabled' in data) {
      this.answerEnabled = data['answer_enabled'];
    } else if (field === 'possibleAnswers' && data && 'possible_answers' in data) {
      this.possibleAnswers = data['possible_answers'];
    } else {
      super.setValuesByJsonCore(data, field);
    }
  }

  isMultiple(): boolean {
    if (this.answerType === 3 || this.answerType === 4) {
      return true;
    }
    return false;
  }
}
