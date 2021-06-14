import { Injectable, Injector } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';

// import 'rxjs/add/operator/map';
// import 'rxjs/add/observable/of';
// import 'rxjs/add/operator/catch';
// import 'rxjs/add/observable/throw';

import { environment } from '../../environments/environment';
// import { ErrorService } from './error.service';
import { Observable, of, throwError } from 'rxjs';
import { map, catchError } from 'rxjs/operators';
import { MessagesService } from './messages.service';

@Injectable()
export class BaseApiService<T> {
  protected http: HttpClient;
  messagesService: MessagesService;
  protected headers = new HttpHeaders({'Content-Type': 'application/json'});
  protected baseApiUrl: string = environment.apiBaseUrl;
  protected url = '';
  protected urlPart: string = null;
  protected parentId: number;
  protected adminMode = false;
  protected tmpAdminMode: boolean;
  protected primaryId = 'id';
  protected listPrimaryId: number;
  protected listPrimaryKey: string;
  goToErrorPageOnError = false;

  constructor(protected injectorObj: Injector) {
    this.http = this.injectorObj.get(HttpClient);
    this.messagesService = this.injectorObj.get(MessagesService);
    this.setAuthHeader();
    this.initService();
  }

  setAuthHeader(): void {
    const token = this.getToken();
    if (token && !this.headers.has('Authorization')) {
      this.headers = this.headers.set('Authorization', 'Token ' + token);
    }
  }

  getToken(): string {
    return localStorage.getItem('access_token');
    // d07e6df14fc50af079d8f4539cf0c133d763e714
  }

  // metoda dla klas podrzędnych
  initService(): void {
  }

  // wywoływane przed wysłaniem requesta
  beforeRequest(): void {
  }

  // metoda dla klas podrzędnych
  initUrl(): void {
  }

  // włączenie trybu admina
  enableAdminMode(): void {
    this.adminMode = true;
  }

  disableAdminMode(): void {
    this.adminMode = false;
  }

  // tymczasowe wyłączenie trybu admina
  temporaryDisableAdminMode(): void {
    this.tmpAdminMode = false;
  }

  // ustawienie id parenta obiektu
  setParentId(id: number): void {
    this.parentId = id;
  }

  // ustawienie id dla listy obiektów
  setListPrimaryId(id: number): void {
    this.listPrimaryId = id;
  }

  // ustawienie klucza dla parametru GET dla listy obiektów
  setListPrimaryKey(key: string): void {
    this.listPrimaryKey = key;
  }

  // ustawienie klucza będącego PK obiektu
  setPrimaryId(id: string): void {
    this.primaryId = id;
  }

  // ustawienie urla do api
  setUrl(url: string): void {
    this.url = url;
  }

  getUrl(urlType: string = 'default', params?: {}): string {
    let url = this.baseApiUrl;
    if (this.adminMode && this.tmpAdminMode !== false) {
      url += '/admin';
    }
    if (this.adminMode && this.tmpAdminMode === false) {
      this.tmpAdminMode = null;
    }
    this.initUrl();
    url = url + this.url + (this.parentId ? this.parentId + '/' : '') + (this.urlPart ? this.urlPart + '/' : '');
    switch (urlType) {
      case 'list':
        url += this.listPrimaryId && this.listPrimaryKey ? '?' + this.listPrimaryKey + '=' + this.listPrimaryId : '';
        break;
      default:
        url += params && params.hasOwnProperty(this.primaryId) ? `${params[this.primaryId]}/` : '';
        break;
    }
    return url;
  }

  // ustawienie części urla do API
  setUrlPart(urlPart: string): void {
    this.urlPart = urlPart;
  }

  getItemsList(): Observable<Array<T>> {
    this.beforeRequest();
    const url = this.getUrl('list');
    return this.http
      .get(url, {headers: this.headers})
      .pipe(
        map(resp => {
          return this.afterRequestList(resp);
        }
      )
    );
  }

  private convertElements(array: Array<any>): Array<T> {
    const result = new Array<T>();
    array.forEach(element => {
      result.push(this.afterRequestCommon(element));
    });
    return result;
  }

  // wywoływane po otrzymaniu listy obiektów
  protected afterRequestList(resp): Array<T> {
    let array = null;
    if (resp instanceof Array) {
      array = resp;
    } else if (resp.hasOwnProperty('content')) {
      array = resp.content;
    }
    if (array == null) {
      return null;
    }
    return this.convertElements(array);
  }

  // pobranie szczegółów obiektu
  getItem(item: any): Observable<T> {
    this.beforeRequest();
    return this.http
      .get(this.getUrl('default', item), {headers: this.headers})
      .pipe(
        map(resp => {
          return this.afterRequestDetails(resp);
        }),
        catchError((error: any, caught: Observable<T>) => {
          return this.handleItemError(error, caught);
        })
      );
  }

  // wyszukiwanie po parametrach
  getItems(params: any): Observable<Array<T>> {
    this.beforeRequest();
    return this.http
      .get(`${this.getUrl('default')}`, { params: params, headers: this.headers })
      .pipe(
        map(resp => {
          return this.afterRequestCommonArray(resp);
        }),
        catchError((error: any, caught: Observable<Array<T>>) => {
          return this.handleItemsError(error, caught);
        })
      );
  }


