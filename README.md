# Carolina Journey

Projeto com arquitetura em nuvem utilizando:

- PostgreSQL (Supabase)
- NestJS + GraphQL (Cloud Run)
- Google Cloud Functions Gen2
- Docker
- Testes unitários e E2E

---

## Objetivo do Projeto

O objetivo deste projeto foi construir uma arquitetura moderna e modular utilizando tecnologias amplamente adotadas no mercado.

Para contextualizar os dados, optei por representar as informações com meu próprio perfil profissional.  

Apesar disso, a arquitetura construída aqui pode ser aplicada em:

- APIs públicas desacopladas
- Processamento e agregação de dados
- Integração entre serviços em nuvem
- Microsserviços de consulta e transformação de dados
- Camadas intermediárias entre banco e frontend
- Serviços que exigem separação entre domínio e apresentação

A separação entre:

- Camada de dados (PostgreSQL)
- Camada de domínio (GraphQL)
- Camada de apresentação/transformação (Cloud Functions)

permite escalabilidade e desacoplamento entre serviços.

---

## Arquitetura

Supabase (PostgreSQL)
        ↓
Cloud Run (NestJS + GraphQL API)
        ↓
Cloud Functions Gen2 (HTTP endpoints formatados)

- A API GraphQL centraliza acesso aos dados.
- As Cloud Functions consomem a API e retornam respostas agregadas/formatadas.
- Não há acesso direto ao banco pelas Functions.
- Serviços desacoplados.

---

## Stack Utilizada

### Backend

- Node.js
- TypeScript
- NestJS
- GraphQL (Apollo)
- PostgreSQL

### Cloud

- Google Cloud Run
- Google Cloud Functions Gen2
- Supabase (PostgreSQL gerenciado)

### Dev & Qualidade

- Docker / Docker Compose
- Jest (unit + e2e)
- Seed idempotente (schema + dados)

---

##  Endpoints Públicos

### GraphQL API (Cloud Run)

```
https://carolina-journey-graphql-327193036656.southamerica-east1.run.app/graphql
```

Permite explorar o schema e realizar queries diretamente no Apollo Sandbox.

---

### Cloud Function – Profile Summary

```
https://southamerica-east1-carolina-journey.cloudfunctions.net/profileSummary
```

Retorna:

- Dados básicos do perfil
- Idade calculada
- Data formatada
- Lista de hobbies

---

### Cloud Function – Career Summary

```
https://southamerica-east1-carolina-journey.cloudfunctions.net/careerSummary
```

Retorna:

- Total de experiências
- Lista de experiências (mais recente primeiro)
- Skills por experiência
- Highlights por experiência

---

## Executando Localmente

O projeto pode ser executado localmente utilizando Docker.

Instruções detalhadas estão nos READMEs internos:

- `graphql-api/README.md`
- `functions/README.md`

---
