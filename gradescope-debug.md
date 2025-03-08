---
layout: page
title: Gradescope Debugging via SSH
parent: Otter Grader
nav_order: 1
---

# Otter-Gradescope Debugging

## Interact with a student's submission in the grading container

This is a good idea when you're experiencing problems because it's possible that the grading container may have a different environment than datahub.

1. On Gradescope, select a specific submission to debug. Once you can view the submission, on the bottom toolbar click "Debug via SSH." It may take a few minutes for the debugging session to initialize.

2. SSH into the debugging container using the provided command from the blue box at the top of the screen with the submission. The command will look something like `ssh username@remote-host -p password` 

3. If `jupyterlab` was not an included requirement, run `pip install jupyterlab`

4. Start JupyterLab on the grading container: `jupyter lab --no-browser --port=8888 --allow-root`

5. In a second terminal window, forward port 8888 from the grading container to your local machine: `ssh -L 8888:localhost:8888 username@remote-host -p password` using the same `username@remote-host -p password` from Step 2.

6. Access JupyterLab locally in your browser via the given link from the output from Step 4 in your terminal. Choose the link beginning with " http://localhost:8888/lab?token=..."