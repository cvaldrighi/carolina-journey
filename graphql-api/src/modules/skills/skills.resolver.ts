import { Resolver, Query } from '@nestjs/graphql';
import { Skill } from './skill.model';
import { SkillsService } from './skills.service';

@Resolver(() => Skill)
export class SkillsResolver {
  constructor(private readonly skillsService: SkillsService) {}

  @Query(() => [Skill])
  async skills() {
    return this.skillsService.findAll();
  }
}
