#!/usr/bin/env bash
# Lightweight but real CI subset for the merge-guard trial:
#   1. deno's own repo-wide format check (what `ci.yml` runs as "lint")
#   2. a typecheck of the trial sources
# Intentionally NOT the full build/test suite, which does not fit
# GitHub-hosted runner limits.
set -euo pipefail

# tools/format.js imports from the std submodule; a fresh checkout (and the
# temporary worktree merge-guard tests in) does not have it yet.
git submodule update --init tests/util/std

deno run --allow-all --config=tests/config/deno.json tools/format.js --check

if [ -d merge-guard-trial ]; then
  deno check merge-guard-trial/*.ts
fi
