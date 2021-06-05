import { BaseModel } from './base-model';

export class Page extends BaseModel {
  content: string = null;

  constructor(
    options?: any
  ) {
    super();
    this.setValuesByJson(options);
  }
}
