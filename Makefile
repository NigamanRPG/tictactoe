CC=gcc
CFLAGS=-Iinclude -pedantic -Wall -Wextra -Wsign-conversion -Wconversion -Wshadow -ansi
OBJS=main.o codl.o
SRC=src

all: options prepare main.o codl.o tictactoe

options:
	@echo TicTacToe build options:
	@echo "CC	= $(CC)"
	@echo "CFLAGS	= $(CFLAGS)"
	@echo

prepare:
	mkdir -p include
	[ -f ${SRC}/codl.c ] || curl https://raw.githubusercontent.com/celtrecium/codl/master/codl.c -o ${SRC}/codl.c
	[ -f include/codl.h ] || curl https://raw.githubusercontent.com/celtrecium/codl/master/codl.h -o include/codl.h

clean:
	rm -rf tictactoe

main.o: ${SRC}/main.c
	${CC} ${CFLAGS} -c $^

codl.o: ${SRC}/codl.c
	${CC} ${CFLAGS} -c $^

tictactoe: ${OBJS}
	${CC} ${CFLAGS} $^ -o $@
	rm -rf ${OBJS}
	@echo "Now you can run the game. Enjoy! :>"
