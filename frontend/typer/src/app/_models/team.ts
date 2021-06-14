import { BaseModel } from './base-model';

export class Team extends BaseModel {
  id: number = null;
  name: string = null;
  shortname: string = null;
  logo: string = null;
  vertical_logo: boolean = null;
  repeat_logo: boolean = null;

  constructor(
    options?: any
  ) {
    super();
    this.setValuesByJson(options);
  }
}
