import { Injectable } from '@nestjs/common';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class ExperiencesService {
  constructor(private readonly database: DatabaseService) {}

  async findAll() {
    return this.database.query(`
      SELECT
        id,
        company,
        job_title as "jobTitle",
        start_date as "startDate",
        end_date as "endDate"
      FROM experiences
      ORDER BY start_date DESC
    `);
  }

  async findSkillsByExperience(experienceId: string) {
    return this.database.query(
      `
      SELECT s.id, s.name, s.category
      FROM skills s
      INNER JOIN experience_skills es
        ON es.skill_id = s.id
      WHERE es.experience_id = $1
      ORDER BY s.category, s.name
      `,
      [experienceId],
    );
  }

  async findHighlightsByExperience(experienceId: string) {
    return this.database.query(
      `
      SELECT id, description
      FROM experience_highlights
      WHERE experience_id = $1
      ORDER BY id DESC
    `,
      [experienceId],
    );
  }
}
