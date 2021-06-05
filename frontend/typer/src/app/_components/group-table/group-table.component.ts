import { Component, Input } from '@angular/core';

import { BaseComponent } from '../common';
import { GroupDetails, GroupTeam } from '../../_models';

@Component({
  selector: 'app-group-table',
  templateUrl: './group-table.component.html',
  styleUrls: ['./group-table.component.scss']
})
export class GroupTableComponent extends BaseComponent {
  @Input() groupDetails: GroupDetails;

  showTable(): boolean {
    return this.groupDetails && this.groupDetails.teams && this.groupDetails.teams.length > 0;
  }

  getGroupDetails(): GroupDetails {
    return this.groupDetails;
  }

  getGoalsDiff(team: GroupTeam): number {
    if ((team.goalsScored || team.goalsScored === 0) && (team.goalsConceded || team.goalsConceded === 0)) {
      return team.goalsScored - team.goalsConceded;
    }
    return null;
  }

}
