---
layout: page
title: About
description: About the CDSS common docs, acknowledgements, and contributors
nav_order: 1
---

# About

This site is part of the [Seamless Learning](https://github.com/berkeley-cdss/seamless-learning) initiative.

The Seamless Learning project proposes an open-source, light-weight, and sustainable suite of tools to integrate Research, Teaching & Learning (RTL) and custom course tool platforms. Today, there is a suite of custom course tools used primarily by EECS, Data Science, Statistics—the three undergraduate programs in the new College of Computing, Data, and Society (CDSS). Collectively, each year these dozens of tools are jointly developed by hundreds of Teaching Assistants (TAs) and reach thousands of students in a variety of courses. While custom course tools have proven their utility, we must support instructors and TAs across campus who are also managing high enrollments.

Overall project goals:

* Improve large classroom management,
* Enable equitable grading strategies, and
* Foster an educational technology community across campus. We're all here to teach and learn!

## Contact

You can message any of the contributors on Slack on EECS/DS Crossroads or email us at [{{ site.email }}](mailto:{{ site.email }}).

## Contributors

Sorted by name, alphabetically.

{% assign contributors = site.contributors %}
{% for contributor in contributors %}
{{ contributor }}
{% endfor %}

## Acknowledgements

We'd like to thank [peyrin](https://github.com/peyrin) and others that have contributed to [CS 161's pedagogy site](https://pedagogy.cs161.org/) for recognizing the need for central documentation with CDSS and inspiring the creation of this site.

Seamless Learning run by [Lisa Yan](https://github.com/yanlisa) and [Michael Ball](https://github.com/cycomachead) is an essential place for gathering staff, TAs, and faculty to discuss common issues. The documentation here is a direct result of Seamless Learning's efforts.

We'd also like to thank all of the contributors to the software that our courses depend on, especially those helping maintain open source software.
