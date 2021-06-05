import { Component, Injector, ViewChild, ElementRef } from '@angular/core';

import * as services from '../../_services';
import { BaseFormComponent } from '../common/base-form/base-form.component';
import { Prediction, Match, User } from '../../_models';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { FormControl, NgForm } from '@angular/forms';
import { catchError } from 'rxjs/operators';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-user-settings',
  templateUrl: './user-settings.component.html',
  styleUrls: ['./user-settings.component.scss']
})
export class UserSettingsComponent extends BaseFormComponent {
  // private userService: services.UserService;
  private sanitizer: DomSanitizer;
  protected fieldNames = ['email', 'username', 'password1', 'password2'];
  showSpinner = true;
  @ViewChild('avatarBrowser') avatarBrowser: ElementRef;
  avatarTempUrl: SafeResourceUrl;
  avatarRemoved = false;
  userObj: User;

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.sanitizer = injectorObj.get(DomSanitizer);
    // this.userService = injectorObj.get(services.UserService);
  }

  afterGetUser(): void {
    this.userService.getItem(this.user).subscribe(data => {
      this.userService.currentUser = data;
      this.userObj = new User(this.user);
      this.setLoaded();
    });
  }

  getAvatarUploadLabel(): string {
    return this.userObj.avatar || this.userObj.avatarFile ? 'Zmień' : 'Dodaj';
  }

  afterAvatarChanged(): void {
    if (this.avatarTempUrl) {
      window.URL.revokeObjectURL(this.avatarTempUrl.toString());
    }
    if (this.avatarBrowser && this.avatarBrowser.nativeElement) {
      const avatarFile = this.getAvatarFile();
      if (avatarFile) {
        this.avatarTempUrl = this.sanitizer.bypassSecurityTrustResourceUrl(
          window.URL.createObjectURL(avatarFile)
        );
      }
    } else {
      this.avatarTempUrl = undefined;
    }
  }

  removeAvatar(): void {
    this.avatarRemoved = true;
    this.avatarTempUrl = null;
    this.userObj.avatar = null;
    this.userObj.avatarFile = null;
    this.getAvatarInput().value = null;
  }

  getAvatarInput(): HTMLInputElement {
    return this.avatarBrowser.nativeElement;
  }

  getAvatarFile(): any {
    const input = this.getAvatarInput();
    if (input.files.length) {
      return input.files[0];
    }
    return null;
  }

  submit(): void {
    this.messagesService.removeAllMessages();
    const fd = new FormData();
    fd.set('email', this.userObj.email);
    fd.set('nickname', this.userObj.nickname);
    const avatarFile = this.getAvatarFile();
    if (avatarFile) {
      fd.append('avatar', avatarFile, avatarFile.name);
    } else if (this.avatarRemoved) {
      fd.append('avatar', null);
    }
    this.userService.updateItemWithFormData(this.userObj, fd)
      .pipe(
        catchError((error: any, caught: Observable<User>) => {
          return this.addErrorsObservable(error);
        })
      ).subscribe(data => {
        this.user = new User(data);
        const d = new Date();
        this.user.avatar = this.user.avatar + '?' + d.valueOf().toString();
        this.messagesService.addSuccessMessage('Zapisano');
      });
  }

  submitEnabled(form: NgForm): boolean {
    // console.log(form.form.touched, form.form.dirty, form.form.pristine);
    return form.form.dirty && form.form.valid ? null : true;
  }

}
