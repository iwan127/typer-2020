import { BaseModel } from './base-model';
import { MatchGroup } from './match-group';
import { Match } from './match';
import { Round } from './round';

export class MatchRound extends Round {
  groups: MatchGroup[] = null;
  matches: Match[] = null;

  constructor(
    options?: any
  ) {
    super();
    this.setValuesByJson(options);
  }
}
