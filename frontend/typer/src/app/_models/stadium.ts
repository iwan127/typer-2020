import { BaseModel } from './base-model';

export class Stadium extends BaseModel {
  id: number = null;
  name: string = null;
  city: string = null;

  constructor(
    options?: any
  ) {
    super();
    this.setValuesByJson(options);
  }
}
