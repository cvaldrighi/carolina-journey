import { Test, TestingModule } from '@nestjs/testing';
import { SkillsService } from './skills.service';
import { DatabaseService } from '../../database/database.service';

describe('SkillsService', () => {
  let service: SkillsService;

  const mockDatabase = {
    query: jest.fn(),
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        SkillsService,
        {
          provide: DatabaseService,
          useValue: mockDatabase,
        },
      ],
    }).compile();

    service = module.get<SkillsService>(SkillsService);
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('should return all skills ordered by name', async () => {
    const mockSkills = [
      { id: '1', name: 'Docker', category: 'devops' },
      { id: '2', name: 'Node.js', category: 'backend' },
    ];

    mockDatabase.query.mockResolvedValue(mockSkills);
    const result = await service.findAll();

    expect(mockDatabase.query).toHaveBeenCalledWith(
      'SELECT id, name, category FROM skills ORDER BY name',
    );

    expect(result).toEqual(mockSkills);
  });
});
