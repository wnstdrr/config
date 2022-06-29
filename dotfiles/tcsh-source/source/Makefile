CC=gcc
CFLAGS=-O3 -Wall -Wextra -pedantic -fPIC -Wformat-security -Wimplicit-function-declaration

main:
	mkdir -p exec/
	$(CC) -o exec/tcsh-state tcshstate.c $(CFLAGS)
	$(CC) -o exec/colours colours.c $(CFLAGS)
