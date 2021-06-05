import { BaseModel } from './base-model';
import { Team } from './team';

export class GroupTeam extends BaseModel {
  team: Team = null;
  points: number = null;
  goalsScored: number = null;
  goalsConceded: number = null;
  matches: number = null;
  position: number = null;

  constructor(
    options?: any
  ) {
    super();
    this.setValuesByJson(options);
  }

  protected fkFields: any = {
    team: Team
  };

}
