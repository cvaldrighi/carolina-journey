# Cloud Functions (Gen2)

Esta pasta contém as Cloud Functions (Gen2) responsáveis por consumir a API GraphQL publicada no Cloud Run e expor endpoints HTTP com dados formatados.

As funções **não acessam o banco diretamente**.  
Elas consomem a API GraphQL pública e retornam respostas já processadas e organizadas.

---

## Arquitetura

- Supabase (PostgreSQL)

- Cloud Run (NestJS + GraphQL)
        
- Cloud Functions Gen2 (HTTP)
        
- Endpoints públicos em JSON

---

## Estrutura

```
functions/
 ├── profile-summary/
 └── career-summary/
```

Cada pasta representa uma Cloud Function independente.

---

# profile-summary

Retorna:

- Informações básicas do perfil
- Data de nascimento formatada
- Idade calculada
- Lista de hobbies

### Rodando localmente

```
cd profile-summary
npm install
npm run build
npm start
```

Disponível em:

```
http://localhost:8080
```

---

### Deploy

```
gcloud functions deploy profileSummary \
  --gen2 \
  --runtime=nodejs20 \
  --region=southamerica-east1 \
  --source=. \
  --entry-point=profileSummary \
  --trigger-http \
  --allow-unauthenticated \
  --set-env-vars GRAPHQL_URL=https://carolina-journey-graphql-327193036656.southamerica-east1.run.app/graphql
```

---

# career-summary

Retorna:

- Total de experiências profissionais
- Lista de experiências (da mais recente para a mais antiga)
- Skills por experiência
- Highlights por experiência

### Rodando localmente

```
cd career-summary
npm install
npm run build
npm start
```

Disponível em:

```
http://localhost:8080
```

---
### Deploy

```
gcloud functions deploy careerSummary \
  --gen2 \
  --runtime=nodejs20 \
  --region=southamerica-east1 \
  --source=. \
  --entry-point=careerSummary \
  --trigger-http \
  --allow-unauthenticated \
  --set-env-vars GRAPHQL_URL=https://carolina-journey-graphql-327193036656.southamerica-east1.run.app/graphql
```

---

## Variáveis de Ambiente

Cada função precisa da variável:

```
GRAPHQL_URL=https://carolina-journey-graphql-327193036656.southamerica-east1.run.app/graphql
```

---

## Observações

- As funções são stateless.
- Não há conexão direta com o banco.
- Toda a lógica de acesso a dados está centralizada na API GraphQL.
- O objetivo aqui é demonstrar integração entre serviços em nuvem e transformação de dados.
