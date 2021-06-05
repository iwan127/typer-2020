import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { ReactiveFormsModule } from '@angular/forms';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { ColorPickerModule } from 'ngx-color-picker';

import { RouterModule } from '@angular/router';
import { APP_BASE_HREF } from '@angular/common';

import { GridsterModule } from 'angular-gridster2';
import { MenuComponent } from './menu.component';
import { UserService } from '../../../_services';
import { AppRoutingModule } from '../../../app.routing.module';
import { DashboardComponent, DashboardsComponent, AdminDashboardsComponent, UserInfoWidgetComponent,
  WidgetComponent, AdminDashboardComponent, AdminWidgetFormCircularComponent, FormComponent,
  FormFieldComponent, ModalComponent } from '../..';

describe('HeaderComponent', () => {
  let component: MenuComponent;
  let fixture: ComponentFixture<MenuComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      imports: [RouterModule, HttpClientTestingModule, AppRoutingModule, GridsterModule, ReactiveFormsModule,
        NgbModule, ColorPickerModule],
      providers: [UserService, {provide: APP_BASE_HREF, useValue : '/' }],
      declarations: [ MenuComponent, DashboardComponent, DashboardsComponent, AdminDashboardsComponent,
        UserInfoWidgetComponent, WidgetComponent, AdminDashboardComponent, AdminWidgetFormCircularComponent,
        FormComponent, FormFieldComponent, ModalComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MenuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('powinen zostać utworzony komponent MenuComponent', () => {
    expect(component).toBeTruthy();
  });
});
