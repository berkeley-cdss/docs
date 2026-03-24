---
layout: page
title: Developer Keys
parent: Canvas
nav_order: 2
---

# Developer Keys

From the [official Canvas documentation](https://developerdocs.instructure.com/services/canvas/oauth2/file.developer_keys): 

> "Developer keys are OAuth2 client ID and secret pairs stored in Canvas that allow third-party applications to request access to Canvas API endpoints via the OAuth2 flow. Access is granted after a user authorizes an app and Canvas creates an API access token that’s returned in the final request of the OAuth2 flow.  
> Developer keys created in a root account, by root account administrators or Instructure employees, are only functional for the account they are created in and its sub-accounts... By scoping the tokens, Canvas allows root account administrators to manage the specific API endpoints that tokens issued from a developer key have access to."

Said another way, the API server (Canvas) validates third-party apps (domain+redirect URI) and API key/API secret, and makes a request. Requests can authenticate users and provide information available on Canvas.

## Use in Development
You can complete development work and test dev keys on the [Sandbox]({{ 'canvas/sandbox' | relative_url }}). 

Individual persons do not need individual dev keys; you can (and should) re-use dev keys within development groups. For example, one dev key has been used by multiple iterations of CS61A and other course staff for development work on [sections]({{ 'course-software/seamless-learning/sections' | relative_url }}) for multiple semesters. When the domain, routes (redirect URIs) and scopes are the same, you can (and should) share the use of a single dev key.

We recommend that scoped keys are turned on even during development. Keys must be scoped in production, so doing this step early will decrease headaches later. If you have separate development efforts on the same app happening simultaneously that require different scopes, you may want to create separate dev keys. However, please keep dev keys created to a minimum. 

## Use in Production
Once you have verified your workflow in your development environment using a dev key for the Sandbox AND you've determined a minimal set of scopes, you're ready to request use in production. A staff (non-student) or faculty member should reach out to bcourseshelp AT berkeley DOT edu.  The process of granting a production key includes Docusign. 

## More on OAuth2
[Canvas Oauth2 Overview](https://developerdocs.instructure.com/services/canvas/oauth2/file.oauth)

If something is going wrong with authentication, make sure that what is listed in the developer key is correct. Redirect URIs must match **exactly.**
