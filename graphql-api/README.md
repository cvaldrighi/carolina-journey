# Carolina Journey API (NestJS + GraphQL + PostgreSQL)

API GraphQL desenvolvida em NestJS que expõe minhas informações profissionais
(profile, skills, experiences, education e hobbies) a partir de um banco PostgreSQL.

O objetivo do projeto é demonstrar:

- Arquitetura modular com NestJS
- GraphQL com resolvers aninhados
- Modelagem relacional
- Seed idempotente (schema + dados)
- Testes unitários e E2E

> Só quer ver funcionando? Use o `docker compose up -d --build` na raiz do repositório (veja o [README principal](../README.md)). As instruções abaixo são para desenvolver a API localmente, com hot reload.

---

## Stack

- Node.js 22 + TypeScript
- NestJS
- GraphQL (Apollo)
- PostgreSQL
- Docker Compose
- Jest (unit + e2e)

---

## Desenvolvimento local

### Pré-requisitos

- Node.js 22 (há um `.nvmrc` na raiz: `nvm use` ou `fnm use`)
- Docker

### 1) Subir só o banco (já com schema e seed)

Na raiz do repositório:

```bash
docker compose up -d seed
```

O serviço `seed` depende do `postgres`, então os dois sobem juntos. O Postgres fica exposto na porta **5433** do host.

### 2) Configurar variáveis de ambiente

```bash
cd graphql-api
cp .env.example .env
```

| Variável | Descrição |
|---|---|
| `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASSWORD`, `DB_NAME` | Conexão com o Postgres |
| `DB_SSL` | `false` para o Postgres local; `true` em produção (Supabase) |
| `PORT` | Porta da API (padrão `8080`) |

### 3) Instalar dependências e subir a API

```bash
npm install
npm run start:dev
```

A API fica disponível em http://localhost:8080/graphql.

> Se alterar o `seed.sql`, rode `npm run seed` (ou `docker compose up seed` na raiz) para reaplicar. O seed é idempotente: pode ser executado várias vezes sem duplicar dados.

---

## Exemplos de Queries

### Profile

```graphql
query {
  profile {
    name
    jobTitle
    city
    email
    birthDate
  }
}
```

### Skills

```graphql
query {
  skills {
    name
    category
  }
}
```

### Experiences (com nested fields)

```graphql
query {
  experiences {
    company
    jobTitle
    startDate
    endDate
    skills {
      name
      category
    }
    highlights {
      description
    }
  }
}
```

---

## Testes

```bash
npm run test       # unitários
npm run test:e2e   # E2E (requer o banco rodando com seed)
```

Os dois rodam automaticamente no CI a cada push.

---

## Estrutura Resumida

```text
src/
 ├── modules/
 │    ├── profile/
 │    ├── skills/
 │    ├── experiences/
 │    ├── education/
 │    └── hobbies/
 │
 ├── database/
 │    ├── database.service.ts
 │    └── seed/
 │         ├── schema.sql
 │         ├── seed.sql
 │         └── seed.ts
 │
 └── app.module.ts
```

---

## Deploy no Cloud Run

> O serviço em nuvem está desativado no momento. Os passos ficam como referência.

A imagem é construída pelo `Dockerfile` (multi-stage, `node:22-alpine`). Em produção, o banco era um PostgreSQL gerenciado no Supabase, que exige SSL:

```bash
gcloud run deploy carolina-journey-graphql \
  --source . \
  --region=southamerica-east1 \
  --allow-unauthenticated \
  --set-env-vars DB_HOST=...,DB_PORT=...,DB_USER=...,DB_PASSWORD=...,DB_NAME=...,DB_SSL=true
```

> Ao buildar a imagem localmente em uma máquina ARM (ex.: Mac com Apple Silicon) para publicar no Cloud Run, use `docker build --platform linux/amd64`.

---

## Observações

- A arquitetura separa claramente domínio, acesso a dados e camada GraphQL.
- Testes unitários focam na lógica de serviço; testes E2E validam a integração completa via GraphQL.
