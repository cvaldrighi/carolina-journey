import { Injectable } from '@nestjs/common';
import { DatabaseService } from '../../database/database.service';

@Injectable()
export class SkillsService {
  constructor(private readonly database: DatabaseService) {}

  async findAll() {
    return this.database.query(
      'SELECT id, name, category FROM skills ORDER BY name',
    );
  }
}
