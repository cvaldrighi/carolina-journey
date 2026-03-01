import { ObjectType, Field, ID } from '@nestjs/graphql';
import { Skill } from '../skills/skill.model';
import { ExperienceHighlight } from './experience-highlight.model';

@ObjectType()
export class Experience {
  @Field(() => ID)
  id: string;

  @Field()
  company: string;

  @Field()
  jobTitle: string;

  @Field({ nullable: true })
  startDate: Date;

  @Field({ nullable: true })
  endDate?: Date;

  @Field(() => [Skill])
  skills: Skill[];

  @Field(() => [ExperienceHighlight])
  highlights: ExperienceHighlight[];
}
