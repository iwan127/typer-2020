import { BaseModel } from './base-model';
import { Icon } from './icon';

export class MenuItem extends BaseModel {
  label: string = null;
  url: string[] = null;
  click: Function = null;
  icon: Icon = null;
  items: MenuItem[] = null;
  expanded: boolean = null;

  constructor(options) {
    super();
    this.expanded = false;
    this.setValuesByJson(options);
  }

  protected setValuesByJsonCore(data: {}, field: any): void {
    if (field === 'items' && data && 'items' in data) {
      this.setItems(data[field]);
    } else if (field === 'icon' && data && 'icon' in data) {
      if (typeof data['icon'] === 'object') {
        this.icon = new Icon(data['icon']);
      } else {
        this.icon = new Icon({name: data['icon']});
      }
    } else {
      super.setValuesByJsonCore(data, field);
    }
  }

  setItems(items): void {
    if (items) {
      this.items = [];
      items.forEach(item => {
        this.items.push(new MenuItem(item));
      });
    }
  }

  toggleExpanded(): void {
    this.expanded = !this.expanded;
  }
}
