#quick reference to ```Makefile```
```Makefile```s are special files which are utilized with the ```make``` [command] (http://unixhelp.ed.ac.uk/CGI/man-cgi?make) to automatically build your projects.

Why are ```Makefile```s so important? Instead of entering a command such as ```g++ main.cpp -o main``` and ```./main``` to run your program, you can just enter ```make``` to run your program. Most importantly in open source projects others can view your project and may want to work with it, however they may not know how to comple and run it. Creating ```Makefile```s will make it easier for others to compile and run your code.

In projects, ```Makefile```s should be placed in the root directory, the files you wish to execute for the ```Makefile``` should be placed in a directory called ```src```.

Let's say we have a program ```ls.cpp``` in our ```src``` directory, this program will list all files in our current directory. Let's try running our program using a ```Makefile``` instead of the *old* way. Here is the ```Makefile``` in its entirety:

```
CFLAGS=-ansi -pedantic -Wall -Werror

all:
  if [ ! -d bin ]; then mkdir bin; fi
  g++ $(CFLAGS) src/ls.cpp -o bin/ls

ls: 
	if [ ! -d bin ]; then mkdir bin; fi
	g++ $(CFLAGS) src/ls.cpp -o bin/ls
```

Now let's figure out what's going on.
```
CFLAGS=-ansi -pedantic -Wall -Werror
```
Here we are setting a variable ```CFLAGS``` to the flags we want to run our program with.
We have two targets in this ```Makefile```. The first target is ```all``` and the second target is ```ls```.
```
all:
  if [ ! -d bin ]; then mkdir bin; fi
  g++ $(CFLAGS) src/ls.cpp -o bin/ls
```
The first line of the ```all``` target is a simple if-else statement. If there is not a directory called ```bin``` then make a directory called ```bin```. 
The second line is compiling our program with ```g++``` using the flags we specified in line 1. It specifies the target is in the ```src``` directory and the file is ```ls.cpp```. ```-o bin/ls``` creates an executable ```ls``` in the ```bin``` directory. Note the spaces in ```[ ! -d bin ]``` ```bash``` syntax requires there to be spaces for ```[]``` brackets in order to correctly identify variables. if the Makefile instead contained ```if [! -d bin ]; then mkdir bin; fi``` you would see something similar to this:
```
	$: make
	$:if [! -d bin  ]; then mkdir bin; fi
	/bin/sh: [!: command not found
```

