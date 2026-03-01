import { readFileSync } from 'fs';
import { join } from 'path';
import { config } from 'dotenv';
import { Pool } from 'pg';

config();

async function runSeed() {
  console.log('Starting database seed...');

  const pool = new Pool({
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT),
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
  });

  try {
    const schemaPath = join(__dirname, 'schema.sql');
    const seedPath = join(__dirname, 'seed.sql');

    const schemaSql = readFileSync(schemaPath, 'utf8');
    const seedSql = readFileSync(seedPath, 'utf8');

    await pool.query(schemaSql);
    await pool.query(seedSql);

    console.log('Seed executed successfully');
  } catch (error) {
    console.error('Seed failed:', error);
  } finally {
    await pool.end();
    console.log('Database connection closed');
  }
}

runSeed().catch((error) => {
  console.error('Seed failed:', error);
  process.exit(1);
});
