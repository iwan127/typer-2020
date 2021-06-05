import { Component, Input, Injector } from '@angular/core';
import { BaseComponent } from '../base/base.component';
import { SpinnerService } from '../../../_services';

@Component({
  selector: 'app-spinner',
  templateUrl: './spinner.component.html',
  styleUrls: ['./spinner.component.scss']
})
export class SpinnerComponent extends BaseComponent {
  private prevStatus: boolean = null;
  lockSpinner = false;

  isSpinnerShown(): boolean {
    const status = this.spinnerService.isVisible();
    if (this.prevStatus === true && status === false) {
      this.hideSpinner();
    }
    this.prevStatus = status;
    return (status || this.lockSpinner);
  }

  hideSpinner(): void {
    this.lockSpinner = true;
    document.getElementById('spinner').classList.add('animate-bounce-off');
    setTimeout(() => {
      this.prevStatus = false;
      this.lockSpinner = false;
    }, 500);
  }

}
