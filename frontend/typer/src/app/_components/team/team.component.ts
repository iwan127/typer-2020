import { Component, Input } from '@angular/core';

import { BaseComponent } from '../common';
import { Team } from '../../_models';

@Component({
  selector: 'app-team',
  templateUrl: './team.component.html',
  styleUrls: ['./team.component.scss']
})
export class TeamComponent extends BaseComponent {
  @Input() team: Team = null;
  @Input() avatarSize = 'small';
  @Input() avatarRight = false;

}
