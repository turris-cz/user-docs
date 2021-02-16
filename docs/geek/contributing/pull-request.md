---
competency: expert
---
# Submitting pull requests

If you have created a bug fix or an improvement for our software you can
create a *pull request* (or a *merge request* in GitLab's terminology).
We will review your code and possibly incorporate it to our code (if
it will comply our [code guidelines](style.md) and we will find it useful).

!!! important
    Please follow [our rules](style.md) for creating `git` commits.

Before merging, we may ask you to do some modifications or do such
changes ourself. We may also request explanation of used method,
programming techniques, algorithms and so on.

!!! notice
    Whatever way you choose we welcome your contributions. If you don't
    feel to be prepared to work on our code please [create an issue](issues.md)
    about your topic.

## By our GitLab instance

All of our projects are maintained in our [GitLab instance](https://gitlab.nic.cz/turris/).
You can register into it and fork the project you want to improve. When done
with your modifications, please create a merge request to the original project
(it should be prepared automatically if you create a MR).

!!! tip
    If you have an account on GitHub you can use it to sign into our GitLab.

## By GitHub

Some of our repositories are mirrored to [GitHub](https://github.com/).
It is not feasible to mirror every single repository we have as setup is done
manually at the moment. But if you have an account on GitHub you can use
it to fork one of our project hosted on this server and create a pull
request there.

## Using any public git repository hosting

If you don't have and don't want to create an account on the above described
servers but have write access to any publicly available `git` server you can
utilize this way. Simply clone the project you want to improve, do your
changes and push your commits to that server. Then send us the URL where
your branch is located.

## Through patches

If you can't use any of the previous ways there is still an older,
patch-based way how to contribute. You can utilize locally installed `git`
for patch preparation but it's not necessary to use it. Whichever
method you use please send the resulting patch(es) by e-mail to [packaging@turris.cz](mailto:packaging@turris.cz)

### With git

`git` can significantly simplify creating patches. You can work with it
as usually, ie. create branches, commit changes etc. When done, prepare
your patch using `git`.

To create a patch containing changes between a specific commit and the
current revision (`HEAD`) you can use a command like the following one:

```
git diff COMMIT > bugfix.patch
```

If you want to use a specific commit instead of `HEAD` you can execute
a command like this:

```
git diff COMMIT1 COMMIT2 > bugfix.patch
```

!!! tip
    See `man git-diff` for more information about creating patches.

`git` can also send your patch without manual work in your e-mail client.
See the [documentation](https://git-scm.com/docs/git-send-email) for more information.

### Without git (legacy way)

Patches can be prepared without `git` too. The only tool which you need
is `diff`. Before you start making your changes, create a backup of
the original file like this:

```
cp file.py file.py.orig
```

After modification you can create a patch using this command:

```
diff -Naur file.py.orig file.py > file.py.patch
```
