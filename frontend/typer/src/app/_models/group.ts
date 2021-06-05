import { GroupBase } from './group-base';
import { Team } from './team';

export class Group extends GroupBase {
  id: number = null;
  name: string = null;
  teams: Array<Team> = null;

  constructor(
    options?: any
  ) {
    super();
    this.setValuesByJson(options);
  }
}
