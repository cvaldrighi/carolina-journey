import { Module } from '@nestjs/common';
import { ExperiencesResolver } from './experiences.resolver';
import { ExperiencesService } from './experiences.service';

@Module({
  providers: [ExperiencesResolver, ExperiencesService],
})
export class ExperiencesModule {}
