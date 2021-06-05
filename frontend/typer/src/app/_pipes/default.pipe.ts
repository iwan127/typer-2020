import { Pipe, PipeTransform } from '@angular/core';

@Pipe({ name: 'default', pure: false })
export class DefaultPipe implements PipeTransform {

  transform(content: string, def: string = '') {
    return content !== undefined && content !== null ? content : def;
  }
}
