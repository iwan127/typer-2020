import { Injectable } from '@angular/core';

import { BaseApiService } from './base-api.service';

import { Page } from '../_models';
import { map } from 'rxjs/operators';

@Injectable()
export class PagesService extends BaseApiService<Page> {
  protected url = '/pages/';
  page: string;

  // wywoływane po otrzymaniu odpowiedzi - wspólny kod
  protected afterRequestCommon(resp): Page {
    return new Page(resp);
  }

  getUrl(urlType: string = 'default', params?: {}): string {
    let url = super.getUrl(urlType, params);
    url += this.page ? this.page + '/' : '';
    return url;
  }
}
