import { Module } from '@nestjs/common';
import { HobbiesResolver } from './hobbies.resolver';
import { HobbiesService } from './hobbies.service';

@Module({
  providers: [HobbiesResolver, HobbiesService],
})
export class HobbiesModule {}
