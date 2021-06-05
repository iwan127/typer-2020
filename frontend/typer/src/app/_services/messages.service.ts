import { Injectable } from '@angular/core';
import { Message, MessageTypes } from '../_models';
import { Observable, throwError } from 'rxjs';

@Injectable()
export class MessagesService {
  displayMainMessage = false;
  mainMessageCollapsed = false;
  mainMessageTemporarilyCollapsed = false;

  constructor() {
  }

  // zwraca listę wiadomości
  getMessages(): Array<Message> {
    if (!(window['messages'] instanceof Array)) {
      window['messages'] = [];
    }
    return window['messages'];
  }

  // zwraca listę szybkich wiadomości
  getQuickMessages(): Array<Message> {
    if (!(window['quickMessages'] instanceof Array)) {
      window['quickMessages'] = [];
    }
    return window['quickMessages'];
  }

  // ustawienie wiadomości
  addMessage(options: any, show: boolean = true): void {
    const msg = new Message(options);
    if (msg.quick) {
      this.getQuickMessages().push(msg);
    } else {
      this.getMessages().push(msg);
    }
  }

  // ustawienie wiadomości sukcesu
  addSuccessMessage(text: string, quick: boolean = false, stayAfterRedirect: boolean = false): void {
    this.addMessage({
      type: MessageTypes.SUCCESS,
      title: text,
      quick: quick,
      stayAfterRedirect: stayAfterRedirect
    });
  }

  // ustawienie wiadomości błędu
  addErrorMessage(text: string, quick: boolean = false, stayAfterRedirect: boolean = false): void {
    this.addMessage({
      type: MessageTypes.ERROR,
      title: text,
      quick: quick,
      stayAfterRedirect: stayAfterRedirect
    });
  }

  // ustawianie wiadomości błędu z API
  addErrorMessageFromApi(error: any): void {
    if ('error' in error && error.error) {
      if ('non_field_errors' in error.error) {
        this.addErrorMessage(error.error.non_field_errors);
      }
    }
  }

  // ustawianie wiadomości błędu z API i zwróćenie błędu
  addErrorMessageFromApiObservable(error): Observable<never> {
    this.addErrorMessageFromApi(error);
    return throwError(error);
  }

  // usuwanie wiadomości
  removeMessage(message: Message): void {
    let index;
    if (message.quick) {
      index = this.getQuickMessages().indexOf(message);
      if (index > -1) {
        this.getQuickMessages().splice(index, 1);
      }
    } else {
      index = this.getMessages().indexOf(message);
      if (index > -1) {
        this.getMessages().splice(index, 1);
      }
    }
  }

  // usuwanie wszystkich wiadomości
  removeAllMessages(): void {
    if (window['messages'] instanceof Array) {
      // nie usuwamy wiadomości, które mają 'przeżyć' przekierowanie
      const stayMessages = window['messages'].filter(msg => <Message>msg.stayAfterRedirect);
      window['messages'] = stayMessages;
    }
    window['quickMessages'] = [];
  }

  resetStandedMessages(): void {
    if (window['messages'] instanceof Array) {
      for (let i = 0; i < window['messages'].length; i++) {
        window['messages'][i].stayAfterRedirect = false;
      }
    }
  }

}
