/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { GraphQLModule } from '@nestjs/graphql';
import { ApolloDriver, ApolloDriverConfig } from '@nestjs/apollo';
import { join } from 'path';

import { DatabaseModule } from './database/database.module';
import { SkillsModule } from './modules/skills/skills.module';
import { ProfileModule } from './modules/profile/profile.module';
import { HobbiesModule } from './modules/hobbies/hobbies.module';
import { EducationModule } from './modules/education/education.module';
import { ExperiencesModule } from './modules/experiences/experiences.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    DatabaseModule,
    SkillsModule,
    HobbiesModule,
    ProfileModule,
    EducationModule,
    ExperiencesModule,
    GraphQLModule.forRoot<ApolloDriverConfig>({
      driver: ApolloDriver,
      autoSchemaFile: join(process.cwd(), 'src/schema.gql'),
      playground: true,
    }),
  ],
})
export class AppModule {}