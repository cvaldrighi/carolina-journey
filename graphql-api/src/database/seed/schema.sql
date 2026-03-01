BEGIN;

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- =========================
-- PROFILE
-- =========================
CREATE TABLE IF NOT EXISTS profile (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(150) NOT NULL,
  birth_date DATE,
  job_title VARCHAR(150) NOT NULL,
  city VARCHAR(150),
  email VARCHAR(150) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- SKILLS
-- =========================
CREATE TABLE IF NOT EXISTS skills (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(150) NOT NULL,
  category VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- HOBBIES
-- =========================
CREATE TABLE IF NOT EXISTS hobbies (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(150) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- EDUCATION
-- =========================
CREATE TABLE IF NOT EXISTS education (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  institution VARCHAR(150) NOT NULL,
  degree VARCHAR(150),
  course VARCHAR(150) NOT NULL,
  start_date DATE,
  end_date DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- EXPERIENCES
-- =========================
CREATE TABLE IF NOT EXISTS experiences (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  company VARCHAR(150) NOT NULL,
  job_title VARCHAR(150) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- EXPERIENCE_HIGHLIGHTS
-- =========================
CREATE TABLE IF NOT EXISTS experience_highlights (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  experience_id UUID NOT NULL,
  description TEXT NOT NULL,
  CONSTRAINT fk_experience
    FOREIGN KEY (experience_id)
    REFERENCES experiences(id)
    ON DELETE CASCADE
);

-- =========================
-- EXPERIENCE_SKILLS
-- =========================
CREATE TABLE IF NOT EXISTS experience_skills (
  experience_id UUID NOT NULL,
  skill_id UUID NOT NULL,
  PRIMARY KEY (experience_id, skill_id),
  CONSTRAINT fk_exp
    FOREIGN KEY (experience_id)
    REFERENCES experiences(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_skill
    FOREIGN KEY (skill_id)
    REFERENCES skills(id)
    ON DELETE CASCADE
);

COMMIT;