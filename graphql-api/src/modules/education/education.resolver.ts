import { Resolver, Query } from '@nestjs/graphql';
import { Education } from './education.model';
import { EducationService } from './education.service';

@Resolver(() => Education)
export class EducationResolver {
  constructor(private readonly educationService: EducationService) {}

  @Query(() => [Education])
  async education() {
    return this.educationService.findAll();
  }
}
