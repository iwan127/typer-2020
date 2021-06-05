import { Injectable } from '@angular/core';

import { BaseApiService } from './base-api.service';

import { Prediction } from '../_models';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable()
export class PredictionsService extends BaseApiService<Prediction> {
  protected url = '/predictions/';

  // wywoływane po otrzymaniu odpowiedzi - wspólny kod
  protected afterRequestCommon(resp): Prediction {
    return new Prediction(resp);
  }

  createItems(data: Prediction[]): Observable<any> {
    const url = this.getUrl('list');
    return this.http
      .post(url, data, {headers: this.headers});
      // .pipe(
        // map(resp => {
        //   return this.afterRequestList(resp);
        // }
      // )
    // );
  }

  updateItems(data: Prediction[]): Observable<any> {
    const url = this.getUrl('list');
    return this.http
      .put(url, data, {headers: this.headers});
      // .pipe(
        // map(resp => {
        //   return this.afterRequestList(resp);
        // }
      // )
    // );
  }

  getMatchItemsList(matchId: number): Observable<Array<Prediction>> {
    this.beforeRequest();
    const url = this.baseApiUrl + '/predictions/match/?match=' + matchId;
    return this.http
      .get(url, {headers: this.headers})
      .pipe(
        map(resp => {
          return this.afterRequestList(resp);
        }
      )
    );
  }

}
