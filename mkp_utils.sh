create_main_c()
{
cat <<EOF > main.c
#include "main.h"

int main(void) {
	printf("Hello, world!\n");
	return 0;
}
EOF
}

create_main_h()
{
cat <<EOF > main.h
#ifndef MAIN_H
#define MAIN_H

#include <stdio.h>
#include <stdlib.h>

#endif
EOF
}

create_makefile()
{
cat <<EOF > Makefile
CC = cc
CCFLAGS = -Wall -Wextra -Werror -g3
NAME = a.out
SRCS = main.c
OBJECTS = \$(SRCS:.c=.o)

all: \$(NAME)

\$(NAME): \$(OBJECTS)
	\$(CC) \$(CCFLAGS) \$(OBJECTS) -o \$(NAME)

%.o: %.c
	\$(CC) \$(CCFLAGS) -c \$< -o \$@

clean:
	rm -f \$(OBJECTS)

fclean: clean
	rm -f \$(NAME)

re: fclean all
EOF
}

create_readme()
{
cat <<EOF > README.md
# Project Title

Simple overview of use/purpose.

## Description

An in-depth paragraph about your project and overview of use.

## Getting Started

### Dependencies

* Describe any prerequisites, libraries, OS version, etc.
* ex. Linux, MacOS, Windows

## Installing

* How/where to download your program
* Any modifications needed

### Executing program

* How to run the program

## Help

Any advice for common problems or issues.

## Authors

Contributors names and contact info

Makefile template by @DomPizzie

## Version History

* 0.2
	* Various bug fixes and optimizations
* 0.1
	* Initial Release

## License

This project is licensed under the [NAME HERE] License.

## Acknowledgments

Inspiration, code snippets, etc.
EOF
}