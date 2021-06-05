import { BaseModel } from './base-model';
import { Team } from './team';

export class GroupBase extends BaseModel {
  id: number = null;
  name: string = null;

  constructor(
    options?: any
  ) {
    super();
    this.setValuesByJson(options);
  }
}
