import { Pipe, PipeTransform } from '@angular/core';
import { DomSanitizer } from '@angular/platform-browser';
import { appSettings } from '../utils/app-settings';

@Pipe({ name: 'keepHtml', pure: false })
export class KeepHtmlPipe implements PipeTransform {
  constructor(private sanitizer: DomSanitizer) {
  }

  transform(content: string) {
    const allowedTags = appSettings.allowedTags;
    const strippedContent = allowedTags.length > 0 ? content.replace(
        new RegExp(`<(?!\/?(${allowedTags.join('|')})\s*\/?)[^>]+>`, 'g'), ''
      ) : content.replace(/<(?:.|\s)*?>/g, '');
    return this.sanitizer.bypassSecurityTrustHtml(strippedContent);
  }
}
