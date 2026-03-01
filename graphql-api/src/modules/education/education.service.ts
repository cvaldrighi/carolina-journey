import { Injectable } from '@nestjs/common';
import { DatabaseService } from 'src/database/database.service';
@Injectable()
export class EducationService {
  constructor(private readonly database: DatabaseService) {}
  async findAll() {
    const query = `
      SELECT * FROM education
    `;
    const education = await this.database.query(query);
    return education;
  }
}
