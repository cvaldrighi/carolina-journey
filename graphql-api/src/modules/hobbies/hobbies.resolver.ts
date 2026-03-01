import { Resolver, Query } from '@nestjs/graphql';
import { Hobby } from './hobby.model';
import { HobbiesService } from './hobbies.service';
@Resolver(() => Hobby)
export class HobbiesResolver {
  constructor(private readonly hobbiesService: HobbiesService) {}

  @Query(() => [Hobby])
  async hobbies() {
    return this.hobbiesService.findAll();
  }
}
