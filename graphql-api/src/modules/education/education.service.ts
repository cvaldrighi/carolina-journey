import { Injectable } from '@nestjs/common';
import { DatabaseService } from 'src/database/database.service';
@Injectable()
export class EducationService {
  constructor(private readonly database: DatabaseService) {}
  async findAll() {
    const query = `
      SELECT id, institution, degree, course, start_date as "startDate", end_date as "endDate" FROM education
    `;
    const education = await this.database.query(query);
    return education;
  }
}
