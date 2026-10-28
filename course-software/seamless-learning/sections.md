---
layout: page
title: Sections
parent: Seamless Learning
nav_order: 3
---

# Sections

The sections tool (formerly the CS 61A sections tool) allows instructors to manage discussion, lab, and/or tutoring sections and track attendance. It is typically used by CDSS courses with 999 sections where all students enroll in the same lab/discussion section on CalCentral, and then enroll in sections once the semester begins.

- [GitHub repository](https://github.com/berkeley-cdss/sections)
- Sections app: TODO: Sections URL. Everyone logs in with bCourses.

Beginning in Spring 2027, one Sections deployment serves every bCourses course, so courses no longer run their own instance or set up authentication. Each course has its own pages under the Sections site. The old per-course domains, such as sections.cs61a.org and sections.c88c.org, redirect to TODO: Sections URL.

Staff can enroll students in sections themselves: see [Directly enrolling students into sections](#directly-enrolling-students-into-sections). [Here](https://drive.google.com/file/d/1KcqD3jhjexkPvocGY-O4XPIhJh5C31T2/view?usp=sharing) is an example program for how to assign students to sections. Your course may already maintain a separate script for section assignment.

## Setting up Sections for your course

A TA or instructor in the bCourses course sets Sections up once per course:

1. Go to TODO: Sections URL and log in with bCourses. The first time, bCourses asks you to authorize Sections; click **Authorize**.
2. Click **Import courses from Canvas**. This lists the bCourses courses where you're a TA or instructor that don't have Sections set up yet.
3. Check your course and click **Import**.

Your course then appears under **Staff Course Offerings**. Click it to open the course's Sections pages.

If your course isn't listed, make sure it exists and is active in bCourses, then log out of Sections and log in again.

To take a course off Sections, click the **×** next to it under **Staff Course Offerings**. Its sections and attendance are kept, and come back if you import the course again.

## Permissions

Each person's role in a course comes from their bCourses enrollment:
* Admin permissions are granted to instructors and Lead TAs.
* Staff permissions are granted to instructors and all TAs.
* Students can join sections and see their attendance.
* Anyone else, including observers, can't open the course in Sections.

Roles are read from bCourses when someone logs in. Someone added to the bCourses course, or given a new role, after logging in needs to log out of Sections and log in again.

## Configuring your course settings

1. Log in to Sections and open your course (see [Setting up Sections for your course](#setting-up-sections-for-your-course)).
2. Click on the **Admin** page in the navbar.
3. If you are reconfiguring your course's sections tool, there may be data from the previous semester still there. To reset the tool, in the General tab, click the **Reset Sections Tool** button. **This is destructive, be careful!**
4. Optional: In the General tab, set the welcome message students will see on the sections tool homepage when they login and click **Save**.
5. On the Lab, Discussion, and Tutoring tabs, **we recommend initially turning off all settings** so that students don't enroll in sections before they have been completely set up by staff. Of course, if your course doesn't have certain kinds of sections (e.g. tutoring), it also makes sense to turn those off.

## Creating sections

1. Log in to Sections and open your course.
2. Click on the **Admin** page in the navbar.
3. In the General tab, click on **Import Sections**. This will display a modal where you can copy and paste the link to a Google Sheet containing metadata about the sections you wish to create. **Make sure to follow the format of the sample spreadsheet, otherwise importing will fail.** Note that if you students to be able to join or switch into a section *at any point,* "Can Self Enroll" must be "TRUE." This setting is required in addition to the Admin toggles. Typically, "Can Self Enroll" is only set to false for Scholars sections or other sections that require staff to tightly control enrollmentt.
4. If the import was successful, you should be able to see the newly created sections on their corresponding page (e.g. if you imported lab sections, click on **Lab** in the navbar to view all lab sections).
5. If you turned off enrollment settings when [configuring your course settings](#configuring-your-course-settings), click on the **Admin** page in the navbar. In the Lab, Discussion, and/or Tutoring tabs, turn on any enrollment settings you wish.

### Reimporting sections

You can edit the Google Sheet and click **Import Sections** again at any time, for example to change capacities or add a new section. Reimporting doesn't create duplicate sections:

- A row whose Type, Day, Start, End and Location exactly match an existing section updates that section's staff member, capacity, tags and "Can Self Enroll" setting. Students already in the section stay enrolled.
- If more than one section (or row) has the same Type, Day, Start, End and Location, such as several "Online" sections at the same time, the row's Email must also match the section's staff member.
- A row that doesn't match an existing section creates a new section.
- Sections that aren't in the sheet are left alone. To remove one, see [Deleting a section](#deleting-a-section).

After the import, a message says how many sections were added and how many were updated.

{: .note }
Changing a section's Type, Day, Start, End or Location in the sheet means the row no longer matches that section, so reimporting creates a new section and leaves the old one in place. Make those changes in the section's [Settings tab](#updating-section-metadata) instead.

If a row would set a section's capacity below the number of students already enrolled in it, or has a day or time the tool can't read, the import stops and nothing is imported. The error message gives the sheet's row number.

## Directly enrolling students into sections

### Mass-enrolling students

1. Log in to Sections and open your course.
2. Click on the **Admin** page in the navbar.
3. In the **General** tab, click **Import Students**. This will display a modal where you can copy and paste the link to a Google Sheet containing student emails and the sections they're enrolled in. **Make sure to follow the format of the sample spreadsheet, otherwise importing will fail.**

### Enrolling individual students

{: .note }
Enrolling individual students using this method will remove them from any existing sections they're in of the same type (e.g. if you enroll a student in a lab section this way, their enrollment in any other lab sections will be removed).

1. Log in to Sections and open your course.
2. Go to the **Lab**, **Discussion**, and/or **Tutoring** page using the navbar
3. If you are the staff member teaching the section, click on **View Details** for your section. Otherwise you can also just click on other staff members' sections to view the section details.
4. Click on the **Roster** tab.
5. Click on the **Add Students** tab and enter a comma-separated list of student emails.

## Updating existing sections

### Updating section metadata

Only admins (instructors and lead TAs) see a section's **Settings** tab.

1. Log in to Sections and open your course.
2. Go to the **Lab**, **Discussion**, and/or **Tutoring** page using the navbar
3. Click on **View Details** for the section you want to change.
4. Click on the **Settings** tab.
5. Edit any of these fields, then click **Submit Changes**:
    - **Staff Member**: see [Changing a section's staff member](#changing-a-sections-staff-member).
    - **Capacity**: a whole number, at least the number of students already enrolled.
    - **Location**
    - **Day**: one of M, T, W, Th or F.
    - **Start Time** and **End Time**: hh:mm followed by a or p, with a leading 0 (for example 08:30a or 02:15p). The end time must be after the start time.
    - **Tags**: separated by commas.

A message below the button says whether your changes were saved. If any change is rejected, its error appears at the top of the page. Either way, the fields then show the section's saved values, so a rejected value has to be entered again after you fix it.

### Changing a section's staff member

To reassign a section, for example to swap two TAs, pick the new staff member from the **Staff Member** dropdown in the section's [Settings tab](#updating-section-metadata), or pick **Unassigned**. You don't need to reset or reimport anything, and the section's students stay enrolled.

The dropdown lists:
- TAs and instructors in the course on bCourses who have logged in to the sections tool, going by their bCourses role when they last logged in. Someone added to the bCourses course since then needs to log out and back in before they appear.
- Anyone listed as a section's staff member in an imported Sections sheet who hasn't logged in yet.

Staff members can also claim or leave sections themselves if the matching settings are turned on in the Lab, Discussion, and Tutoring tabs of the **Admin** page.

### Updating section capacities

Change a section's **Capacity** in its [Settings tab](#updating-section-metadata), or change the capacities in your Sections sheet and [reimport it](#reimporting-sections). Either way, students stay in their sections, and a capacity can't be set below the number of students already enrolled. To lower it further, move students out of the section first.

### Deleting a section

An admin can delete a section once no students are enrolled in it: open the section, go to the **Roster** tab, and click **Delete Section**.

{: .note }
Staff can enroll students above the set capacity of a section. The section will display no open seats until enrollment goes under capacity. Capacity is most important if you allow students to switch sections themselves using the sections tool.

## Section customization by staff members

Staff can customize the sections they teach from their section's card on the **Lab**, **Discussion**, or **Tutoring** page:
- A short introduction shown to students (at most 255 characters).
- A video call link, if the section meets online.
- An enrollment code, for sections students can join themselves. Students then need the code to join.

## API Access

Sections functions marked with the `@api` decorator in the [GitHub repository](https://github.com/berkeley-cdss/sections) can also be called by a program, for example to read attendance. API access currently works for every course on the deployment at once, so it isn't self-service: [contact the maintainers]({% link about.md %}#contact) if your course needs it. [berkeley-cdss/sections#29](https://github.com/berkeley-cdss/sections/issues/29) tracks limiting API access to the courses you're an admin for.

Once you have access, requests look like this, where `<canvas course id>` is the number in your course's bCourses URL:

```
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{
        "secret": "", # the secret from the maintainers
        "email": "", # the course member to act as
        "args": {
            "email": "<student>@berkeley.edu"
        }
      }' \
  "TODO: Sections URL/offerings/<canvas course id>/api/sudo/get_student_discussion_attendance"
```
