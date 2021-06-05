import { Injectable } from '@angular/core';

import { BaseApiService } from './base-api.service';

import { Answer } from '../_models';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable()
export class AnswersService extends BaseApiService<Answer> {
  protected url = '/predictions/extra/answers/';

  // wywoływane po otrzymaniu odpowiedzi - wspólny kod
  protected afterRequestCommon(resp): Answer {
    return new Answer(resp);
  }

  createItems(data: Answer[]): Observable<any> {
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

  updateItems(data: Answer[]): Observable<any> {
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

  // pobranie wszystkich odpowiedzi
  getAllItemsList(): Observable<Array<Answer>> {
    this.beforeRequest();
    const url = this.getUrl('list') + 'all/';
    console.log('url', url);
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
