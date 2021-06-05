import { Injectable } from '@angular/core';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { Route, Router } from '@angular/router';

import { Observable, of as observableOf, throwError } from 'rxjs';
import { map, catchError } from 'rxjs/operators';

import { environment } from '../../environments/environment';
import { BaseApiService } from './base-api.service';
import { User } from '../_models/user';
import { UserService } from './user.service';
import { MessagesService } from './messages.service';

const httpOptions = {
  headers: new Headers({ 'Content-Type': 'application/json' })
};

@Injectable()
export class AuthService {
  protected headers = new HttpHeaders({'Content-Type': 'application/json'});
  protected baseApiUrl: string = environment.apiBaseUrl;
  protected authApiUrl: string = environment.apiAuthUrl;
  error: any;

  constructor(
      protected http: HttpClient,
      private router: Router,
      protected userService: UserService,
      protected messagesService: MessagesService
  ) {
  }

  logout() {
    this.http.post(this.getUrl('logout'), {headers: this.headers}).pipe(
      map(resp => {
        this.removeToken();
        this.userService.resetCurrentUser();
        // this.userService.removeFromGlobal();
        this.redirectToLogin();
        return true;
      }),
      catchError((error: any, caught: Observable<boolean>) => {
        this.error = error;
        return observableOf(false);
      })
    ).subscribe(data => {
      return data;
    });
  }

  getToken(): string {
    return localStorage.getItem('access_token');
    // d07e6df14fc50af079d8f4539cf0c133d763e714
  }

  setToken(token: string): void {
    localStorage.setItem('access_token', token);
  }

  removeToken(): void {
    localStorage.removeItem('access_token');
  }

  getError(): any {
    const error = this.error;
    this.error = null;
    return error;
  }

  getUrl(type: string): string {
    switch (type) {
      case 'login':
        return this.authApiUrl + 'login/';
      case 'logout':
        return this.authApiUrl + 'logout/';
      case 'register':
        return this.authApiUrl + 'registration/';
      case 'reset-password':
        return this.authApiUrl + 'reset-password/';
    }
    return '';
  }

  register(userData: any): Observable<boolean> {
    return this.http.post(this.getUrl('register'), userData, {headers: this.headers}).pipe(
      map(resp => {
        return true;
      }),
      catchError((error: any, caught: Observable<boolean>) => {
        this.error = error;
        this.messagesService.addErrorMessageFromApi(error);
        return throwError(error);
      })
    );
  }

  activate(data: any): Observable<boolean> {
    return this.http.post(this.getUrl('activate'), data, {headers: this.headers}).pipe(
      map(resp => {
        return true;
      }),
      catchError((error: any, caught: Observable<boolean>) => {
        this.error = error;
        this.messagesService.addErrorMessageFromApi(error);
        return throwError(error);
      })
    );
  }

  resetPassword(data: any): Observable<any> {
    return this.http
      .post('/auth/password/reset/', data)
      .pipe(
        catchError((error: any, caught: Observable<boolean>) => {
          this.error = error;
          this.messagesService.addErrorMessageFromApi(error);
          return throwError(error);
        })
      );
  }

  confirmResetPassword(data: any): Observable<any> {
    return this.http
      .post('/auth/password/reset/confirm/', data)
      .pipe(
        catchError((error: any, caught: Observable<any>) => {
          this.error = error;
          this.messagesService.addErrorMessageFromApi(error);
          return throwError(error);
        })
      );
  }

  login(dataJson: any): Observable<boolean> {
    // const data = new FormData();
    // data.append('username', dataJson.username);
    // data.append('password', dataJson.password);
    const data = [];
    for (const property in dataJson) {
      if (property in dataJson) {
        const encodedKey = encodeURIComponent(property);
        const encodedValue = encodeURIComponent(dataJson[property]);
        data.push(encodedKey + '=' + encodedValue);
      }
    }
    const dataStr = data.join('&');
    const headers = new HttpHeaders({'Content-Type': 'application/x-www-form-urlencoded'});
    this.messagesService.removeAllMessages();
    return this.http.post(this.getUrl('login'), dataStr, {headers: headers}).pipe(
      map(resp => {
        if ('key' in resp) {
          this.messagesService.mainMessageCollapsed = false;
          this.messagesService.mainMessageTemporarilyCollapsed = false;
          this.setToken(resp['key']);
          this.userService.getCurrentUser(true).subscribe(user => {
            this.redirectToHome();
          });
          return true;
        }
        return false;
      }),
      catchError((error: any, caught: Observable<boolean>) => {
        this.error = error;
        this.messagesService.addErrorMessageFromApi(error);
        return observableOf(false);
      })
    );
  }

  isAuthenticated(): boolean {
    // if (tokenNotExpired()) {
    //   return true;
    // }
    // this.logout();
    return true;
    /*let userOrig = localStorage.getItem('user');
    if (userOrig) {
      let user = JSON.parse(userOrig);
      if (user && user.hasOwnProperty('token') && user.token) {
        return true;
      }
    }
    return false;*/
  }

  canActivate(path: string): Promise<boolean> {
    // if (this.isAuthenticated()) {
      return observableOf<boolean>(true).toPromise();
      // API FAKE
      /*return this.http.get(
        `${this.urlUserPermissions}?username=${this.getUser().username}&url=${path}`
      ).map(resp => {
        if (resp.json().length) {
          return true;
        }
        return false;
      }).toPromise();*/
    // }
    // return Promise.resolve(false);
  }

  getUser(): User {
    if (this.isAuthenticated()) {
      const user = new User({
        isAuthenticated: true,
        firstname: 'Wojciech',
        lastname: 'Iwaniszewski',
        username: 'iwan',
        avatar: 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Logo_FC_Bayern_M%C3%BCnchen_%282002%E2%80%932017%29.svg'
      });
      return user;
    }
    return null;
  }

  getUserAccessToken(): string {
    if (this.isAuthenticated()) {
      return localStorage.getItem('token');
    }
    return null;
  }

  redirectToLogin(): void {
    this.router.navigate(['/login']);
  }

  redirectToHome(): void {
    this.router.navigate(['/']);
  }

  enableMainMessage(): void {
    this.messagesService.displayMainMessage = true;
  }

  disableMainMessage(): void {
    this.messagesService.displayMainMessage = false;
  }

}
