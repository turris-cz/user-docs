# Documentation for Turris routers

This documentation is written in English. It will walk you through the
first setup of your router and give you insights into main features available
in Turris OS.

We are using Markdown to document everything and `mkdocs` to handle the
presentation.


## Requirements:

To render this documentation, you need [mkdocs](https://www.mkdocs.org/).

It can be installed easily using `pip3` running the following command

```
pip3 install --user -r requirements.txt
```

If you are all set, you can clone this repository via `git`.

```
git clone --recurse-submodules https://gitlab.nic.cz/turris/user-docs.git
```

### Run mkdocs

Once you have a cloned out directory with documentation, you can either render
it locally or run a local server that will serve it. To do the later, you just
need to run in the root directory of the documentation the following command

```
mkdocs serve
```

If everything works well, you should see the documentation on <http://127.0.0.1:8000>.

## Tips for writing

### File names

File names should clearly describe what given files contain. Use only
lowercase letter, digits, hyphens and dots. Don't use underscores.
Each name should start with a letter and be trailed by an extension
separated with a dot.

Some examples:

- `openvpn-server.md`
- `setup.md`
- `haas-device.png`
- `turris-10.jpg`

There are special cases where uppercase letters may be used. This applies
to files like `README.md`, `LICENSE` or `.DockerFile` etc. which have
conventional names.

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
contamination by system themes. Switch your browser to English.

For highlighting the important part of the screenshot (if you need to, most of
the time not necessary) use rectangular shape and 3-pixel red line `rgb(255, 0, 0)`

### Metadata

The metadata must be the first thing in the file and must take the form of a
valid YAML set between triple-dashed lines. Here is a basic example:
```
---
board: mox
competency: expert
---
```
Between these triple-dashed lines, use predefined variables (see below for a
reference).

### Turris boards

In case you want to specify Turris device(s) in the article, use one or multiple
options provided below.

-   shield
-   mox
-   omnia
-   1.x

```
---
board: shield, mox, omnia, 1.x
---
```
### Competency level

In case you want to specify competency level choose one of the levels below.

-   novice
-   intermediate
-   advanced
-   expert

```
---
competency: expert
---
```

### Formating

#### Italic

Use `_italic_` whenever you are citing some label, like for example menu
in the UI.

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

