# Carolina Journey API (NestJS + GraphQL + PostgreSQL)

API GraphQL desenvolvida em NestJS que expõe minhas informações profissionais  
(profile, skills, experiences, education e hobbies) a partir de um banco PostgreSQL.

O objetivo do projeto é demonstrar:

- Arquitetura modular com NestJS  
- GraphQL com resolvers aninhados  
- Modelagem relacional  
- Seed idempotente (schema + dados)  
- Testes unitários e E2E  

---

## Stack

- Node.js + TypeScript  
- NestJS  
- GraphQL (Apollo)  
- PostgreSQL  
- Docker Compose  
- Jest (unit + e2e)  

---

## Rodando localmente

### Pré-requisitos

- Node.js (>= 18)  
- Docker + Docker Compose  

---

### 1) Subir o Postgres

Na raiz do repositório (onde está o `docker-compose.yml`):

```bash
docker compose up -d
```

> O Postgres está exposto na porta 5433 (host) → 5432 (container)

---

### 2) Configurar variáveis de ambiente

Dentro da pasta `graphql-api`:

```bash
cp .env.example .env
```

---

### 3) Instalar dependências

```bash
cd graphql-api
npm install
```

---

### 4) Criar schema + popular o banco

Este comando executa `schema.sql` e depois `seed.sql`:

```bash
npm run seed
```

---

### 5) Subir a API

```bash
npm run start:dev
```

A API ficará disponível em:

```
http://localhost:3000/graphql
```

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

---

### Skills

```graphql
query {
  skills {
    name
    category
  }
}
```

---

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

### Unit tests

```bash
npm run test
```

---

### E2E tests

(Requer banco rodando e seed executado)

```bash
npm run test:e2e
```

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
 │    ├── schema.sql
 │    ├── seed.sql
 │    └── seed.ts
 │
 └── app.module.ts
```

---

## Próximos passos

- Deploy da API GraphQL no Google Cloud Run  
- Criação de Cloud Run Function consumindo o GraphQL  
- Exposição pública de endpoint para consulta das informações  

---

## Observações

- O seed é idempotente: pode ser executado múltiplas vezes sem duplicar dados.  
- A arquitetura separa claramente domínio, acesso a dados e camada GraphQL.  
- Testes unitários focam na lógica de serviço; testes E2E validam a integração completa via GraphQL.
