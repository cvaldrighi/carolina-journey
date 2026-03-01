import { Test, TestingModule } from '@nestjs/testing';
import { ExperiencesService } from './experiences.service';
import { DatabaseService } from '../../database/database.service';

describe('ExperiencesService', () => {
  let service: ExperiencesService;

  const mockDatabase = {
    query: jest.fn(),
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        ExperiencesService,
        { provide: DatabaseService, useValue: mockDatabase },
      ],
    }).compile();

    service = module.get(ExperiencesService);
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('findAll should query experiences ordered by start_date desc and map columns', async () => {
    const rows = [
      {
        id: 'exp-1',
        company: 'Bauk Tech',
        jobTitle: 'Desenvolvedor Fullstack Pleno',
        startDate: '2023-09-01',
        endDate: null,
        createdAt: '2026-02-28T22:44:16.971Z',
      },
    ];

    mockDatabase.query.mockResolvedValue(rows);
    const result = await service.findAll();

    expect(mockDatabase.query).toHaveBeenCalledTimes(1);

    const [sql] = mockDatabase.query.mock.calls[0];
    expect(sql).toContain('SELECT');
    expect(sql).toContain('FROM experiences');
    expect(sql).toContain('job_title as "jobTitle"');
    expect(sql).toContain('start_date as "startDate"');
    expect(sql).toContain('end_date as "endDate"');
    expect(sql.replace(/\s+/g, ' ')).toContain('ORDER BY start_date DESC');

    expect(result).toEqual(rows);
  });

  it('findSkillsByExperience should query skills joined by experience_skills using parameter', async () => {
    const experienceId = 'exp-1';
    const rows = [
      { id: 'skill-1', name: 'Node.js', category: 'backend' },
      { id: 'skill-2', name: 'TypeScript', category: 'backend' },
    ];

    mockDatabase.query.mockResolvedValue(rows);
    const result = await service.findSkillsByExperience(experienceId);

    expect(mockDatabase.query).toHaveBeenCalledTimes(1);

    const [sql, params] = mockDatabase.query.mock.calls[0];
    expect(sql).toContain('FROM skills s');
    expect(sql).toContain('INNER JOIN experience_skills es');
    expect(sql).toContain('es.skill_id = s.id');
    expect(sql).toContain('WHERE es.experience_id = $1');
    expect(params).toEqual([experienceId]);

    expect(result).toEqual(rows);
  });

  it('findHighlightsByExperience should query highlights by experience_id using parameter', async () => {
    const experienceId = 'exp-1';
    const rows = [
      { id: 'h-1', description: 'Liderei a refatoração...' },
      { id: 'h-2', description: 'Desenvolvi pipelines...' },
    ];

    mockDatabase.query.mockResolvedValue(rows);
    const result = await service.findHighlightsByExperience(experienceId);

    expect(mockDatabase.query).toHaveBeenCalledTimes(1);

    const [sql, params] = mockDatabase.query.mock.calls[0];
    expect(sql).toContain('FROM experience_highlights');
    expect(sql).toContain('WHERE experience_id = $1');
    expect(params).toEqual([experienceId]);

    expect(result).toEqual(rows);
  });
});
