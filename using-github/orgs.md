---
layout: page
title: GitHub Organizations
parent: Using GitHub
nav_order: 1
---

# GitHub Organizations

## How Data Science Undergraduate Studies (DSUS) Uses GitHub Organizations

DSUS has a [GitHub Enterprise instance](https://github.com/enterprises/dsus). DSUS is willing to house non-DATA class organizations if there is a need. 

DSUS has one GitHub Organization per class. For courses using DataHub, typically there are three repositories created each semester:
* **Semester Website.** This public repository holds the Jekyll website for a single semester. Typically named semYY: `spYY | suYY | faYY`.
* **Student Materials.** This public repository holds the Jupyter Notebooks for all components of the course including lectures and student assignments. Student assignments are usually the output of running `otter assign`. Each course has their own naming philosphy, but commonly `semYY-student` or `semYY-materials`
* **Unreleased Materials.** This private repository is used for development of Jupyter Notebooks and other assignments. These repositories are typically named `semYY-dev` or `materials-semYY-private`.

Other repositories in these organizations include exams, private grading repositories (grading scripts and *no student data*), textbooks, and guides.

Each semester, course staff that need access are added to a [GitHub Team](https://docs.github.com/en/organizations/organizing-members-into-teams/about-teams). You can control access to repositories via teams; there is no need to add individuals to repositories. We've found it useful to have an "admin" team with higher levels of access (anything beyond "write"). You may also consider multiple teams per semester with varying levels of access to various repositories; for example, a "dev only" team may be useful.
