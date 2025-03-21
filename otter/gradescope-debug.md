---
layout: page
title: Gradescope Debugging via SSH
parent: Otter Grader
nav_order: 2
---

# Otter-Gradescope Debugging

Downloading a student's graded submission concatenates the output from the autograder and a PDF copy of the student's submitted `.ipynb`. This PDF of the `.ipynb` will have the output from public tests run on datahub (or wherever the student completed the assignment); it will not have the output from the autograder running in the grading container. 

It is possible that the grading container may have a different environment than datahub (or wherever the student completed the assignment) if `requirements.txt` is out of date. **We do not recommend running student submissions locally,** and it is also possible that the environment is different than whatever you may have locally.

It is also possible that a student's submission has changed since the public tests were run on datahub. Data 100 has seen a number of cases where an indent was accidentally added to a code block, preventing a cell with a student's answer from executing in the grading container. Consequently, those students failed tests in the grading container that they previously passed.

## Interact with a student's submission in the grading container

1. On Gradescope, select a specific submission to debug. Once you can view the submission, on the bottom toolbar click "Debug via SSH." It may take a few minutes for the debugging session to initialize.

2. SSH into the grading container using the provided command from the blue box at the top of the screen with the submission. The command will look something like `ssh username@remote-host -p password`.

3. Activate the virtual environment from `requirements.txt` in the grading container using `conda activate otter-env`.

4. If `jupyterlab` was not an included requirement, run `pip install jupyterlab`. You can check if `jupyterlab` was installed by running `conda list | grep jupyterlab`.

5. Start JupyterLab in the grading container: `jupyter lab --no-browser --port=8888 --allow-root`.

6. In a second terminal window, forward port 8888 from the grading container to your local machine: `ssh -L 8888:localhost:8888 username@remote-host -p password` using the same `username@remote-host -p password` from Step 2.

7. Access JupyterLab locally in your browser via the given link from the output from Step 4. Choose the link beginning with `http://localhost:8888/lab?token=...`

### Notes:
* What is printed to your terminal after SSH-ing into the grading container is useful information. Read it!
* You can run otter directly by running `python3 source/run_otter.py`. 
* To inspect the output of running otter directly on the student's submission, once you have `results/results.pkl`, run the following [Python snippet](https://otter-grader.readthedocs.io/en/latest/debugging.html#viewing-the-executed-notebook) to look at and `.ipynb`:

```
import dill
import nbformat

with open("results.pkl", "rb") as f:
    res = dill.load(f)

nbformat.write(res.notebook, "executed.ipynb")
```

* If you want to interact with, not just inspect `executed.ipynb`, you will need to move that notebook from the `results` directory to the `submission` directory.
* You may need to adjust the kernel to use the virtual environment `otter-env`. If you open a terminal from JupyterLab you will need to rerun `conda activate otter-env` if you see `(base)` on the lefthand side of the prompt.

