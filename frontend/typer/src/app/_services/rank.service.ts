import { Injectable } from '@angular/core';

import { BaseApiService } from './base-api.service';

import { UserPoints } from '../_models';

@Injectable()
export class RankService extends BaseApiService<UserPoints> {
  protected url = '/predictions/ranking/';

  // wywoływane po otrzymaniu odpowiedzi - wspólny kod
  protected afterRequestCommon(resp): UserPoints {
    return new UserPoints(resp);
  }

  // wywoływane po otrzymaniu listy obiektów
  protected afterRequestList(resp): Array<UserPoints> {
    const ret = super.afterRequestList(resp);
    this.setPositions(ret);
    return ret;
  }

  setPositions(ups: UserPoints[]): void {
    let prevUp: UserPoints = null, position = 1;
    ups.forEach(up => {
      if (prevUp === null || up.points !== prevUp.points || up.nExactScores !== prevUp.nExactScores || up.nResults !== prevUp.nResults) {
        up.position = position;
      }
      prevUp = up;
      position++;
    });
  }
}
