import { ObjectType, Field, ID } from '@nestjs/graphql';

@ObjectType()
export class Hobby {
  @Field(() => ID)
  id: string;

  @Field()
  name: string;
}
