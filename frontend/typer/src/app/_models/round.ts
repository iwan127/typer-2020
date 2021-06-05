import { BaseModel } from './base-model';

export enum GROUPSTAGE {
  GROUPSTAGE = 1,
  ROUND_OF_16 = 2,
  QUATERFINAL = 3,
  SEMIFINAL = 4,
  FINAL = 5
}

export const periodTypesList = [
  {value: GROUPSTAGE.GROUPSTAGE, label: 'Faza grupowa'},
  {value: GROUPSTAGE.ROUND_OF_16, label: '1/8 finału'},
  {value: GROUPSTAGE.QUATERFINAL, label: 'Ćwierćfinał'},
  {value: GROUPSTAGE.SEMIFINAL, label: 'Półfinał'},
  {value: GROUPSTAGE.FINAL, label: 'Finał'}
];

export class Round extends BaseModel {
  id: number = null;
  name: string = null;
  shortname: string = null;
  roundType: GROUPSTAGE = null;

  constructor(
    options?: any
  ) {
    super();
    this.setValuesByJson(options);
  }

  isGroupstage(): boolean {
    return this.roundType === GROUPSTAGE.GROUPSTAGE;
  }
}
