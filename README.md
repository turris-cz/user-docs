# Documentation for Turris routers

This documentation is written in English. It will walk you through the first
setup of your router and give you insights into the main features available in
Turris OS.

We are using Markdown to document everything and `mkdocs` to handle the
presentation.


## Requirements:

First of all clone this repository via `git`.

```bash
git clone https://gitlab.nic.cz/turris/user-docs.git
```

To render this documentation, you need [MkDocs](https://www.mkdocs.org/).

Run the following `pip3` command in the cloned repository to install it easily.

```bash
pip3 install --user -r requirements.txt
```

### Error externally managed environment

If you run into this error due to your distribution adopting [PEP 668 - Marking Python base environments as "externally managed"](https://peps.python.org/pep-0668/)

```bash
error: externally-managed-environment

× This environment is externally managed
╰─> To install Python packages system-wide, try apt install
python3-xyz, where xyz is the package you are trying to
install.
...
```

Use venv

```bash
python3 -m venv .venv
source .venv/bin/activate
```

Then run the following command

```bash
python3 -m pip install -r requirements.txt
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

#### Lightboxes

All images on the page are grouped into the same lightbox by default. Grouping of images
into lightboxes can also be done manually by specifying `@{lightbox-name}` right
after the opening `[` bracket of the image, e.g., `![@{my-lightbox-name}Here is my
description](image.jpg)` (or after `[!` if hiding the image... see below)

Hidden images (that appear in the lightbox gallery but not on the main page) can
be added by adding a `!` right after the opening `[` bracket of the image. If
adding a lightbox name using `@{name}` then the `!` goes before the `@`.

```
# image with default lightbox name
![my description](image.jpg)

# hidden image
![!my description](image.jpg)

# specified lightbox name
![@{mylightbox}my description](image.jpg)

# hidden image with specified lightbox name
![!@{mylightbox}my description](image.jpg)
```

### Metadata

The metadata must be the first thing in the file and must take the form of a
valid YAML set between triple-dashed lines. Here is a basic example:
```yaml
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

```yaml
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

```yaml
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
documentation](https://squidfunk.github.io/mkdocs-material/reference/admonitions/).

```markdown
!!! tip
    Use admonitions to make your text more readable.
```

Specific cases are custom admonitions which need titles after keywords:

```markdown
!!! cli-alt "Command line alternative"
    You can also use `opkg` for this purpose.
```

### Content inclusion

Multiple documentation pages can share content. One or more parts of the text
in one page can be included to one or more other pages.

In the source page, a part that can be included is enveloped by a pair of
special marks (replace `NAME` by the real name of this part):

```markdown
<!--NAME-start-->

... content to be included ...

<!--NAME-end-->
```

It the destination page, insert an inclusion mark like this:

```
{!
  include-markdown "SOURCE.md"
  start="<!--NAME-start-->"
  end="<!--NAME-end-->"
!}
```

Replace `NAME` by the name meant above and `SOURCE.md` by the path to
the source Markdown file.

It has more features than described here. See the `include-markdown`
[documentation](https://pypi.org/project/mkdocs-include-markdown-plugin/)
for more information.
