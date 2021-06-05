import { Injectable } from '@angular/core';

import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

import { BaseApiService } from './base-api.service';

import { Team } from '../_models';

@Injectable()
export class TeamsService extends BaseApiService<Team> {
  protected url = '/teams/';

  // wywoływane po otrzymaniu odpowiedzi - wspólny kod
  protected afterRequestCommon(resp): Team {
    return new Team(resp);
  }

}
