import { Component, OnInit, ChangeDetectorRef, AfterViewChecked, Injector, OnDestroy } from '@angular/core';

import { SpinnerService, UserService, MessagesService } from '../../../_services';
import { User } from '../../../_models';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-base',
  templateUrl: './base.component.html'
})
export class BaseComponent implements OnInit, AfterViewChecked, OnDestroy {
  protected cdRef: ChangeDetectorRef;
  private route: ActivatedRoute;
  protected userService: UserService;
  protected activatedRoute: ActivatedRoute;
  spinnerService: SpinnerService;
  messagesService: MessagesService;
  loaded = false;
  showSpinner = false;

  constructor(protected injectorObj: Injector) {
    this.cdRef = this.injectorObj.get(ChangeDetectorRef);
    this.spinnerService = injectorObj.get(SpinnerService);
    this.userService = this.injectorObj.get(UserService);
    this.route = this.injectorObj.get(ActivatedRoute);
    this.activatedRoute = this.injectorObj.get(ActivatedRoute);
    this.messagesService = this.injectorObj.get(MessagesService);
    this.messagesService.mainMessageCollapsed = true;
  }

  ngOnInit() {
    this.messagesService.resetStandedMessages();
    this.getUser();
    if (this.showSpinner) {
      this.spinnerService.show();
    }
    this.actionsOnInit();
  }

  get user(): User {
    return this.userService.currentUser;
  }

  set user(user: User) {
    this.userService.currentUser = user;
  }

  getUser(): void {
    // this.user = this.userService.currentUser;
    /*console.log('getUser');
    if (!this.user) {
      this.route.data.subscribe(
        (data: { user: User }) => {
          this.user = data.user;
          console.log('user', this.user);
          this.afterGetUser();
        },
      );
    } else {*/
    // console.log('getUser', this.user);
    this.afterGetUser();
  }

  // pobranie zmiennej z parametrów GET
  getUrlParam(name: string, type?: string): any {
    let val = null;
    if (this.activatedRoute.snapshot.paramMap['params'].hasOwnProperty(name)) {
      val = this.activatedRoute.snapshot.paramMap['params'][name];
      if (type === 'number' && !isNaN(val)) {
        val = parseInt(val, null);
      }
    }
    return val;
  }

  afterGetUser(): void {
  }

  actionsOnInit(): void {
  }

  ngAfterViewChecked() {
    // FIX dla ExpressionChangedAfterItHasBeenCheckedError
    this.cdRef.detectChanges();
    this.actionsOnViewChecked();
  }

  actionsOnViewChecked(): void {
  }

  hideExpandedMenu(): void {
    const menu: HTMLElement = document.getElementById('mainMenu');
    const menuToggler: HTMLElement = document.getElementById('mainMenuToggler');

    if (menu && menuToggler) {
      menuToggler.setAttribute('aria-expanded', 'false');
      menuToggler.classList.add('collapsed');
      menu.classList.remove('show');
    }
  }

  ngOnDestroy() {
    this.messagesService.removeAllMessages();
    this.hideExpandedMenu();
    this.messagesService.mainMessageTemporarilyCollapsed = true;
  }

  setLoaded(): void {
    setTimeout(() => {
      this.loaded = true;
      this.spinnerService.hide();
    }, 500);
  }

}
