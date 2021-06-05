import { Pipe, PipeTransform } from '@angular/core';
import { appSettings } from '../utils/app-settings';

@Pipe({ name: 'plural', pure: false })
export class PluralPipe implements PipeTransform {

  transform(str: string, n: number) {
    if (str in appSettings.plural.words && appSettings.plural.words[str] instanceof Array && appSettings.plural.words[str].length > 2) {
      let ret;
      const wordForms = appSettings.plural.words[str];
      const mod = n % 10;
      if (n === 1) {
        ret = 0;
      } else {
        if (mod === 2 || mod === 3 || mod === 4 && (n !== 12 && n !== 13 && n !== 14)) {
          ret = 1;
        } else {
          ret = 2;
        }
      }
      return appSettings.plural.words[str][ret];
    }
    return null;
  }
}
