---
layout: page
title: Welcome!
nav_exclude: true
permalink: /
seo:
  type: Course
  name: Berkeley Class Site
---

# UC Berkeley CDSS Common Documentation

{% assign announcements = site.announcements | reverse %}
{% for announcement in announcements %}
{{ announcement }}
{% endfor %}

## Documentation for tools developed or maintained by Seamless Learning, CDSS TAs, and staff

The Seamless Learning project proposes an open-source, light-weight, and sustainable suite of tools to integrate Research, Teaching & Learning (RTL) and custom course tool platforms. Today, there is a suite of custom course tools used primarily by EECS, Data Science, Statistics—the three undergraduate programs in the new College of Computing, Data, and Society (CDSS). Collectively, each year these dozens of tools are jointly developed by hundreds of Teaching Assistants (TAs) and reach thousands of students in a variety of courses. While custom course tools have proven their utility, we must support instructors and TAs across campus who are also managing high enrollments.

Overall project goals:

* Improve large classroom management,
* Enable equitable grading strategies, and
* Foster an educational technology community across campus. We're all here to teach and learn!
