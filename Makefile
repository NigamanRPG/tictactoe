CC=gcc
CFLAGS=-Iinclude -pedantic -Wall -Wextra -Wsign-conversion -Wconversion -Wshadow -ansi
OBJS=main.o codl.o
SRC=src

all: options main.o codl.o tictactoe

options:
	@echo TicTacToe build options:
	@echo "CC	= $(CC)"
	@echo "CFLAGS	= $(CFLAGS)"
	@echo

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
