---
layout: page
title: Remove Sensitive Data from a GitHub Repository
parent: GitHub
nav_order: 3
---

# Remove Sensitive Data from a GitHub Repository

Oh no! Did you commit and push something sensitive to a public GitHub repository
(e.g. secrets, credentials, student information, or solutions)? This article is for you.

{: .warning}
Be careful running the following commands. These are DESTRUCTIVE actions. 🌋

## Using `git-filter-repo` to remove sensitive data from a repository

See this official guide from the [GitHub documentation](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository).

## Remove all commits up to a certain point

1. Find the last "good" commit hash by running:

    ```
    git log
    ```

    The output should have entries that look something like

    ```
    commit a3cf8b9261a52a8c34098e5316278ce52e40a9b5
    Author: Cal-CS-61A-Staff <cs61a@berkeley.edu>
    Date:   Wed Mar 26 20:41:07 2025 +0000
    ```

2. Take the commit hash (above `a3cf8b9261a52a8c34098e5316278ce52e40a9b5`) and run the following locally:

    ```
    git reset --hard <hash>
    ```

    If you'd like to remove only the latest commit you can run the following instead:

    ```
    git reset --hard HEAD~1
    ```

3. Reflect your changes on the remote (public GitHub repo):

    ```
    git push origin HEAD --force
    ```


## Remove only specific commits

If you have a mix of "good" and "bad" commits, you'll want to interactively rebase. [Read more about rebasing.](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase)

1. Identify the last commit hash after all all of the commits that you want to remove. The following commands may be useful for this:
    ```
    git log
    git reflog
    ```

2. Start the interactive rebase using that hash:

    ```
    git rebase -i <hash>
    ```

3. Identify the commits that you want to remove and remove them in the edit screen.

4. Resolve any conflicts.

5. In the edit screen, save and exit.

6. End the rebase by running:

    ```
    git rebase --continue
    ```

    If you messed up the rebase, here's your options:

    * Abort the rebase without resetting HEAD to the original branch ("clean up" the rebase):

        ```
        git rebase --quit
        ```

    * Abort the rebase and reset HEAD to the original branch ("undo" the rebase):

        ```
        git rebase --abort
        ```

    * Continue with the rebase, but skip any commits that introduce a merge conflict (any commits with merge conflicts will not be in the git history after finishing the rebase):

        ```
        git rebase --skip
        ```

7. Reflect your changes on the remote (public GitHub repo):

    ```
    git push origin HEAD --force
    ```
