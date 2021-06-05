import { BaseModel } from './base-model';

export class Icon extends BaseModel {
  name: string = null;
  library = 'fa';

  constructor(options) {
    super();
    this.setValuesByJson(options);
  }
}
