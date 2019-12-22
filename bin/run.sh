#!/usr/bin/env bash

set -e

set -a
if [[ -f "./.env" ]]; then
  . .env
fi
set +a

ruby app.rb -o 0.0.0.0
