import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule, HttpClientXsrfModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { AppComponent } from './app.component';

import * as components from './_components';
import * as services from './_services';
import * as resolves from './_resolves';
import * as pipes from './_pipes';
import { AppRoutingModule } from './app.routing.module';

@NgModule({
  declarations: [
    AppComponent,
    components.BaseComponent,
    components.BaseFormComponent,
    components.PredictionComponent,
    components.PredictionsComponent,
    components.PredictionsMatchComponent,
    components.MatchesComponent,
    components.MenuComponent,
    components.UserMenuComponent,
    components.HeaderComponent,
    components.CardComponent,
    components.SpinnerComponent,
    components.TeamComponent,
    components.UserComponent,
    components.RankComponent,
    components.UserSettingsComponent,
    components.LoginComponent,
    components.RegisterComponent,
    components.ResetPasswordComponent,
    components.ResetPasswordConfirmComponent,
    components.ActivateComponent,
    components.UserPasswordChangeComponent,
    components.GroupTableComponent,
    components.RulesComponent,
    components.ExtraQuestionsComponent,
    components.ExtraQuestionsResultsComponent,
    pipes.PluralPipe,
    pipes.KeepHtmlPipe,
    pipes.DefaultPipe
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    AppRoutingModule,
    NgbModule.forRoot(),
    HttpClientXsrfModule.withOptions({
      cookieName: 'csrftoken',
      headerName: 'X-CSRFToken',
    })
  ],
  providers: [
    HttpClientModule,
    services.BaseApiService,
    services.AuthService,
    services.UserService,
    services.AuthGuard,
    services.NoAuthGuard,
    services.MatchesService,
    services.PredictionsService,
    services.GroupsDetailsService,
    services.SpinnerService,
    services.RankService,
    services.MessagesService,
    services.PagesService,
    services.ExtraQuestionsService,
    services.AnswersService,
    services.TeamsService,
    services.RoundsService,
    resolves.UserResolve
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
  constructor() {
    // services.ServiceInjector.injector = utils.serviceInjectorObject;
  }
}
