import { Resolver, Query, ResolveField, Parent } from '@nestjs/graphql';
import { Experience } from './experience.model';
import { ExperiencesService } from './experiences.service';
import { Skill } from '../skills/skill.model';
import { ExperienceHighlight } from './experience-highlight.model';

@Resolver(() => Experience)
export class ExperiencesResolver {
  constructor(private readonly experiencesService: ExperiencesService) {}

  @Query(() => [Experience])
  experiences() {
    return this.experiencesService.findAll();
  }

  @ResolveField(() => [Skill])
  skills(@Parent() experience: Experience) {
    return this.experiencesService.findSkillsByExperience(experience.id);
  }

  @ResolveField(() => [ExperienceHighlight])
  highlights(@Parent() experience: Experience) {
    return this.experiencesService.findHighlightsByExperience(experience.id);
  }
}
