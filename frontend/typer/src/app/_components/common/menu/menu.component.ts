import { Component, Input } from '@angular/core';

import { MenuItem } from '../../../_models';
import { BaseComponent } from '../base/base.component';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.scss']
})
export class MenuComponent extends BaseComponent {
  @Input() menuItems: MenuItem[];
  @Input() level: number = null;
  @Input() parent: MenuItem;
  @Input() cssClass: string;
  @Input() marginItem = false;

  actionsOnInit(): void {
    if (this.level === null) {
      this.level = 0;
    }
  }

  // pobranie odpowiedniej klasy css dla elementu '<ul>'
  getUlCssClass(): string {
    let cssClass = '';
    if (this.cssClass) {
      cssClass = this.cssClass + ' ';
    }
    if (this.level === 0) {
      return cssClass + 'navbar-nav nav mr-auto align-items-center d-flex w-100 flex-row flex-column flex-sm-row';
    } else {
      let extraClassCss = '';
      if (this.level > 1) {
        extraClassCss = ' position-static';
      }
      return cssClass + 'dropdown-menu' + (this.parent && this.parent.expanded ? ' show' : '') + extraClassCss;
    }
  }

  // pobranie poziomu kolejnego zagnieżdżonego menu
  getNextLevel(): number {
    return this.level + 1;
  }

  subMenuClick(event, item: MenuItem): void {
    if (this.level > 0) {
      item.toggleExpanded();
      event.stopPropagation();
    }
    event.preventDefault();
  }

}
