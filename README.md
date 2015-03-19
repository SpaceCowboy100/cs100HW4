#quick reference for ```Makefile```s
`Makefile`s are a powerful tool which makes it easier for others to compile and run your code.
`Makefile`s are special files which are utilized with the `make` [command] (http://unixhelp.ed.ac.uk/CGI/man-cgi?make) to automatically build your projects.  

In projects, `Makefile`s should be placed in the root directory, the files you wish to execute for the `Makefile` should be placed in a directory called `src`. 
The executables you create from your `Makefile` should be stored in a directory called `bin`.

##syntax
Before we compile and run our code with a `Makefile` we need to familiarize ourselves with some `bash` [syntax] (https://www.gnu.org/software/bash/manual/bash.html).
```
	if [ ! -d bin ]; then mkdir bin; fi
```
This is a simple if-else statement which we will include in our `Makefile`. 
If there is not a directory called `bin`, then make a directory called `bin`. 
Note the spaces in `[ ! -d bin ]` `bash` syntax requires there to be spaces for `[]` brackets in order to correctly identify variables. 
If the Makefile instead contained `if [! -d bin ]; then mkdir bin; fi` there would be error thrown. 

Setting [variables] (http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-5.html) is also good practice for `Makefile`s
```
	FLAGS=-ansi -pedantic -Wall -Werror
```
Here we have a variable `FLAGS` and are setting `FLAGS` to the `g++` flags we want to compile our source code with.
Note that there are no spaces after the `=`.

##example
We have source code `hello.cpp` in our `src` directory which outputs `Hello World!`.
Here are the contents of the `Makefile`: 
```
	FLAGS=-Wall -Werror
```
Here we are setting the variable `FLAGS` to `-Wall -Werror`. 
Although this may seem redundant for such a small project, in larger projects you can just change the value of `FLAGS` instead of changing every occurance of `-Wall -Werror`.  

```
	all:
```
`all` is the default 'target' for `Makefiles`. The `make` command will execute this target if no other is specified.
```
	if [ ! -d bin ]; then mkdir bin; fi
	g++ $(FLAGS) src/hello.cpp -o bin/hello
```

Here we are using an if-else statement to make sure we have a directory `bin` which will store our executables.
The next line compiles `hello.cpp` with the flags we specified and stores the executable `hello` in our `bin` directory.
We now have our `Makefile` let's test it out!
From the root directory enter `make`.

```
	$ make
```
You should see the following:
```
	if [ ! -d bin ]; then mkdir bin; fi
	g++ -Wall -Werror src/hello.cpp -o bin/hello

```
Our source code compiled successfully. Now enter the following to run the executable:
```
	$ bin/hello
	Hello World!	
```
We have our `Makefile` up and running! Now we can add to our project.


##targets
In smaller projects we may only have one target, `all` however in large projects you may not want to compile the entire contents of the `src` directory, only specified source code.  
All source code under the `all` target will compile when you enter the `$ make` command from the terminal. 
If you had `foo.cpp` in your `src` directory and want to only compile and run the `foo` executable your `Makefile` would look similar to this:

```
	all:
		if [ ! -d bin ]; then mkdir bin; fi
		g++ src/file1.cpp -o bin/file1
		g++ src/file2.cpp -o bin/file2
		g++ src/foo.cpp -o bin/foo

	foo:
		if [ ! -d bin ]; then mkdir bin; fi
		g++ src/foo.cpp -o bin/foo
```

What's going on?
We have two targets `all` and `foo`.
For both targets, we are using our if-else statement from earlier to make sure that our executables are stored in the `bin` directory.
In this example `Makefile`, when you enter `$ make` `file1.cpp`, `file2.cpp`, and `foo.cpp` will compile and executables `file1`, `file2`, and `foo` will be created and placed in the `bin` directory.
If you instead entered `$ make foo` then only `foo.cpp` would compile and the executable `foo` will be created in the `bin` directory.
