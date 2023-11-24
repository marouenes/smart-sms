# Developer Guide

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Development environment](#development-environment)
  - [Pre-commit Hooks](#pre-commit-hooks)

## Overview

TBD

## Prerequisites

TBD

## Development environment

TBD

### Pre-commit Hooks

First of all, make sure to install the pre-commit package, assuming you have pip installed on your machine.

```bash
pip install pre-commit
```

We are not able to include either pre-commit or tox in our requirements.txt due to transient dependencies. So we need to install them manually for development.

Pre-commit is a framework for managing and maintaining multi-language pre-commit hooks. It is a command line tool that is installed using pip. It is used to identify simple issues before submission to code review. It is also used to make sure that your code meets your team's standards before you commit changes.

You can refer to the [official documentation](https://pre-commit.com/) for more information.

The configuration for all the hooks are located under [pre-commit configuration](../.pre-commit-config.yaml) file. Where `repos` is a list of repositories to use for pre-commit hooks. Each repository is a git repository that contains pre-commit hooks. Each repository has a `rev` which is the git revision to use. The `hooks` is a list of hooks to use from the repository. Each hook has an `id` which is the name of the hook to use. The `args` is a list of arguments to pass to the hook.

Then you need to run the following command to install the pre-commit hooks locally:

```bash
make hooks
```

You'll see a message like this:

```bash
pre-commit installed at .git/hooks/pre-commit
pre-commit installed at .git/hooks/commit-msg
```

Once setup is done, it will run a few checks everytime you want to commit, making sure we keep a clean and consistent blame.

For skipping pre-commit checks you should use the `--no-verify` flag when committing:

```bash
git commit -m "some commit message" --no-verify
```
