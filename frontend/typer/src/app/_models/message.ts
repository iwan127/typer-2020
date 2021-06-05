import { BaseModel } from './base-model';
import { MessageTypes } from './message-types';

export class Message extends BaseModel {
  type: MessageTypes = null;
  title: string = null;
  desc: string = null;
  shown: boolean = null;
  quick = false;
  stayAfterRedirect = false;

  constructor(
    options?: any
  ) {
    super();
    this.shown = true;
    this.setValuesByJson(options);
  }
}
