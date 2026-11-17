#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
PORT="${PORT:-8080}"
HOST="${HOST:-127.0.0.1}"

if [[ ! -f "$ROOT/index.md" ]]; then
  echo "index.md não encontrado em: $ROOT" >&2
  exit 1
fi

cd "$ROOT"
exec python3 -m http.server "$PORT" --bind "$HOST"
