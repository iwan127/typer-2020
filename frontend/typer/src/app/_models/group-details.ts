import { BaseModel } from './base-model';
import { GroupTeam } from './group-team';
import { GroupBase } from './group-base';

export class GroupDetails extends GroupBase {
  teams: GroupTeam[] = null;

  protected fkFields: any = {
    teams: GroupTeam
  };

  constructor(
    options?: any
  ) {
    super();
    this.setValuesByJson(options);
  }

  // ustawianie pól obiektu na podstawie danych w formacie JSON - główna logika
  // protected setValuesByJsonCore(data: {}, field: any): void {
  //   if (field === 'group' && data && 'groupObj' in data) {
  //     this.group = new Group(data['groupObj']);
  //   } else {
  //     super.setValuesByJsonCore(data, field);
  //   }
  // }
}
