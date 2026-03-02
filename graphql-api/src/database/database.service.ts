import { Injectable, OnModuleDestroy } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Pool } from 'pg';
import { Logger } from '@nestjs/common';

@Injectable()
export class DatabaseService implements OnModuleDestroy {
  private pool: Pool;
  private readonly logger = new Logger(DatabaseService.name);

  constructor(private readonly configService: ConfigService) {
    this.pool = new Pool({
      host: this.configService.get<string>('DB_HOST'),
      port: Number(this.configService.get<number>('DB_PORT')),
      user: this.configService.get<string>('DB_USER'),
      password: this.configService.get<string>('DB_PASSWORD'),
      database: this.configService.get<string>('DB_NAME'),
      ssl: {
        rejectUnauthorized: false,
      },
      family: 4,      
    });

    this.pool.on('connect', () => {
      this.logger.log('Database connected');
    });
  }

  async query<T = any>(text: string, params?: any[]): Promise<T[]> {
    const result = await this.pool.query(text, params);
    return result.rows;
  }

  async onModuleDestroy() {
    await this.pool.end();
  }
}
