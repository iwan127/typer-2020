import { Injectable } from '@angular/core';

@Injectable()
export class SpinnerService {
  private visible = false;

  show(): void {
    this.visible = true;
  }

  hide(): void {
    this.visible = false;
  }

  isVisible(): boolean {
    return this.visible;
  }
}
