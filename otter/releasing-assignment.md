---
layout: page
title: Releasing an Assignment
parent: Otter Grader
nav_order: 1
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
<!--
    * TODO: For a systematic way to gather this information, place this notebook at the root of your directory and run through it.
-->

2. Check that all Python packages are available on the DataHub offering that your course is using.

3. If you need to request a package for your hub, fill out a new [GitHub Issue](https://github.com/berkeley-dsep-infra/datahub/issues). Choose the "Package Addition/Change Request" Template. 

## Before an assignment is released

We recommend running `otter assign` on DataHub. We do NOT recommend running this command locally. You can clone the development repo in DataHub via the command line/terminal. It is safe to do so; you do not need to worry about students accidentally getting access to the solutions.

Ensure that the solution runs on DataHub without issue; i.e. "Run All Cells" on the solution notebook generated from `otter assign`. 

Only push to the student facing repository once all changes have been made. You don't want to accidentally break an nbgitpuller link.

Create your nbgitpuller link using [this plug in](https://chromewebstore.google.com/detail/datahub-link-generator/ijbgangngghdanhcnaliiobbiffocahf). Ensure that the JupyterHub URL is for the intended DataHub.