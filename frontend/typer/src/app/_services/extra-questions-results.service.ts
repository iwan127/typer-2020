import { Injectable } from '@angular/core';

import { ExtraQuestionsService } from './extra-questions.service';

@Injectable()
export class ExtraQuestionsResultsService extends ExtraQuestionsService {
  protected url = '/predictions/extra/finished/';

}
