# tiramisioux.github.io

Personal landing page at <https://tiramisioux.github.io>. Plain Jekyll: one
markdown page, one layout, one stylesheet, no theme gem and no plugins — so the
HTML GitHub Pages serves is the HTML you get locally.

```
_config.yml              site title, tagline, footer links
index.md                 the page — intro text and the two projects
_layouts/default.html    the whole template
assets/css/style.css     the whole stylesheet
scripts/serve.sh         local preview
```

## Branches

`dev` is where you work. `master` is what GitHub Pages serves — only ever
fast-forwarded from `dev`, never edited directly.

## Local preview

```bash
scripts/serve.sh
```

Serves <http://127.0.0.1:4000> and rebuilds on save.

First time on this machine, install Jekyll. macOS system Ruby is 2.6, so the
gems have to be pinned — the newest versions of several of them require Ruby 3:

```bash
gem install --user-install --no-document ffi -v 1.15.5
gem install --user-install --no-document i18n -v 1.8.11
gem install --user-install --no-document public_suffix -v 4.0.7
gem install --user-install --no-document addressable -v 2.8.7
gem install --user-install --no-document eventmachine -v 1.2.7
gem install --user-install --no-document http_parser.rb -v 0.8.0
gem install --user-install --no-document jekyll -v 3.10.0
```

`serve.sh` finds that per-user install on its own; nothing needs to be on your
`PATH`. Jekyll 3.10 is also the version GitHub Pages builds with.

## Deploying

Merge `dev` into `master` and push. The `site-deploy` Claude skill does this and
puts you back on `dev`.
