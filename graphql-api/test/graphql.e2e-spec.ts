import { INestApplication } from '@nestjs/common';
import { Test, TestingModule } from '@nestjs/testing';
import request from 'supertest';
import { AppModule } from '../src/app.module';

describe('GraphQL (e2e)', () => {
  let app: INestApplication;

  beforeAll(async () => {
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    app = moduleFixture.createNestApplication({
      logger: false,
    });
    await app.init();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should fetch skills', async () => {
    const query = {
      query: `
        query {
          skills {
            id
            name
            category
          }
        }
      `,
    };

    const res = await request(app.getHttpServer())
      .post('/graphql')
      .send(query)
      .expect(200);

    expect(res.body.errors).toBeUndefined();
    expect(res.body.data.skills).toBeDefined();
    expect(Array.isArray(res.body.data.skills)).toBe(true);
    expect(res.body.data.skills.length).toBeGreaterThan(0);
    expect(res.body.data.skills[0]).toHaveProperty('name');
  });

  it('should fetch experiences with nested skills and highlights', async () => {
    const query = {
      query: `
        query {
          experiences {
            id
            company
            jobTitle
            startDate
            endDate
            skills { id name category }
            highlights { id description }
          }
        }
      `,
    };

    const res = await request(app.getHttpServer())
      .post('/graphql')
      .send(query)
      .expect(200);

    expect(res.body.errors).toBeUndefined();
    expect(res.body.data.experiences).toBeDefined();
    expect(Array.isArray(res.body.data.experiences)).toBe(true);
    expect(res.body.data.experiences.length).toBeGreaterThan(0);

    const first = res.body.data.experiences[0];
    expect(first).toHaveProperty('company');
    expect(first).toHaveProperty('skills');
    expect(first).toHaveProperty('highlights');
    expect(Array.isArray(first.skills)).toBe(true);
    expect(Array.isArray(first.highlights)).toBe(true);
  });
});
