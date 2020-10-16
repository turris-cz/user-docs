# Documentation for Turris routers

This documentation is written in English. It will walk you through the
first setup of your router and give you insights into main features available
in Turris OS.

We are using Markdown to document everything and `mkdocs` to handle the
presentation.

## Requirements

To render this documentation, you need [mkdocs](https://www.mkdocs.org/).

It can be installed easily using `pip` running the following command

```bash
pip install --user -r requirements.txt
```

If you are all set, you can clone this repository via `git`.

```bash
git clone --recurse-submodules https://gitlab.nic.cz/turris/user-docs.git
```

### Run mkdocs

Once you have a cloned out directory with documentation, you can either render
it locally or run a local server that will serve it. To do the later, you just
need to run in the root directory of the documentation the following command

```bash
mkdocs serve
```

If everything works well, you should see the documentation on <http://127.0.0.1:8000>.

## Tips for writing

### Headers

For header, please try to stick to markdown notation using the following syntax:

* ``# Header level 1``
* ``## Header level 2``
* ``### Header level 3``
* ...

It is more consistent once you get to more than three levels.

### Links

When writing links, use **relative path** and `.md` extension. So for example
`[README](README.md)` will create a link like so: [README](README.md). When
documentation is built, they get converted to working links (without `.md`).

### Images

When doing screenshots, crop the screenshot to cover only interesting areas and
stick to the whole elements (try to avoid cut out buttons/labels).

Use stock settings in your browser (preferably Firefox) and try to avoid any
contamination by system themes.

For highlighting the important part of the screenshot (if you need to, most of
the time not necessary) use rectangular shape and 3-pixel red line `rgb(255, 0, 0)`

### Linter

Some recommendation can be obtained by using linter. You can install Markdown
linter and check your documentation file via following commands:

```bash
npm install -g markdownlint-cli
markdownlint 'doc/my_super_howto.md'
```

### Formating

#### Italic

Use `_italic_` whenever you are citing some label, like for example menu
in we UI.

#### Monospace

Use  `` `monospace` `` whenever talking about commands or files or citing some
code example.

#### **Bold**

Use `**bold**` to stress the important part. If you are describing some
complex process and there is one step that is more important or more easily
overlooked, you can stress it by making it bold. To stress importance even
more, it might make sesne to use admonition.

### Admonition

We have admonition extension, so you can use `note`, `tip`, `warning` and other
keywords for block-styled content. It needs to start with `!!!` or `???`.  More
details can be found in [Admonition
documentation](https://squidfunk.github.io/mkdocs-material/extensions/admonition/).
