import { Injectable } from '@angular/core';

import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

import { BaseApiService } from './base-api.service';

import { Round } from '../_models';

@Injectable()
export class RoundsService extends BaseApiService<Round> {
  protected url = '/rounds/';

  // wywoływane po otrzymaniu odpowiedzi - wspólny kod
  protected afterRequestCommon(resp): Round {
    return new Round(resp);
  }

}
