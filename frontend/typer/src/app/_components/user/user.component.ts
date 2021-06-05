import { Component, Input } from '@angular/core';

import { BaseComponent } from '../common';
import { User } from '../../_models';
import { appSettings } from '../../utils/app-settings';
import { SafeResourceUrl } from '@angular/platform-browser';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.scss']
})
export class UserComponent extends BaseComponent {
  @Input() userObj: User = null;
  @Input() avatarSize = 'medium';
  @Input() showDefault = true;
  @Input() showUsername = false;
  @Input() avatarCssClass = 'mr-2';
  @Input() avatarNewUrl: SafeResourceUrl|string;
  @Input() showAsLink = true;
  @Input() linkInheritColor = false;

  get avatarDefaultUrl(): string {
    return appSettings.user.avatar.default.url;
  }

  get avatarUrl(): SafeResourceUrl|string {
    return this.avatarNewUrl !== undefined ? this.avatarNewUrl : this.userObj.avatar;
  }

  get canShowAsLink(): boolean {
    return this.showAsLink && this.userObj && this.userObj.id !== null && this.userObj.id !== undefined;
  }

  getContext(): any {
    const ctx = {
      userObj: this.userObj,
      avatarUrl: this.avatarUrl,
      avatarDefaultUrl: this.avatarDefaultUrl,
      avatarSize: this.avatarSize,
      showUsername: this.showUsername,
      showDefault: this.showDefault,
      avatarCssClass: this.avatarCssClass
    };
    return ctx;
  }
}
