# 6.0S83 Fall 2019
# Problem set 0: Install Julia

In this problem set, you will install Julia and the Juno IDE (Integrated Development Environment) on your computer.

Please complete this preferably before class on October 21, 2019; you *must* complete it before class on October 23, since there will be interactive exercises in class.

## 1. Install Julia

1. Download the current stable release of Julia from https://julialang.org/downloads. As of October 17, 2019, the stable version is 1.2, but version 1.3 should come out within the next few days; either version is fine.

    Note that for Linux you should just download the generic binary.

    It's OK to use an operating system package installer to install Julia instead, *provided* that the version installed is at least 1.2.

2. If you know how to do so, you probably want to set up some kind of link or alias so that you can run Julia from anywhere.

3. Browse through the [Julia home page](www.julialang.org), have a look at the [comprehensive Julia manual](https://docs.julialang.org/en/v1) and a [page with resources for learning the language](https://julialang.org/learning).


## 2. Install the Juno IDE

We will use the Juno IDE throughout the course. This consists of a set of plugins for the modern editor Atom. You can use Atom for editing all kinds of documents, not just Julia code.


1. Download and install the Atom editor from https://atom.io.

2. Run Atom.

3. In the Atom menu, choose `Preferences -> Install` and install the Atom package named `uber-juno`. This will install the Juno IDE, which is a collection of packages for Atom as well as some Julia packages for communicating with Atom.

4. For more information about Juno, see the [Juno home page](https://junolab.org).


## 3. Run the test code

1. Download the `PS0_test.jl` file. To do so, either

    - clone the repository, if you know how to use `git`; or

    - navigate to the file in GitHub and then right-click on the button marked `Raw`, choose `Save link as` and save the file.


2. Locate the file on your computer where you saved it. Make sure that the filename ends with `.jl`, the extension for Julia code files; if not, change it to end with `.jl`. (E.g. if your browser added `.txt` after the `.jl`., remove the `.txt` with your operating systems's file rename.)

3. Load the `PS0_test.jl` file into Atom.
You should see nice syntax highlighting (i.e. different colours for different elements in the program).

4. Replace my name by your name (one first and one last name are enough).

5. Type `Alt-Enter` (i.e. hold down the `Alt` key and hit `Enter`) (`Option-Enter` on Mac) to execute the code block; in this case the code block is all of the code. You should see the message `Test passed` in green, indicating success, and a greeting with your name in the REPL pane.

6. Take a screenshot of the successful execution and send it by email to `sandersd@mit.edu`. Make sure that the code, `Test passed` message, and REPL, including the Julia version, are all visible in the screenshot.

    The title of the email should be `6.S083 PS0: <name>`, replacing `<name>` with your name (one first and one last name).
