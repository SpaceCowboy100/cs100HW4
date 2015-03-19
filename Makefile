CFLAGS=-Wall -Werror

all:
	if [ ! -d bin  ]; then mkdir bin; fi
	g++ $(CFLAGS) src/hello.cpp -o bin/hello
