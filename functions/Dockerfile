# Imagem compartilhada pelas functions (profile-summary e career-summary).
# A function a ser servida é definida pela variável FUNCTION_TARGET.

# Build stage
FROM node:22-alpine AS builder
WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY tsconfig.json ./
COPY src ./src
RUN npm run build

# Runtime stage
FROM node:22-alpine
WORKDIR /app
ENV NODE_ENV=production

COPY package*.json ./
RUN npm ci --omit=dev

COPY --from=builder /app/dist ./dist

ENV PORT=8080
EXPOSE 8080

CMD ["./node_modules/.bin/functions-framework"]
