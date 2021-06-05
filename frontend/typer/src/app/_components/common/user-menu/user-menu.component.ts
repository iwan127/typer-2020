import { Component, Input, Injector } from '@angular/core';

import { MenuItem, User } from '../../../_models';
import { BaseComponent } from '../base/base.component';
import { UserService, AuthService } from '../../../_services';

@Component({
  selector: 'app-user-menu',
  templateUrl: './user-menu.component.html',
  styleUrls: ['./user-menu.component.scss']
})
export class UserMenuComponent extends BaseComponent {
  private usersService: UserService;
  private authService: AuthService;
  menuItems: MenuItem[];
  fakeParent: MenuItem;
  @Input() userObj: User;

  constructor(protected injectorObj: Injector) {
    super(injectorObj);
    this.usersService = injectorObj.get(UserService);
    this.authService = injectorObj.get(AuthService);
  }

  actionsOnInit(): void {
    this.prepareMenuItems();
  }

  private prepareMenuItems(): void {
    this.fakeParent = new MenuItem({
      expanded: true
    });
    this.menuItems = [
      new MenuItem({label: 'Ustawienia konta', url: ['/', 'settings'], icon: 'user-cog'}),
      new MenuItem({label: 'Wyloguj', click: (event) => { this.authService.logout(); }, icon: 'sign-out-alt'})
    ];
  }

  // wylogowanie użytkownika
  logout(): void {
    // TODO
  }

}
