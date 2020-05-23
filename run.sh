#!/usr/bin/env bash
set -euo pipefail

_int() {
  echo "INT (run.sh)"
  kill $pid || true
  wait $pid || true

  echo "EXIT 0 (run.sh)"
  exit 0
}

trap '_int' INT

while true; do
  $@ &
  pid=$!
  wait $pid

  echo ""
  echo "-- restart"
  sleep 0.1
done
