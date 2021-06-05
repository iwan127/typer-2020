export class BaseModel {
  protected fkFields: any = null;

  constructor() {
  }

  // ustawianie pól obiektu na podstawie danych w formacie JSON
  setValuesByJson(data: {}): void {
    for (const field of Object.keys(this)) {
      this.setValuesByJsonCore(data, field);
    }
  }

  // ustawianie pól obiektu na podstawie danych w formacie JSON - główna logika
  // (zazwyczaj tę metodę przeciążają klasy podrzędne)
  protected setValuesByJsonCore(data: {}, field: any): void {
    if (data && field in data) {
      this[field] = this.setValuesByJsonFk(data, field);
    } else if (typeof this[field] === 'undefined') {
      this[field] = null;
    }
  }

  // sprawdzenie klas kluczy obcych obiekcie i stworzenie instancji tych klas
  protected setValuesByJsonFk(data: {}, field: any): any {
    if (this.fkFields && field in this.fkFields && data[field] !== null && data[field] !== undefined) {
      if (data[field] instanceof Array) {
        const arr = [];
        data[field].forEach(element => {
          arr.push(new this.fkFields[field](element));
        });
        return arr;
      } else {
        return new this.fkFields[field](data[field]);
      }
    }
    return data[field];
  }

  // zamiana stringa na boolean
  protected stringToBoolean(str: string): boolean {
    if (str === 'true' || str === '1') {
      return true;
    }
    return false;
  }
}
