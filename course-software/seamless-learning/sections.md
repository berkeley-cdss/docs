---
layout: page
title: Sections
parent: Seamless Learning
nav_order: 3
---

# Sections

The sections tool (formerly the CS 61A sections tool) allows instructors to manage discussion, lab, and/or tutoring sections and track attendance. It is typically used by CDSS courses with 999 sections where all students enroll in the same lab/discussion section on CalCentral, and then enroll in sections once the semester begins.

- [Public GitHub repository](https://github.com/Cal-CS-61A-Staff/sections), automatically synced with a [directory of the CS 61A private course repository](https://github.com/Cal-CS-61A-Staff/berkeley-cs61a/tree/master/apps/sections).
- [Sections Tool app (CS 61A instance)](https://sections.cs61a.org/). You must be enrolled in the CS 61A bCourses course to access. 

{: .note }
Because the sections tool is a lightweight tool meant to display information about sections to students, allow students to switch their section time to open sections, and track attendance, it does not include a way for staff to programmatically enroll students into sections. Students can directly enroll in sections, however.

[Here](https://drive.google.com/file/d/1KcqD3jhjexkPvocGY-O4XPIhJh5C31T2/view?usp=sharing) is an example program for how to assign students to sections. Your course may already maintain a separate script for section assignment.

## Configuring authentication

In order to login to the sections tool, your course must configure authentication through [auth.cs61a.org](https://auth.cs61a.org). An existing CS 61A Auth course administrator can activate auth for your course (or replace an existing auth endpoint from a previous semester) by following these instructions:

1. Go to [auth.cs61a.org](https://auth.cs61a.org)
2. Login with your @berkeley.edu email
3. Under the Admin > Courses section, there are some text fields to "Activate Auth for a new course." Fill in the information (course name, OkPy endpoint, and bCourses ID).
    - OkPy endpoint is the endpoint configured for your course at [okpy.org](https://okpy.org/)
    - bCourses ID is the string of digits in the URL for your courses's [bCourses](https://bcourses.berkeley.edu/) home page: `https://bcourses.berkeley.edu/courses/<COURSE_ID>`
1. Ensure your bCourses course is published. If the course is not published, authentication for the sections tool will not work.

{: .note }
Ask on the EECS or DS Crossroads Slack if you aren't an admin and need to be added.

## Register your course's sections domain

Each course can deploy an instance of the sections tool under their course website domain, such as
CS 61A's [sections.cs61a.org](https://sections.cs61a.org) or DATA C88C's [sections.c88c.org](https://sections.c88c.org). You only need to register the domain once. You should first configure authentication (above), then register the domain if needed.

You must 
1. Correspond with Silas Santini as soon as possible letting them know the domain you'd like to use. This is necessary to add a redirect URI to the bCourses auth key.
2. Create a CNAME record where the host is "sections" and the data is "proxy.cs61a.org".
1. Register the sections subdomain (e.g. sections.course.org) in [auth](https://auth.cs61a.org/).
1. Verify that your domain is good to go by visiting [domains](sections.course.org). Ensure that you've previously logged into auth with an email that is an admin for the course you'd like to check on. You should see something like `sections.course.org (sections) - SUCCESS`. 
1. If something other than `SUCCESS` is displayed, first check that the CNAME record is visible when you run `dig sections.course.org` in a terminal. Once the CNAME record is visible with `dig`, try deleting and re-adding the domain on auth which will retrigger certbot and fix the issue. Correspond with Silas Santini or CS 61A staff if issues persist.

## Permissions

Access and permissions to each sections instance is determined by bCourses enrollment with the bCourses course ID set in auth. 
* Admin permissions are granted to instructors and lead TAs.
* Staff permissions are granted to instructors and all TAs.
* Base-level permissions and access are granted to anyone with bCourses enrollment (including observers).
* If you're not enrolled in bCourses, you can complete the bCourses auth flow, but will end up with a 403 "Forbidden". 

## Configuring your course settings

1. Go to your course's sections tool instance.
2. Login (it will ask you to authorize the sections tool to access your Canvas/bCourses account, click **Authorize**).
3. Click on the **Admin** page in the navbar.
4. If you are reconfiguring your course's sections tool, there may be data from the previous semester still there. To reset the tool, in the General tab, click the **Reset Sections Tool** button. **This is destructive, be careful!**
5. Optional: In the General tab, set the welcome message students will see on the sections tool homepage when they login and click **Save**.
6. On the Lab, Discussion, and Tutoring tabs, **we recommend initially turning off all settings** so that students don't enroll in sections before they have been completely set up by staff. Of course, if your course doesn't have certain kinds of sections (e.g. tutoring), it also makes sense to turn those off.

## Creating sections

1. Go to your course's sections tool instance.
2. Login (it will ask you to authorize the sections tool to access your Canvas/bCourses account, click **Authorize**).
3. Click on the **Admin** page in the navbar.
4. In the General tab, click on **Import Sections**. This will display a modal where you can copy and paste the link to a Google Sheet containing metadata about the sections you wish to create. **Make sure to follow the format of the sample spreadsheet, otherwise importing will fail.** Note that if you students to be able to join or switch into a section *at any point,* "Can Self Enroll" must be "TRUE." This setting is required in addition to the Admin toggles. Typically, "Can Self Enroll" is only set to false for Scholars sections or other sections that require staff to tightly control enrollmentt.
5. If the import was successful, you should be able to see the newly created sections on their corresponding page (e.g. if you imported lab sections, click on **Lab** in the navbar to view all lab sections).
6. If you turned off enrollment settings when [configuring your course settings](#configuring-your-course-settings), click on the **Admin** page in the navbar. In the Lab, Discussion, and/or Tutoring tabs, turn on any enrollment settings you wish.

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

1. Go to your course's sections tool instance.
2. Login (it will ask you to authorize the sections tool to access your Canvas/bCourses account, click **Authorize**).
3. In the **General** tab, click **Import Enrollment**. This will display a modal where you can copy and paste the link to a Google Sheet containing student emails and the sections they're enrolled in. **Make sure to follow the format of the sample spreadsheet, otherwise importing will fail.**

### Enrolling individual students

{: .note }
Enrolling individual students using this method will remove them from any existing sections they're in of the same type (e.g. if you enroll a student in a lab section this way, their enrollment in any other lab sections will be removed).

1. Go to your course's sections tool instance.
2. Login (it will ask you to authorize the sections tool to access your Canvas/bCourses account, click **Authorize**).
3. Go to the **Lab**, **Discussion**, and/or **Tutoring** page using the navbar
4. If you are the staff member teaching the section, click on **View Details** for your section. Otherwise you can also just click on other staff members' sections to view the section details.
5. Click on the **Roster** tab.
6. Click on the **Add Students** tab and enter a comma-separated list of student emails.

## Updating existing sections

### Updating section metadata

Only admins (instructors and lead TAs) see a section's **Settings** tab.

1. Go to your course's sections tool instance.
2. Login (it will ask you to authorize the sections tool to access your Canvas/bCourses account, click **Authorize**).
3. Go to the **Lab**, **Discussion**, and/or **Tutoring** page using the navbar
4. Click on **View Details** for the section you want to change.
5. Click on the **Settings** tab.
6. Edit any of these fields, then click **Submit Changes**:
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

Staff members should be able to login to the sections tool and customize information about their section,
such as writing a brief blurb introducing themselves (which will be displayed to students), providing a meeting link
if the section is online, or creating an enrollment code.

## API Access

You can programmatically access information about sections (such as attendance) via API. To generate a secret, visit [auth.cs61a.org](https://auth.cs61a.org) and find the "Clients" section for your course. Once you've created a new client, make sure to treat your secret key with care; do not share with others. If a key has been leaked, delete it immediately. You can use this key to make requests like the following

```
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{
        "secret": "", # the secret generated from auth
        "email": "", # your email; must have access to auth
        "args": {
            "email": "<student>@berkeley.edu"
        }
      }' \
  "https://tutoring.cs61a.org/api/sudo/get_student_discussion_attendance" # the endpoint
```

You can see what API endpoints are available by looking for the `@api` decorator in the [public GitHub repo](https://github.com/Cal-CS-61A-Staff/sections).
