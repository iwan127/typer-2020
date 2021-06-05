import { Injectable } from '@angular/core';

import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

import { BaseApiService } from './base-api.service';

import { GroupDetails } from '../_models';

@Injectable()
export class GroupsDetailsService extends BaseApiService<GroupDetails> {
  protected url = '/rounds/groups/details/';

  // wywoływane po otrzymaniu odpowiedzi - wspólny kod
  protected afterRequestCommon(resp): GroupDetails {
    return new GroupDetails(resp);
  }
}
