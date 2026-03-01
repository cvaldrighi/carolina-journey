import { Injectable } from '@nestjs/common';
import { DatabaseService } from '../../database/database.service';

@Injectable()
export class ProfileService {
  constructor(private readonly database: DatabaseService) {}

  async findProfile() {
    const result = await this.database.query(
      `SELECT id, name, birth_date as "birthDate",
              job_title as "jobTitle", city, email
       FROM profile
       LIMIT 1`,
    );

    return result[0];
  }
}
