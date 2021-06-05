import { BaseModel } from './base-model';

export class Score extends BaseModel {
  id: number = null;
  regular: string = null;

  constructor(
    options?: any
  ) {
    super();
    this.setValuesByJson(options);
  }

  print(): string {
    return this.regular;
  }
}
