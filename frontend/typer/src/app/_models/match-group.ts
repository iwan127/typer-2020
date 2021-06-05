import { BaseModel } from './base-model';
import { Match } from './match';
import { Group } from './group';

export class MatchGroup extends Group {
  matches: Match[] = null;

  constructor(
    options?: any
  ) {
    super();
    this.setValuesByJson(options);
  }
}
