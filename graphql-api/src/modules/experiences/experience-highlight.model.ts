import { ObjectType, Field, ID } from '@nestjs/graphql';

@ObjectType()
export class ExperienceHighlight {
  @Field(() => ID)
  id: string;

  @Field()
  description: string;
}
