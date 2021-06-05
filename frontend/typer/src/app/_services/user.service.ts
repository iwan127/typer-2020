import { Injectable } from '@angular/core';

import { Observable, of } from 'rxjs';
import { map, catchError } from 'rxjs/operators';

import { BaseApiService } from './base-api.service';
import { User } from '../_models/user';

import { environment } from '../../environments/environment';

@Injectable()
export class UserService extends BaseApiService<User> {
  // private url = this.baseApiUrl + '/test-me';
  protected url = '/users/';
  goToErrorPageOnError = true;
  currentUser: User;

  // wywoływane po otrzymaniu szczegółów obiektu
  protected afterRequestDetails(resp): User {
    const user = new User(resp);
    // this.saveGlobal(user);
    return user;
  }

  changePassword(data: any): Observable<any> {
    return this.http
      .post('/auth/password/change/', data)
      .pipe(
        catchError((error: any, caught: Observable<any>) => {
          return this.handleItemError(error, caught);
        })
      );
  }

  setCurrentUser(): Observable<User> {
    return this.http.get(this.baseApiUrl + this.url + 'current/').pipe(
      map(data => {
        const usr = this.afterRequestDetails(data);
        this.currentUser = usr;
        return usr;
      }),
      catchError((err: any, caught: Observable<User>) => {
        return <Observable<User>> of<User>(null);
      })
    );
  }

  resetCurrentUser(): void {
    this.currentUser = null;
  }

  // pobranie zalogowanego użytkownika z bazy lub z 'window'
  getCurrentUser(force?: boolean): Observable<User> {
    const user = this.currentUser; // || this.getFromGlobal();
    if (force || !user) {
      return this.setCurrentUser();
      // return super.getItem(user);
    } else {
      return of<User>(user);
    }
  }

  // dodanie użytkownika do 'window', żeby był dostępny globalnie
  saveGlobal(user: User): void {
    console.log('set', user ? user['id'] : null);
    window['currentUser'] = user;
    this.currentUser = user;
  }

  // pobranie użytkownika z 'window'
  getFromGlobal(): User {
    return window.hasOwnProperty('currentUser') ? window['currentUser'] : null;
  }

  // usunięcie użytkownika z 'window'
  removeFromGlobal(): void {
    if (window.hasOwnProperty('currentUser')) {
      delete window['currentUser'];
      this.currentUser = null;
    }
  }

  // aktualizacja obiektu usera
  updateItemWithFormData(item: any, formData: FormData): Observable<User> {
    // const headers = this.headers.set('Content-Type', 'multipart/form-data');
    const headers = this.headers.delete('Content-Type');
    this.beforeRequest();
    return this.http
      .patch(`${this.getUrl('default', item)}`, formData, {headers: headers})
      .pipe(
        map(resp => {
          return this.afterRequestUpdate(resp);
        }),
        catchError((error: any, caught: Observable<User>) => {
          return this.handleItemError(error, caught);
        })
      );
  }

  // pobranie szczegółów obiektu (w trybie tylko do odczytu)
  getItemPreview(item: any): Observable<User> {
    this.beforeRequest();
    return this.http
      .get(this.getUrl('default', item) + 'preview/', {headers: this.headers})
      .pipe(
        map(resp => {
          return this.afterRequestDetails(resp);
        }),
        catchError((error: any, caught: Observable<User>) => {
          return this.handleItemError(error, caught);
        })
      );
  }
}
