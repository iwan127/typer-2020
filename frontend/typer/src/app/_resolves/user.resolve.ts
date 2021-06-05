import { Injectable } from '@angular/core';

import { Observable } from 'rxjs';



import { Resolve, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { User } from '../_models';
import { UserService } from '../_services';

@Injectable()
export class UserResolve implements Resolve<User> {
  constructor(protected userService: UserService) {}

  getUserFromService(): Observable<User> {
    return this.userService.getCurrentUser();
  }

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<User> {
    const obs: Observable<User> = this.getUserFromService();
    return obs;
  }
}
