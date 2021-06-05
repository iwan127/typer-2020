import { BaseModel } from './base-model';

export class User extends BaseModel {
  id: number = null;
  username: string = null;
  firstname: string = null;
  lastname: string = null;
  nickname: string = null;
  avatarFile: File = null;
  avatar: string = null;
  isAuthenticated = true; // jesli false to znaczy ze pomimo zalogowania sie nie mamy prawa przegladac systemu
  password: string = null;
  password2: string = null;
  email: string = null;

  constructor(
    options?: any
  ) {
    super();
    this.setValuesByJson(options);
  }
}