  // wywoływane po otrzymaniu szczegółów obiektu
  protected afterRequestDetails(resp): T {
    return this.afterRequestCommon(resp);
  }

  // tworzenie obiektu
  createItem(item: any): Observable<T> {
    this.beforeRequest();
    return this.http
      .post(`${this.getUrl()}`, item, {headers: this.headers})
      .pipe(
        map(resp => {
          return this.afterRequestCreate(resp);
        }),
        catchError((error: any, caught: Observable<T>) => {
          return this.handleItemError(error, caught);
        })
      );
  }

  // podobnie jak createItem ale zwraca cokolwiek (np. String) a nie obiekt typu T
  createItemObject(item: any): Observable<Object> {
    this.beforeRequest();
    return this.http
      .post(`${this.getUrl()}`, item, { responseType: 'text', headers: this.headers })
      .pipe(
        catchError((error: any, caught: Observable<Object>) => {
          return this.handleItemError(error, caught);
        })
      );
  }

  // wywoływane po otrzymaniu odpowiedzi po utworzeniu obiektu
  protected afterRequestCreate(resp): T {
    return this.afterRequestCommon(resp);
  }

  // aktualizacja obiektu
  updateItem(item: any): Observable<T> {
    this.beforeRequest();
    return this.http
      .put(`${this.getUrl('default', item)}`, item, {headers: this.headers})
      .pipe(
        map(resp => {
          return this.afterRequestUpdate(resp);
        }),
        catchError((error: any, caught: Observable<T>) => {
          return this.handleItemError(error, caught);
        })
      );
  }

  // podobnie jak updateItem ale zwraca cokolwiek (np. String) a nie obiekt typu T
  updateItemObject(item: any): Observable<Object> {
    this.beforeRequest();
    return this.http
      .put(`${this.getUrl('default', item)}`, item, { responseType: 'text', headers: this.headers })
      .pipe(
        catchError((error: any, caught: Observable<Object>) => {
          return this.handleItemError(error, caught);
        })
      );
  }

  // wywoływane po otrzymaniu odpowiedzi po aktualizacji obiektu
  protected afterRequestUpdate(resp): T {
    return this.afterRequestCommon(resp);
  }

  // usunięcie obiektu
  deleteItem(item: any): Observable<T> {
    this.beforeRequest();
    return this.http
      .delete(`${this.getUrl('default', item)}`, {headers: this.headers})
      .pipe(
        map(resp => {
          return this.afterRequestDelete(resp);
        }),
        catchError((error: any, caught: Observable<T>) => {
          return this.handleItemError(error, caught);
        })
      );
  }

  // wywoływane po otrzymaniu odpowiedzi po usunięciu obiektu
  protected afterRequestDelete(resp): T {
    return this.afterRequestCommon(resp);
  }

  // wywoływane po otrzymaniu odpowiedzi - wspólny kod
  protected afterRequestCommon(resp): T {
    return resp;
  }

  protected afterRequestCommonArray(resp): Array<T> {
    return resp;
  }

  // tworzenie lub aktualizacja obiektu
  createOrUpdateItem(item: any): Observable<T> {
    if (this.primaryId in item && item[this.primaryId]) {
      return this.updateItem(item);
    } else {
      return this.createItem(item);
    }
  }

  // tworzenie lub akutalizacja obiektu na podstawie flagi isEdit
  createOrUpdateItemWithEditFlag(item: any, isEdit: boolean): Observable<T> {
    if (isEdit) {
      return this.updateItem(item);
    } else {
      return this.createItem(item);
    }
  }

  // obsługa błędu dla jednego obiektu
  handleItemError(error: any, caught: Observable<any>): Observable<never> {
    console.error('Błędna odpowiedź z serwera w serwisie: ' + error);
    this.messagesService.addErrorMessageFromApi(error);
    this.goToErrorPage(error);
    return throwError(error);
  }

  // obsługa błędu dla listy obiektów
  handleItemsError(error: any, caught: Observable<Array<T>>): Observable<never> {
    console.error('Błędna odpowiedź z serwera w serwisie: ' + error);
    this.goToErrorPage(error);
    return throwError(error);
  }

  // przekierowanie na stronę błędu (jeśli jest to możliwe)
  goToErrorPage(error: any): void {
    if (this.goToErrorPageOnError) {
      // this.errorService.setErrorCode(error.status);
      // this.errorService.goToErrorPage();
    }
  }

  parseModelErrorObj(error: any): string {
    if (error !== undefined) {
      if (error != null && error.hasOwnProperty('error')) {
        const errorObj = error['error'];
        if (errorObj != null && errorObj.hasOwnProperty('error')) {
          const msg = errorObj['error'];
          return msg;
        } else if (error.hasOwnProperty('status') && error.hasOwnProperty('statusText')) {
          console.error('Bład ' + error['status'] + ', czyli: ' + error['statusText']);
          return 'Wystąpił błąd w komunikacji z serwerem (kod błędu: ' + error['status'] + ') . Spróbuj ponownie później.';
        } else {
          console.error('Błąd w komunikacji z serwerem: ' + error);
          return 'Wystąpił błąd w komunikacji z serwerem. Spróbuj ponownie później.';
        }
      } else {
        return 'Wystąpił błąd w komunikacji z serwerem. Spróbuj ponownie później.';
      }
    }
    return null;
  }
}
