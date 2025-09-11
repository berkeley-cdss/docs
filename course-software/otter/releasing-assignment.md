---
layout: page
title: Releasing an Assignment
parent: Otter Grader
---

# Releasing an Assignment using Otter Grader

This is one of many ways to release an assignment that students will complete on [DataHub](https://datahub.berkeley.edu/) and be graded with [Otter Grader](https://otter-grader.readthedocs.io/en/latest/index.html#). Data Science Undergraduate Education recommends this method where **all development** takes place on DataHub.

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

Confirm that the source notebook (the one passed to `otter assign`) is accessible.  

**Run `otter assign` on DataHub.** We do NOT recommend to run this command locally, even if you're using a virtual environment. You can clone the development repo in DataHub via the command line/terminal. 

Ensure that the solution runs on DataHub without issue; i.e. "Run All Cells" on the solution notebook generated from `otter assign` and ensure that all tests pass. 

Ensure that the autograder builds on Gradescope and submit the solution notebook generated from `otter assign` to test the autograder. All tests should pass. 

Only push to the student facing repository once all changes have been made. You don't want to accidentally break an nbgitpuller link.

Create your nbgitpuller link using [this plug in](https://chromewebstore.google.com/detail/datahub-link-generator/ijbgangngghdanhcnaliiobbiffocahf). Ensure that the JupyterHub URL is for the intended DataHub. You should redownload this plug in every semester because updates are unfortunately not automatic.
