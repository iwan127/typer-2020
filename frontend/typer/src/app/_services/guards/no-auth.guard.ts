import { Injectable } from '@angular/core';
import { CanActivateChild, Router, ActivatedRouteSnapshot, RouterStateSnapshot, CanActivate } from '@angular/router';
import { UserService } from '../user.service';
import { AuthService } from '../auth.service';
import { Observable, of as observableOf } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable()
export class NoAuthGuard implements CanActivateChild, CanActivate {
  private isAuthenticated = false;

  constructor(private userService: UserService, private authService: AuthService, private router: Router) {}

  canActivateCore(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<boolean> {
    return this.userService.getCurrentUser().pipe(
      map(user => {
        const ret = user ? false : true;
        if (!ret) {
          this.authService.enableMainMessage();
          this.authService.redirectToHome();
        } else {
          this.authService.disableMainMessage();
        }
        return ret;
      })
    );
  }

  canActivateChild(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<boolean> {
    return this.canActivateCore(route, state);
  }

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<boolean> {
    return this.canActivateCore(route, state);
  }

}
