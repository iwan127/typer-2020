import { Component, AfterViewChecked, ChangeDetectorRef, OnDestroy } from '@angular/core';
import { Message } from './_models';
import { MessagesService } from './_services';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements AfterViewChecked, OnDestroy {
  messages: Array<Message>;
  quickMessages: Array<Message>;
  private messageTimeoutHandlers = {};

  constructor(
      protected cdRef: ChangeDetectorRef,
      public messagesService: MessagesService
  ) {
  }

  ngAfterViewChecked() {
    // this.messagesService.mainMessageTemporarilyCollapsed = this.messagesService.mainMessageCollapsed ? true : false;
    this.messages = this.messagesService.getMessages();
    this.quickMessages = this.messagesService.getQuickMessages();
    this.quickMessages.forEach(msg => {
      const msgAny = <any> msg;
      if (!(msgAny in this.messageTimeoutHandlers)) {
        this.messageTimeoutHandlers[msgAny] = setTimeout(() => {
          this.closeMessage(msg);
        }, 4000);
      }
    });
    // this.prepareAlertsList();

    // FIX dla ExpressionChangedAfterItHasBeenCheckedError
    this.cdRef.detectChanges();
  }

  // zamknięcie wiadomości
  public closeMessage(message: Message) {
    this.messagesService.removeMessage(<Message>message);
  }

  ngOnDestroy() {
    this.messagesService.removeAllMessages();
  }

  toggleMainMessage(): void {
    this.messagesService.mainMessageTemporarilyCollapsed = !this.messagesService.mainMessageTemporarilyCollapsed;
  }

}
