# FOR GNU make manual, please see : https://www.gnu.org/software/make/manual/html_node/
# Variable
# Variables can only be strings. Here's an example of using them:

files = file1 file2
some_file: $(files)
    echo "Look at this variable: " $(files)
    touch some_file

file1:
    touch file1
file2:
    touch file2

clean:
    rm -f file1 file2 some_file

# Reference variables using ${} or $()
x = dude

all: 
	echo $(x)
	echo ${x}
	
	#Bad practice but works
	echo $x
	
# Targets
# * The all target
# Make an `all` target for multiple target running
all: one two three

one:
    touch one
two:
    touch two
three:
    touch three

clean:
    rm -f one two three

# * Multiple targets
# When there are multiple target for a rule, command will run each
# $@ is an automatic variable that contain target name
all: f1.o f2.of

f1.o f2.o:
	echo $@
# Same as
# f1.o
# 	echo $@
# f2.o
# 	echo $@

# Automatic variable and Wildcards
# More at : https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
# Wildcard * : Searcj your filesystem for matching filenames, => suggest wrap it in `wildcard` function, otherwise fall into common pitfall

# Print out information about every .c  file1
print: $(wildcard *.c)
	ls -la $?

# Fancy Rule
# * Static Pattern Rules
# A typical use case is to compile .c files into .o files. Here's the manual way:

objects = foo.o bar.o all.o
all: $(objects)

# These files compile via implicit rules
foo.o: foo.c
bar.o: bar.c
all.o: all.c

all.c:
    echo "int main() { return 0; }" > all.c

%.c:
    touch $@

clean:
    rm -f *.c *.o all
	
# Here's the more efficient way, using a static pattern rule:

objects = foo.o bar.o all.o
all: $(objects)

# These files compile via implicit rules
# Syntax - targets ...: target-pattern: prereq-patterns ...
# In the case of the first target, foo.o, the target-pattern matches foo.o and sets the "stem" to be "foo".
# It then replaces the '%' in prereq-patterns with that stem
$(objects): %.o: %.c

all.c:
    echo "int main() { return 0; }" > all.c

%.c:
    touch $@

clean:
    rm -f *.c *.o all

# Static Pattern Rules and Filter
obj_files = foo.result bar.o lose.o
src_files = foo.raw bar.c lose.c

all: $(obj_files)

$(filter %.o,$(obj_files)): %.o: %.c
    echo "target: $@ prereq: $<"
$(filter %.result,$(obj_files)): %.result: %.raw
    echo "target: $@ prereq: $<" 

%.c %.raw:
    touch $@

clean:
    rm -f $(src_files)

# Implicit rules
# Compiling a C program: n.o is made automatically from n.c with a command of the form 
$(CC) -c $(CPPFLAGS) $(CFLAGS)
# Compiling a C++ program: n.o is made automatically from n.cc or n.cpp with a command of the form 
$(CXX) -c $(CPPFLAGS) $(CXXFLAGS)
# Linking a single object file: n is made automatically from n.o by running the command 
$(CC) $(LDFLAGS) n.o $(LOADLIBES) $(LDLIBS)

# Fundamental var used by implicit rule: 
CC: Program for compiling C programs; default cc
CXX: Program for compiling C++ programs; default G++
CFLAGS: Extra flags to give to the C compiler
CXXFLAGS: Extra flags to give to the C++ compiler
CPPFLAGS: Extra flags to give to the C preprocessor
LDFLAGS: Extra flags to give to compilers when they are supposed to invoke the linker