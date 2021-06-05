import { Injectable } from '@angular/core';

import { BaseApiService } from './base-api.service';

import { ExtraQuestion } from '../_models';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable()
export class ExtraQuestionsService extends BaseApiService<ExtraQuestion> {
  protected url = '/predictions/extra/';

  // wywoływane po otrzymaniu odpowiedzi - wspólny kod
  protected afterRequestCommon(resp): ExtraQuestion {
    return new ExtraQuestion(resp);
  }

}
