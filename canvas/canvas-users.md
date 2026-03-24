---
layout: page
title: Canvas Users
parent: Canvas
nav_order: 3
---

# Canvas Users

## Adding Users
* [How do I add users?](https://community.instructure.com/en/kb/articles/660963-how-do-i-add-users-to-a-course#add-new-user)
* [How do I add an admin?](https://community.instructure.com/en/kb/articles/661407-how-do-i-add-an-admin-to-an-account)
* [SIS Import Format Documentation](https://developerdocs.instructure.com/services/canvas/sis/file.sis_csv)
* SIS Sheet (Non-students):

<div class="table-wrapper" tabindex="0" role="region" aria-label="User Data Table">

| user_id | login_id | email | first_name | last_name | full_name | sortable_name | canvas_password_notification | declared_user_type | status | account_id | authentication_provider_id |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| UID:952109 | ball | ball@berkeley.edu | Michael | Ball | Michael Ball | Ball, Michael | TRUE | administrative | active | 1 | canvas |

</div>

Likely, you won't have the permissions to add users or promote to admin as linked above on the production bCourses Canvas instance, but these articles are still useful for use in the [Sandbox]({{ 'canvas/sandbox' | relative_url }}). For production bCourses, check out:
* [How do I request an administrator role in bCourses?](https://berkeley.service-now.com/kb_view.do?sysparm_article=KB0011247)
* [bCourses Roles and Permissions Summary Matrix](https://docs.google.com/spreadsheets/u/0/d/e/2PACX-1vSz0eGkR8ZobudN62PsXyohlO1gHX8_3oE28SOngVhyxHvzWbixMMHE76wYBtYUwn024rtWi6l0OcWL/pubhtml?pli=1)  Toggle between "course roles" and "account roles."
* [bCourses Admin Roles and Permissions](https://berkeley.service-now.com/kb/en/bcourses-admin-roles-and-permissions?id=kb_article_view&sysparm_article=KB0011079)


## Available IDs
*  `User ID` / `UID` / `directory ID`: exposed as `sis_login_id` in Canvas. 
    * Numeric, sequential, monotonically increasing from the date of creation of CalNet. 
    * Immutable.
    * Technically not FERPA procteded. 
* `Student ID`: exposed as sis_user_id in Canvas for current students.
    * Comes in many forms. Not all SIDs are 10 digits, but newly issued ones are.
    * Immutable.
    * FERPA protected. 
* `Cnavas User ID`: created by Canvas for use internal to Canvas.
    * Numeric.
    * Immutable.
* `CalNet ID`: a public facing user name. 
    * String.
    * Mutable. 
* `Email`: often the same as CalNet ID. 
    * String.
    * Mutable.


## Emails
* We don't recommend using emails as primary keys. 
    * While emails are unique, they are not a singular identifier of a person. A person may change their [CalNet ID](https://calnet.berkeley.edu/calnet-me/manage-my-calnet-account/you-change-your-calnet-id). In most cases, the updated CalNet ID is used, however the first CalNet ID is not deleted so it may still surface. 
    * Additionally, people may set up email aliases. It can be annoying to detect when an alias is provided in place of a login email. 


## Student ID Numbers in Canvas
* Student IDs (SIDs) are found in Canvas under "SIS User ID" or "SIS ID." 
* Sometimes, a SID is unavailable so the value will be "UID:*******" (Canvas user ID).
* Because of this, do not assume that SIS User IDs are numeric.