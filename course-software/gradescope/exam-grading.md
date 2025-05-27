---
layout: page
title: Exam Grading
parent: Gradescope
nav_order: 1
---

# Exam Grading

This section will outline the specific protocols pertaining to grading exams on Gradescope, but the tips
will be useful for written assignment grading as well.

## Creating an Outline

For all structured exams, Gradescope will ask you to upload a PDF of the exam to create an outline.
Part of this includes finding which region of the exam you want the question to encompass.

<img src="{{ site.baseurl }}/assets/images/gradescope/exam-outline.png" width="500px" alt="gradescope exam outline">

The box size you choose to include depends on the type of question you're grading. If the question requires a
single specific answer (e.g. `8 KiB` or 30 sectors), you may want to restrict the box to the answer box
itself. If the question is a short or long answer however, it is fine to include the question, as it makes it
easier for other graders to review the entire rubric en masse. The next section will explain why.

## Answer Groups

When grading a question, you're given the option of grading individually, or specific answer groups: blank
answers, multiple choice, text, or math. Multiple choice is self-explanatory.

<img src="{{ site.baseurl }}/assets/images/gradescope/answer-groups.png" width="400px" alt="gradescope answer groups">

**Text/math**: When doing text or math, the algorithm will evaluate all text within the box you've selected for
the answer outline, which is why restricting the outline box to the answer box will help eliminate erroneous
groupings that include scratch work.

If you intend to evaluate an answer fully taking the work they show into account, it is likely fine to include
both the answer box and the scratch work box and just do blank answer grouping.

**Blank answer grouping**: For all questions requiring explanations of one or more sentences, you should almost
always be grouping by blank answers, _not_ grading individually. Here is one framework that has worked well
historically across several classes:

1. Create three default answer groups: Blank, Fully incorrect, Fully correct. For answers you're 100% sure
deserve no points or full points respectively, add them to these answer groups.
2. For every response you're unsure of, create a new answer group describing what this response did. Add all
future responses matching this to this answer group.
3. You will end up with between 4-10 answer groups, depending on the question. Now just create a rubric that
captures these answer groups and grade!

Because grouping responses into answer groups takes the vast majority of the time, this method ends up being just
as fast as grading individual responses 1 by 1, if not faster. In addition to this, there are a few notable
benefits of grading this way over grading individual responses:

- It is very easy to go back and update the rubric, because assigning a new grade to every answer group is much
faster than going through every individual response.
- It keeps the responses very well-structured. Even if you don't quite know how to assign points to a question
yet, you can complete 98% of the grading overhead simply by category grouping.
- The answer groups you create serve as a log of the responses your students provide, as well as how many
students wrote each response. Such is useful data for the future.

## Assigning points

A quick note on point assignment. The purpose of an exam is to test a student's understanding on certain topics.
The most objective way we currently have is assigning points on questions for student answers.
On one hand, the most important part of exam grading is having a consistent rubric that is applied equitably
for every student. In addition to this though, it matters too that the answers that are neither fully correct
nor fully incorrect are assigned points roughly proportionally to how correct they are.

For instance, suppose you give students a question, "Explain how an inode-based file system works."
A fully correct response might be one that briefly describes direct pointers and indirect pointers,
and that they make extending a file very natural (providing reasons why). We'll go through two example
responses and explain how grading it might work:

1. Explains what direct/indirect pointers are, that they substantially increase max file size.
2. Explains what direct/indirect pointers are, that having tiers of pointers balances
faster access to small files and support for bigger files simultaneously.

Let's suppose 2. is fully correct, and 1. is partially correct. In deciding how many points to assign
to each response, it's important to think: in the context of this class, how much more does a student have
to understand about inodes to understand what 2. is saying versus what 1. is saying? In other words,
roughly what percentage of the total knowledge does 1. capture?

These ideas apply to both free response and numerical answers. Suppose you are deciding how to assign
partial credit to a response which is off by 1, or off by a factor of 2. The same questions arise:
what percentage of complete understanding does the student have to grasp to arrive at this almost correct answer?

These questions will be left as a thought experiment for the reader, who is encouraged to think about
their own exams and how framing exam grading in this way might influence rubrics.

## Relevant Gradescope Docs

- [Managing Assignments](https://guides.gradescope.com/hc/en-us/sections/21586609950477-Managing-Assignments)
- [Exam/Quiz Assignments](https://guides.gradescope.com/hc/en-us/sections/27893603774605-Exam-Quiz-Assignments)
- [Answer Groups](https://guides.gradescope.com/hc/en-us/articles/24838908062093-AI-Assisted-Grading-and-Answer-Groups)
