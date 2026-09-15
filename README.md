# tiramisioux.github.io

Personal landing page at <https://tiramisioux.github.io>. Plain Jekyll, no theme
gem and no plugins — so the HTML GitHub Pages serves is the HTML you get
locally. Content is ordinary markdown files: drop one in, it becomes a page.

```
_config.yml              site title, tagline, footer links
index.md                 the front page — intro text and the two projects
_posts/                  dated entries, one markdown file each
_layouts/default.html    the template
_layouts/post.html       adds the date under a post's title
assets/css/style.css     the whole stylesheet
scripts/serve.sh         local preview
```

## Adding a page

Drop a markdown file in the root. Front matter needs nothing but a title:

```markdown
---
title: About
---

Ordinary markdown from here down.
```

`about.md` is served at `/about/`, and every page with a title joins the nav row
under the header. The nav is hidden entirely while `index.md` is the only page,
which is why the front page looks the same as it did before any of this existed.

## Adding a dated entry

Same thing, in `_posts/`, with the date in the filename —
`_posts/2026-09-15-a-thing.md` is served at `/2026/09/15/a-thing/` and gets its
date printed under the title. Nothing links to entries yet; to list them, loop
over `site.posts` on whichever page should carry the list:

```liquid
{% for post in site.posts %}
- [{{ post.title }}]({{ post.url }}) — {{ post.date | date: "%-d %b %Y" }}
{% endfor %}
```

The layout and the URL shape both come from `_config.yml`, so neither a page nor
an entry has to name a layout.

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
