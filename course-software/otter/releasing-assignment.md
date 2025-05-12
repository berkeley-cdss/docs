---
layout: page
title: Releasing an Assignment
parent: Otter Grader
---

<p class="warning">
This page is a work in progress. This is only the first draft.
</p>

# Releasing an Assignment using Otter Grader

This is one of many ways to release an assignment that students will complete on [DataHub](https://datahub.berkeley.edu/) and be graded with [Otter Grader](https://otter-grader.readthedocs.io/en/latest/index.html#). Data Science Undergraduate Education recommends this method.

Note: If you are working on an assignment that will be released to students on a course specific hub, please supply that hub whenever this guide references "DataHub" or "the hub" For example, Data 100 uses [data100.datahub](https://data100.datahub.berkeley.edu/), instead of [DataHub](https://datahub.berkeley.edu/).

## Before the start of the semester

1. Review what Python packages your class is using.
   * If you are not developing or altering assignments, you can use files like `requirements.txt` and look at your `import` statements.
   * For a systematic way to gather this information, we'll later provide a notebook that gathers all requirements into a a text file.

2. Check that all Python packages are available on the DataHub offering that your course is using.

3. If you need to request a package for your hub, fill out a [GitHub Issue](https://github.com/berkeley-dsep-infra/datahub/issues/new?assignees=&labels=support&template=datahub-package-addition---change-request.md&title=Request+python+package+X+for+class+Y). More information on requesting packages and testing for package compatibility on the hub [here](https://curriculum-guide.datahub.berkeley.edu/workflows/install-packages).

4. Ensure that the packages AND THEIR VERSIONS on the hub match your `requirements.txt` used by otter. To check a package version, use Python to import the package and print out its version like so:

```
import numpy
numpy.__version__
```

## Before an assignment is released

We recommend running `otter assign` on DataHub. We do NOT recommend running this command locally. You can clone the development repo in DataHub via the command line/terminal. It is safe to do so; you do not need to worry about students accidentally getting access to solutions.

Ensure that the solution runs on DataHub without issue; i.e. "Run All Cells" on the solution notebook generated from `otter assign`.

Only push to the student facing repository once all changes have been made. You don't want to accidentally break an nbgitpuller link.

Create your nbgitpuller link using [this plug in](https://chromewebstore.google.com/detail/datahub-link-generator/ijbgangngghdanhcnaliiobbiffocahf). Ensure that the JupyterHub URL is for the intended DataHub.
