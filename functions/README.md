# Functions (Cloud Functions Gen2)

Esta pasta contém duas functions HTTP que consomem a API GraphQL e expõem endpoints com dados já processados e formatados.

As functions **não acessam o banco diretamente**. Toda a lógica de acesso a dados fica centralizada na API GraphQL.

Elas usam o [`@google-cloud/functions-framework`](https://github.com/GoogleCloudPlatform/functions-framework-nodejs), o mesmo runtime das Cloud Functions Gen2. Por isso rodam igualmente na nuvem, em um container Docker ou direto com Node.

---

## Estrutura

```
functions/
 ├── Dockerfile          # imagem compartilhada (a function é escolhida por FUNCTION_TARGET)
 ├── profile-summary/
 └── career-summary/
```

Cada pasta é uma function independente, com seu próprio `package.json`.

---

## profile-summary

Retorna:

- Informações básicas do perfil
- Data de nascimento formatada
- Idade calculada
- Lista de hobbies

## career-summary

Retorna:

- Total de experiências profissionais
- Lista de experiências (da mais recente para a mais antiga)
- Skills por experiência
- Highlights por experiência

---

## Rodando localmente

O jeito mais simples é o `docker compose up -d --build` na raiz do repositório. As functions sobem em:

| Function | URL |
|---|---|
| `profileSummary` | http://localhost:8081 |
| `careerSummary` | http://localhost:8082 |

### Sem Docker (para desenvolver)

Com a API GraphQL rodando em `http://localhost:8080/graphql`:

```bash
cd profile-summary   # ou career-summary
cp .env.example .env
npm install
npm run build
npm start
```

Por padrão, `profile-summary` sobe na porta **8081** e `career-summary` na **8082**. Para usar outra porta, rode `PORT=9000 npm start`.

### Variáveis de ambiente

| Variável | Descrição | Padrão |
|---|---|---|
| `GRAPHQL_URL` | URL da API GraphQL consumida pela function | `http://localhost:8080/graphql` |

---

## Deploy no Google Cloud

> Os endpoints em nuvem estão desativados no momento. Os comandos ficam como referência.

```bash
gcloud functions deploy profileSummary \
  --gen2 \
  --runtime=nodejs22 \
  --region=southamerica-east1 \
  --source=./profile-summary \
  --entry-point=profileSummary \
  --trigger-http \
  --allow-unauthenticated \
  --set-env-vars GRAPHQL_URL=<url-da-api-no-cloud-run>/graphql
```

```bash
gcloud functions deploy careerSummary \
  --gen2 \
  --runtime=nodejs22 \
  --region=southamerica-east1 \
  --source=./career-summary \
  --entry-point=careerSummary \
  --trigger-http \
  --allow-unauthenticated \
  --set-env-vars GRAPHQL_URL=<url-da-api-no-cloud-run>/graphql
```

---

## Observações

- As functions são stateless.
- O objetivo é demonstrar integração entre serviços e transformação de dados.
