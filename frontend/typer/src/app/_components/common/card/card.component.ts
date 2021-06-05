import { Component, Input } from '@angular/core';
import { BaseComponent } from '../base/base.component';

@Component({
  selector: 'app-card',
  templateUrl: './card.component.html'
})
export class CardComponent extends BaseComponent {
  @Input() title: string = null;
  @Input() cssClass: string = null;

}
