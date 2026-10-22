#!/usr/bin/env bash
# Verifica se o ambiente do docker compose está de pé e respondendo.
# Uso: ./scripts/smoke-test.sh   (com `docker compose up -d` já executado)
set -euo pipefail

API_URL="${API_URL:-http://localhost:8080/graphql}"
PROFILE_URL="${PROFILE_URL:-http://localhost:8081}"
CAREER_URL="${CAREER_URL:-http://localhost:8082}"

wait_for() {
  local name="$1" url="$2"
  shift 2
  for _ in $(seq 1 60); do
    if curl -fsS "$@" "$url" > /dev/null 2>&1; then
      echo "✔ $name está no ar"
      return 0
    fi
    sleep 2
  done
  echo "✘ $name não respondeu em $url" >&2
  return 1
}

check_json() {
  local name="$1" json="$2" expr="$3"
  if node -e "const d = JSON.parse(process.argv[1]); if (!($expr)) process.exit(1)" "$json"; then
    echo "✔ $name retornou dados válidos"
  else
    echo "✘ $name retornou uma resposta inesperada:" >&2
    echo "$json" >&2
    return 1
  fi
}

GQL_QUERY='{"query":"{ profile { name } skills { name } experiences { company skills { name } highlights { description } } }"}'

wait_for "API GraphQL" "$API_URL" -X POST -H 'content-type: application/json' -d '{"query":"{ __typename }"}'
wait_for "profile-summary" "$PROFILE_URL"
wait_for "career-summary" "$CAREER_URL"

api=$(curl -fsS -X POST -H 'content-type: application/json' -d "$GQL_QUERY" "$API_URL")
check_json "API GraphQL" "$api" '!d.errors && d.data.profile.name && d.data.skills.length > 0 && d.data.experiences.length > 0'

profile=$(curl -fsS "$PROFILE_URL")
check_json "profile-summary" "$profile" 'd.name && Number.isInteger(d.age) && Array.isArray(d.hobbies)'

career=$(curl -fsS "$CAREER_URL")
check_json "career-summary" "$career" 'd.totalExperiences > 0 && d.experiences.length === d.totalExperiences'

echo
echo "Tudo funcionando 🎉"
