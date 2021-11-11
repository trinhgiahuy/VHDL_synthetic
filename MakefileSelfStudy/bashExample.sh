#!/bin/bash

DIRS=project/lib
for file in ${DIRS}; do
	echo $$file
done


#-----------This is example of target notation
main_program.cpp: math.cpp draw.cpp
math.cpp: floating_point_calc.cpp integer_calc.cpp
draw.cpp: opengl.cpp

#------------If statements and vars
echo "What's the answer to the ultimate question of life, the universe, and everything?"
read -p "Answer: " number
# We dereference variables using the $ operator
echo "Your answer: $number computing..."
# if statement
# The double brackets are necessary, whenever we want to calculate the value of an expression or subexpression, we have to use double brackets, imagine you have selective double vision.
if (( number == 42 ))
then
	echo "Correct!"
	# This notation, even though it's more easily readable, is rarely used.
elif (( number == 41 || number == 43 )); then
	echo "So close!"
	# This is a more common approach
else
	echo "Incorrect, you will have to wait 7 and a half million years for the answer!"
fi

#-------------Check if project is generated

# Very important note, the whitespace between `[` and `-d` is absolutely essential
# If you remove it, it'll cause a compilation error
if [ -d project_dir ]					# Similar to using command `test` : test -d FILENAME to check if the provided file exist and is a directory
then
	echo "Dir already generated."
else
	echo "No directory found, generating..."
	mkdir project_dir
fi

#-------------Can be rewritten as
[ -d project_dir ] || mkdir project_dir 
#-------------Or futher with nested expression
[ -d project_dir ] || (echo "No directory found, generating..." && mkdir project_dir)