import { Injectable } from '@nestjs/common';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class HobbiesService {
  constructor(private readonly database: DatabaseService) {}

  async findAll() {
    return this.database.query('SELECT id, name FROM hobbies ORDER BY name');
  }
}
