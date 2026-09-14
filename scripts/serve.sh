#!/usr/bin/env bash
# Local preview of the site. Serves on http://127.0.0.1:4000 and rebuilds on
# every save. Override the port with:  PORT=4001 scripts/serve.sh
set -euo pipefail

cd "$(dirname "$0")/.."
PORT="${PORT:-4000}"

# Find a jekyll to run: a bundle if one is actually installed, then the PATH,
# then the per-user gem dir that `gem install --user-install` writes to.
if [ -f Gemfile.lock ] && command -v bundle >/dev/null 2>&1 && bundle check >/dev/null 2>&1; then
  JEKYLL=(bundle exec jekyll)
else
  if command -v jekyll >/dev/null 2>&1; then
    JEKYLL=(jekyll)
  else
    USER_BIN="$(ruby -e 'print Gem.user_dir' 2>/dev/null)/bin"
    if [ -x "$USER_BIN/jekyll" ]; then
      JEKYLL=("$USER_BIN/jekyll")
    else
      echo "jekyll not found. See README.md for the install line." >&2
      exit 1
    fi
  fi
  # Without a lockfile, jekyll's own bundler hook narrows the load path and
  # loses kramdown-parser-gfm. We are not running under bundler here, so skip it.
  export JEKYLL_NO_BUNDLER_REQUIRE=true
fi

echo "serving on http://127.0.0.1:${PORT} — ctrl-c to stop"
exec "${JEKYLL[@]}" serve --host 127.0.0.1 --port "$PORT" --livereload --trace
