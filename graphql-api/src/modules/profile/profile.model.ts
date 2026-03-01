import { ObjectType, Field, ID } from '@nestjs/graphql';

@ObjectType()
export class Profile {
  @Field(() => ID)
  id: string;

  @Field()
  name: string;

  @Field()
  birthDate: Date;

  @Field()
  jobTitle: string;

  @Field()
  city: string;

  @Field()
  email: string;
}
