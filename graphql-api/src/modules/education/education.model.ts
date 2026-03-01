import { ObjectType, Field, ID } from '@nestjs/graphql';
@ObjectType()
export class Education {
  @Field(() => ID)
  id: string;

  @Field()
  institution: string;

  @Field()
  degree: string;

  @Field()
  course: string;

  @Field()
  startDate: Date;

  @Field()
  endDate: Date;
}
