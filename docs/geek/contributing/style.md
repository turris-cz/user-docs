---
competency: expert
---
# Turris project coding style

All code accepted to the Turris project must have convenient quality.
The base directions are described on this page. Please read and follow
them carefully.

## General rules

- Write readable and well-structured code.
- Simple is better than complex, explicit is better than implicit etc. – see
[The Zen of Python](https://www.python.org/dev/peps/pep-0020/).
- Use accurate names for classes, variables, constants,
functions/methods, modules etc. For example, `read_file` is better than
`slurp` or `upload_url` is better than `u`.
- Use short functions/methods which does exactly their names say.
- Try to keep your code self-explaining instead of adding comments.
- Needless or bad comment is worse than no comment.

Please read *Clean Code* by Robert C. Martin for more inspiration.

## Python

- Use Python 3.
- Read and follow [PEP 8 – Style Guide for Python Code](https://www.python.org/dev/peps/pep-0008/)
and [PEP 20 – The Zen of Python](https://www.python.org/dev/peps/pep-0020/).
- Keep lines max. 120 characters long, indent by 4 characters.
- Use a linter and `flake8` to check your code.
- Write tests and use them with `pytest`.

## C/C++

### Linux Kernel coding style

Please use the [Linux Kernel coding style](https://www.kernel.org/doc/html/v4.10/process/coding-style.html)
with these exceptions:

- Tabs for indentations use only 4 characters.
- Comments are separated only by 1 character.
- Typecasts has no space after.
- Opening curly brackets are on the same lines as function names.
- Statements inside of `switch` are indented by one tab.

### Other rules

- Use GCC and autotools for building.
- Your code must pass through `cppcheck` a `gcc` without warnings.
- Keep in mind descriptiveness of the langugage; e.g. `char` and `int8_t` are
identical for compilers but not for human readers.
- One line should have only one effect. The only exceptions are operators
like `++` and `--`, function arguments and loop conditions.
- Don't use side effects as primary usage.
- Prefer memory allocation over dereference over type specifications.
- Local macros are better than code copying.
- Constants should be defined at the beginning of files or in separate
file and not deep in code.
- All macros must be safe (use brackets).
- Variable scopes should be as small as possible.
- Header files should include only files necessary for interpretations
of types used inside these headers.
- Use of `__attributes__` is possible and encouraged.
- Write tests and use them with `check`.

## JavaScript

- Follow the [Airbnb JavaScript Style Guide](https://github.com/airbnb/javascript).
- Use [React](https://reactjs.org/) for implementing user interfaces.
- Check your code by [ESLint](https://eslint.org/) and add `airbnb` (and
`airbnb/hooks` for React hooks) rules to `.eslinterc.js` (use `extends`).
- Write tests and use them with [JEST](https://jestjs.io/).
- Use [webpack](https://webpack.js.org/) for bundling.

## Rules for git commits

- Each commit should contain exactly one change (bug fix, new feature...).
Don't combine multiple changes in one commit and don't split one change to
multiple commits.
- Commit messages should be self-explaining, unambiguous and understandable.
For example, *"Organize GUI buttons in grid"* is better than *"Improve GUI
layout"*.
- Use imperative instead of indicative. For example, *"Add animated progress
indicator"* is better than *"Animated progress indicator added"*.
- In modularized code, prepend module names, e.g. *"net/ntpclient: Fix
hotplugging crashes"*.
- Keep commit messages short. If you really need to explain something you
can use additional lines for more detailed information.
