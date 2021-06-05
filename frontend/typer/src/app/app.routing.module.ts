import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { AppComponent } from './app.component';
import * as components from './_components';
import * as guards from './_services/guards';
import * as resolvers from './_resolves';

const routes: Routes = [
  {
    path: '',
    component: components.HeaderComponent,
    outlet: 'top',
    resolve: {
      user: resolvers.UserResolve
    },
  },
  {
    path: '',
    resolve: {
      user: resolvers.UserResolve
    },
    // canActivateChild: [guards.AuthGuard],
    children: [
      {
        path: '',
        redirectTo: 'matches',
        pathMatch: 'full'
      },
      {
        path: 'matches',
        component: components.MatchesComponent,
        canActivate: [guards.AuthGuard]
      },
      {
        path: 'predictions',
        canActivateChild: [guards.AuthGuard],
        children: [
          {
            path: '',
            component: components.PredictionsComponent
          },
          {
            path: ':uid',
            component: components.PredictionsComponent
          },
          {
            path: 'match/:uid',
            component: components.PredictionsMatchComponent
          }
        ]
      },
      {
        path: 'rank',
        component: components.RankComponent,
        canActivate: [guards.AuthGuard]
      },
      {
        path: 'questions',
        canActivate: [guards.AuthGuard],
        children: [
          {
            path: '',
            component: components.ExtraQuestionsComponent,
          },
          {
            path: 'results',
            component: components.ExtraQuestionsResultsComponent
          }
        ]
      },
      {
        path: 'rules',
        component: components.RulesComponent,
        canActivate: [guards.AuthGuard]
      },
      {
        path: 'settings',
        canActivateChild: [guards.AuthGuard],
        children: [
          {
            path: '',
            component: components.UserSettingsComponent
          },
          {
            path: 'change-password',
            component: components.UserPasswordChangeComponent
          }
        ]
      },
      {
        path: 'login',
        component: components.LoginComponent,
        canActivate: [guards.NoAuthGuard]
      },
      {
        path: 'register',
        component: components.RegisterComponent,
        canActivate: [guards.NoAuthGuard]
      },
      {
        path: 'password-reset',
        canActivateChild: [guards.NoAuthGuard],
        children: [
          {
            path: '',
            component: components.ResetPasswordComponent,
          },
          {
            path: 'confirm/:uid/:token',
            component: components.ResetPasswordConfirmComponent
          },
        ]
      },
      {
        path: 'activate',
        component: components.ActivateComponent,
        canActivate: [guards.NoAuthGuard]
      },
      {
        path: 'static/*',
        component: AppComponent
      },
    ]
  },
  // {
  //   path: 'error',
  //   children: [
  //     {
  //       path: '',
  //       component: components.HeaderComponent,
  //       outlet: 'top',
  //     },
  //     {
  //       path: '',
  //       component: components.ErrorComponent
  //     }
  //   ],
  // },
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { useHash: true })
  ],
  exports: [
    RouterModule
  ]
})
export class AppRoutingModule { }
