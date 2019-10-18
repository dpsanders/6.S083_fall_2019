# 6.0S83 Fall 2019
# Problem set 0: Install Julia

In this problem set, you will install Julia and the Juno IDE (Integrated Development Environment) on your computer.

Please complete this preferably before class on October 21, 2019 and you must complete it before class on October 23.

## 1. Install Julia

1. Download the current stable release of Julia from https://julialang.org/downloads. As of October 17, 2019, the stable version is 1.2, but version 1.3 should come out within the next few days; either version is fine.

    Note that for Linux you should just download the generic binary.

    It's OK to use an operating system package installer to install Julia instead, *provided* that the version installed is at least 1.2.

2. If you know how to do so, you probably want to set up some kind of link or alias so that you can run Julia from anywhere.


## 2. Install the Juno IDE

1. Download the Atom editor from https://atom.io/

2. Run Atom.

3. In the Atom menu, choose `Preferences -> Install` and install the package named `uber-juno`.


## 3. Run the test code

1. Load the `PS0_test.jl` file into Atom.

2. Change the name to your name (one first and one last name are enough).

3. Type `Alt-Enter` (`Option-Enter` on Mac) to execute the code block; in this case the code block is the whole. You should see the message `Test passed`, indicating success, and a greeting with your name in the REPL pane.

4. Take a screenshot of the successful execution and send it by email to `sandersd@mit.edu`. Make sure that the code, `Test passed` message, and REPL, including the Julia version, are all visible in the screenshot.

    The title of the email should be `6.S083 PS0: <name>`, replacing `<name>` with your name (one first and one last name).
