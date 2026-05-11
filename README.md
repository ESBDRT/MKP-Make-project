# MKP-Make-Project

MKP is a script that allows you to create a project and initialize the local and remote repository in two commands.<br><br>It creates the folder structure,
creates the base files for the specific language specified by the option, initializes a local git repository, links it to a remote one and makes the first commit/push.

# Getting Started

### Operating systems

MKP is currently available on **Linux** and **MacOS**.

## Dependencies

### Linux

**Build essentials** (git, make, gcc)

### MacOS

**Xcode Command Line Tools** (git, make, gcc)

## Installation

One liner install :

```
git clone https://github.com/ESBDRT/MKP-make-project.git mkp &&\cd mkp &&\sudo make install
```

## Usage

Refer to the language options table to see which language is currently supported.

```
mkp <language_option> <project_name>
cd <project_name>
mkp setrem <remote_repo_url>
```

### Language options table

| Language        | Option           | Files/folders created  |
| :------------- |:-------------| :-----|
| C      | -c | Makefile<br>README.md<br>main.c<br>main.h<br>src/ |

More languages will be added in the future

## Acknowledgments

README.md template by @DomPizzie

Feel free to message me if you have any good ideas that i could add to project/report issues if you encounter any bugs !
