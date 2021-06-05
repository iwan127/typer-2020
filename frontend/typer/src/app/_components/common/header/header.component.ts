import { Component, Injector, HostListener } from '@angular/core';

import { MenuItem, User, Icon } from '../../../_models';
import { BaseComponent } from '../base/base.component';
import { UserService } from '../../../_services';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent extends BaseComponent {
  private usersService: UserService;
  private smBreakpoint = 576;
  mobileMenuVisible = false;

  menuItems: MenuItem[];

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.usersService = this.injectorObj.get(UserService);
    this.setMobileMenuVisibility();
  }

  setMobileMenuVisibility(): void {
    this.mobileMenuVisible = window.innerWidth < this.smBreakpoint;
  }

  // przechwycenie zdarzenia zmiany rozmiaru okna
  @HostListener('window:resize', ['$event'])
  onResize(event): void {
    this.setMobileMenuVisibility();
  }

  private prepareMenuItems(): void {
    this.menuItems = [
      new MenuItem({label: 'Mecze', url: ['/', 'matches'], icon: 'list'}),
      new MenuItem({label: 'Typy', url: ['/', 'predictions'], icon: 'dice'}),
      new MenuItem({label: 'Ranking', url: ['/', 'rank'], icon: 'trophy'}), // fa-list-ol
      new MenuItem({label: 'Zasady', url: ['/', 'rules'], icon: new Icon({name: 'info-circle', library: 'fas'})})
    ];
  }

  afterGetUser(): void {
    this.prepareMenuItems();
  }

  // wylogowanie użytkownika
  logout(): void {
    // TODO
  }

}
