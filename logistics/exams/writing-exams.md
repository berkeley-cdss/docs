---
layout: page
title: Writing Exams
parent: Exams
nav_order: 1
---

# Writing Exams

## Tools for Writing Exams

Many tools have been used over the years for writing exams, including the following.

### Paper and Pencil Exams

- Latex, typically using [Overleaf](https://www.overleaf.com/) for its in-browser editor, compiler, and previewer and its collaboration features
- CS 61A's [examtool](https://pypi.org/project/examtool/) which is a combination of tools:
    - The now deprecated examtool web app which allowed students to take exams online
    - The examtool CLI which allows instructors/TAs to compile exams from .md and .tex files to PDF
    - The examtool Markdown syntax
- Most recently, [Typst](https://typst.app/), a Latex and Overleaf alternative, has been gaining popularity for its in-browser editor, compiler, and previewer and its local features
    - CS 61C has a Typst exam template [61c-examst](https://github.com/61c-teach/cs61c-examst) developed by Andrew Liu (liu.andrew@)
    - Data 8 has an official Typst library [exm](https://github.com/data-8/exm) developed by Tim Xie (xie@). See more info on the [Worksheets page](../../worksheets)

### Online Exams

- [Gradescope online assignments](https://guides.gradescope.com/hc/en-us/articles/23603175384717-Creating-an-Online-Assignment) can be autograded, randomized, and scheduled to release/close at specific times. It is relatively easy to setup.
- [PrairieLearn](https://www.prairielearn.com/), especially if you are using a [Computer Based Testing Facility (CBTF)](https://acelab.berkeley.edu/cbtf/), is another option that supports more customization of question types and randomization. However, it involves more setup.

## Pedagogical Considerations

- **Make sure the question has an appropriate difficulty.**
    - Generally, exam questions should be more difficult than questions asked in formative assessments such as HW, Lab, or Discussion.
    - You may wish to structure your exam such that easier questions are first and harder questions are later so that students can show as much knowledge as they can instead of getting stuck.
    - There is a difference between assessing students’ higher-order thinking skills and making a question difficult/convoluted for the sake of it.
        - For example, one [learning objective](https://teaching.berkeley.edu/resources/design/course-level-learning-goalsoutcomes) you may wish students to achieve is: "Students should be able to index into a list." It is unnecessary to write a question that asks students to deal with a 3+ dimensional list for the sake of making the question "more difficult."
- **Your question should test students on their knowledge of concepts from the course, not reading comprehension!**
    - Before writing your question, come up with a list of [learning objectives](https://teaching.berkeley.edu/resources/design/course-level-learning-goalsoutcomes) you are assessing and then base your problem off of that.
    - Keep question descriptions as concise and clear as possible. Be specific about the requirements for a particular function. Consider edge cases and whether you want students to handle those cases. For example, can the list be empty? Can the number be negative or zero?
    - Include diagrams when appropriate (e.g. for linked list and tree questions, or if the problem is easier to understand with figures).
    - Do not assume knowledge that is not explicitly taught in your course (unless it is a prerequisite) and make sure your question adheres to [inclusivity guidelines](https://blog.pamelafox.org/2022/08/cs-content-inclusivity-guide.html)
        - While pop culture references can make the exam more fun and lighthearted, do not go too deep into them. A student should be able to do the problem without any knowledge of said pop culture reference.
        - Avoid sensitive topics that could cause unnecessary distress. For example, a problem about cats dying and referencing their "nine lives" may seem fun at first, but can be retraumatizing to someone whose cat died.
        - Remember that for many students, English may not be their native language.
- **Consider different question types (short answer, long answer, MCQ, multi-select)**. Short and long answer questions are generally more difficult and harder to guess than MCQ and multi-select.
- **Consider how your question would be graded. Some questions to consider:**
    - Are there multiple possible solutions to the problem? If there are, that could make grading more difficult. Consider changing things like the skeleton code or question format to restrict the possible answer space.
    - How long would it take to grade?
        - MCQ and multi-select are generally fast to grade using [Gradescope's grouping feature](https://guides.gradescope.com/hc/en-us/articles/24838908062093-AI-Assisted-Grading-and-Answer-Groups).
        - Short answer and long answer take significantly longer.
    - How many points should each subpart be worth?
        - Generally award more points for problems that assess higher-order thinking skills.
        - Generally avoid fractional points (e.g. 1.5 points) unless needed.
    - What rubric would you use? What partial credit can be awarded, if any? Do you need a special rubric for questions that build off of each other?
- **Be careful with questions that build off of each other.**
    - The benefit of a question like this is that it is more applicable to real life and assesses higher-order thinking skills.
    - The downside of a question like this is that you may accidentally put students in *double jeopardy* where a mistake in an earlier subpart causes them to have the wrong answer in a later subpart, even if the procedure they did in the later subpart was correct
- **Consider allowing students access to a staff-created reference sheet and/or allowing students to bring their own self-made cheatsheets** to emphasize higher-order thinking skills on the exam rather than memorization.

See also posts from CS 161's Pedagogy Blog:

- [Exam Writing I](https://pedagogy.cs161.org/2022/02/06/exam-writing-i/)
- [Making Reference Sheets I](https://pedagogy.cs161.org/2022/02/07/making-reference-sheets-i/)

## Formatting Considerations

The following are formatting considerations for paper/pencil exams:

- **Use text formatting and/or elements like tables or diagrams to make the problem easily skimmable.** Students will be doing a lot of reading, under a lot of time pressure, and will probably need to repeatedly look back and forth between the problem text and where they put their answer. Make it as easy as possible for them to see the information they need to solve the problem (unless of course you are trying to test their ability to discern which information is relevant). For example, having a table that summarizes a Python function's inputs and outputs can be easier to read than a paragraph of text explaining the same information.
    - **Format inline and block code using monospaced font**.
    - Use **bold** or *italics* to signify important phrases or terms.
- **Be aware of page breaks.** If you question spans multiple pages, be aware that you may be forcing students to flip back and forth, which can be time-consuming and be noisy distractions in the exam room. On the other hand, you may want to insert your own blank pages to ensure that the first page is the cover page of the exam, and the last page is a blank page. This prevents students from seeing information about the exam questions until they are told to open their exam packets by the proctors.
- **Give students as much space as you can give them to write their answers.** People have different handwriting and handwriting generally takes up more space than printed text. Make answer blanks or answer boxes big! This also helps your staff grade more effectively because students don't squish their answer into small spaces.
- **Be careful not to accidentally give away information to students.** For example, the size of an answer blank should not give students hints as to how much code they should write in that blank. Avoid awarding points for multi-select questions that suggests how many correct options there are.
- **Consider how accessible your exam format is.** For example, exam PDFs will sometimes include images. While images can help present information in a more intuitive way than text, for students who have vision impairments and use screen readers, you should provide an image description or alternative format. If something on the exam is text or code, instead of putting it in the image, just put it in the actual PDF document; only put information in an image that absolutely must be an image.

## Quality Assurance (QA)

Once you have written a draft of your exam, you should always:

1. Verify that the solutions you wrote to the problems are actually correct.
2. Verify that the exam could reasonably be done by students in the amount of time you plan to give them (we will call this "feasibility").

### Verifying Correctness

Verifying correctness will vary depending on what topics your course covers, but could mean something like the following:

- **For code writing questions:** Write, compile, and run the solution code against unit tests to ensure that it works. In Python you can do this relatively easily using using the [doctest](https://docs.python.org/3/library/doctest.html) module.
- **For environment diagram questions:** Use [Python Tutor](https://pythontutor.com/) to verify that the diagram you drew matches what would actually happen.
- **Make sure to consider edge cases.**
    - **What is the valid range of inputs and outputs?** Make sure to include this in the instructions of the problem when appropriate.
    - **Are there multiple ways to solve the problem?** Would it be appropriate to provide more scaffolding to narrow the solution space? This can speed up grading but gives students less flexibility to demonstrate their learning.

### Verifying Feasibility

Every course has a different way of verifying the feasibility of an exam, but generally it is good practice to **give course staff members the draft exam and have them attempt the entire exam (or certain problems) under the same conditions of a student**. The staff member should time how long it takes them to do the exam/problem and record any feedback they have about the problem so that whoever is writing the exam can improve on their draft. It is also important to consider that staff members are generally more experienced than students, so **if it takes a staff member 100% of the allotted time to do the exam, most students will probably take longer than that**.

We recommend that you **do multiple cycles of feedback and iteration** so that the exam is in the best shape it can be when students actually take it. Some **tools that can help facilitate problem review**:

- Google Doc [comments](https://support.google.com/docs/answer/65129?hl=en&co=GENIE.Platform%3DDesktop&sjid=3909499601827881322-NC) and [suggestions](https://support.google.com/docs/answer/6033474?hl=en&co=GENIE.Platform%3DDesktop)
- GitHub [pull request reviews](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)
- Overleaf [comments](https://docs.overleaf.com/collaborating/commenting)
- Typst [comments](https://typst.app/docs/web-app/comments/) (requires Typst Pro subscription)

Even after multiple rounds of review, there can sometimes still be typos, mistakes, or ambiguous text in the exam. Thus, we also recommend creating a **clarifications document** that can be projected to students in their exam rooms, and that is updated live by staff members as they receive questions during the exam (if you decide to take questions during the exam). A clarifications doc has the added benefit of being a record of which questions to flag when grading (e.g. if the question had a fundamental problem in it, you may wish to drop it). Additionally, if you choose to release a final, cleaned up version of the exam and solutions PDFs, the issues in the clarifications doc should be fixed so that if future students use it as a studying resource, they will not run into the same issues.
