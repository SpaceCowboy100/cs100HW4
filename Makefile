CFLAGS=-ansi -pedantic -Wall -Werror

all:
	if [ ! -d bin  ]; then mkdir bin; fi
	g++ $(CFLAGS) src/ls.cpp -o bin/ls

ls:
	if [ ! -d bin  ]; then mkdir bin; fi
	g++ $(CFLAGS) src/ls.cpp -o bin/ls

