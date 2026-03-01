import { Resolver, Query } from '@nestjs/graphql';
import { Profile } from './profile.model';
import { ProfileService } from './profile.service';

@Resolver(() => Profile)
export class ProfileResolver {
  constructor(private readonly profileService: ProfileService) {}

  @Query(() => Profile, { nullable: true })
  async profile() {
    return this.profileService.findProfile();
  }
}
