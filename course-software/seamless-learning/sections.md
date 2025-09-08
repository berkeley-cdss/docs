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
Because the sections tool is a lightweight tool meant to display information about sections to students, allow students to switch their section time to open sections, and track attendance, it does not include a way to determine which students should be enrolled in what sections. 

[Here](https://drive.google.com/file/d/1KcqD3jhjexkPvocGY-O4XPIhJh5C31T2/view?usp=sharing) is an example program for how to assign students to sections. Your course may already maintain a separate script for section assignment.

## Creating a sections tool instance for your course

Each course can deploy an instance of the sections tool under their course website domain, such as
CS 61A's [sections.cs61a.org](https://sections.cs61a.org) or DATA C88C's [sections.c88c.org](https://sections.c88c.org).

You must 
1. Create a CNAME record where the host is "sections" and the data is "proxy.cs61a.org".
1. Register the sections subdomain (e.g. sections.course.org) in [auth](https://auth.cs61a.org/).
1. Correspond with Silas Santini or CS 61A staff to set a certificate on the proxy for the new sections instance. This will require a quick (15 minute) Zoom call and access to the domain (also required for step 1) because we must complete a DNS challenge.

## Configuring authentication

In order to login to the sections tool, your course must configure authentication through [auth.cs61a.org](https://auth.cs61a.org). An existing CS 61A Auth course administrator can activate auth for your course (or replace an existing auth endpoint from a previous semester) by following these instructions:

1. Go to [auth.cs61a.org](https://auth.cs61a.org)
2. Login with your @berkeley.edu email
3. Under the Admin > Courses section, there are some text fields to "Activate Auth for a new course." Fill in the information (course name, OkPy endpoint, and bCourses ID).
    - OkPy endpoint is the endpoint configured for your course at [okpy.org](https://okpy.org/)
    - bCourses ID is the string of digits in the URL for your courses's [bCourses](https://bcourses.berkeley.edu/) home page: `https://bcourses.berkeley.edu/courses/<COURSE_ID>`
1. Ensure your bCourses course is published. If the course is not published, the authentication for the sections tool will not work.

{: .note }
Ask on the EECS or DS Crossroads Slack if you aren't an admin and need to be added.

## Permissions

Access and permissions to each sections instance is determined by bCourses enrollment with the bCourses course ID set in auth. 
* Admin permissions are granted to instructors and lead TAs.
* Staff permissions are granted to instructors and all TAs.
* Base-level permissions and access are granted to anyone with bCourses enrollment (including observers).
* If you're not enrolled in bCourses, you can complete the bCourses auth flow, but will end up with an "Internal Server Error". 

## Configuring your course settings

1. Go to your course's sections tool instance.
2. Login (it will ask you to authorize the sections tool to access your Canvas/bCourses account, click **Authorize**).
3. Click on the **Admin** page in the navbar.
4. If you are reconfiguring your course's sections tool, there may be data from the previous semester still there. To reset the tool, in the General tab, click the **Reset Sections Tool** button. **This is destructive, be careful!**
5. Optional: In the General tab, set the welcome message students will see on the sections tool homepage when they login and click **Save**.
6. On the Lab, Discussion, and Tutoring tabs, **we recommend initially turning off all settings** so that students don't enroll in sections before they have been completely set up by staff. Of course, if your course doesn't have certain kinds of sections (e.g. tutoring), it also makes sense to turn those off.

## Creating sections

{: .warning }
If sections already exist, reimporting them will result in duplicate sections.

- Track this [issue](https://github.com/Cal-CS-61A-Staff/berkeley-cs61a/issues/7788) on GitHub. Note: You must be on of the private CS61A repository to see this issue.
- See [Updating existing sections](#updating-existing-sections) for more information.

1. Go to your course's sections tool instance.
2. Login (it will ask you to authorize the sections tool to access your Canvas/bCourses account, click **Authorize**).
3. Click on the **Admin** page in the navbar.
4. In the General tab, click on **Import Sections**. This will display a modal where you can copy and paste the link to a Google Sheet containing metadata about the sections you wish to create. **Make sure to follow the format of the sample spreadsheet, otherwise importing will fail.**
5. If the import was successful, you should be able to see the newly created sections on their corresponding page (e.g. if you imported lab sections, click on **Lab** in the navbar to view all lab sections).
6. If you turned off enrollment settings when [configuring your course settings](#configuring-your-course-settings), click on the **Admin** page in the navbar. In the Lab, Discussion, and/or Tutoring tabs, turn on any enrollment settings you wish.

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

{: .warning}
Section capacity currently cannot be modified through the UI.

- Track this [issue](https://github.com/Cal-CS-61A-Staff/berkeley-cs61a/issues/7793) on GitHub.  Note: You must be on of the private CS61A repository to see this issue.
- See [Updating existing sections](#updating-existing-sections) for a workaround

1. Go to your course's sections tool instance.
2. Login (it will ask you to authorize the sections tool to access your Canvas/bCourses account, click **Authorize**).
3. Go to the **Lab**, **Discussion**, and/or **Tutoring** page using the navbar
4. If you are the staff member teaching the section, click on **View Details** for your section. Otherwise you can also just click on other staff members' sections to view the section details.
5. Click on the **Settings** tab.
6. Edit any fields you wish.

### Updating section capacities

1. Follow the instructions in [creating sections](#creating-sections), except modify the sections Google Sheet with your desired capacities and then import it. This will create [duplicate sections](https://github.com/Cal-CS-61A-Staff/berkeley-cs61a/issues/7788).
2. If you have not yet opened sections for enrollment, all you need to do is click into each outdated section and delete it. Otherwise, continue to step 3.
3. Click into each old section, go to the **Roster** tab, and click on **Copy Roster**.
    - If you are **expanding** section capacities: Click into the corresponding new section with updated capacity, go to the Roster tab, click on **Add Students**, and paste the list of student emails you copied in the previous step to move them into the new section.
    - If you are **decreasing** section capacities: You will need to manually move students around according to whatever your course policies are.

{: .note }
Staff can enroll students above the set capacity of a section. The section will display no open seats until enrollment goes under capacity. Capacity is most important if you allow students to switch sections themselves using the sections tool.

## Section customization by staff members

Staff members should be able to login to the sections tool and customize information about their section,
such as writing a brief blurb introducing themselves (which will be displayed to students), providing a meeting link
if the section is online, or creating an enrollment code.
