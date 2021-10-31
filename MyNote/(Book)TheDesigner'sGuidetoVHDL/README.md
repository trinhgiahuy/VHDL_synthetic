## Chap1: Fundamental Concept
### Elements of Behavior
Such an architecture body include only **process statenent**, which are collections of actions to be executed in sequence => Sequential statement

* Reg4

## Chap2: Scalar Data Types and Operation

Difference between variable assignment and signal assigment.

+ A variable assigment immidiately overwrites the variable with new value.

+ A signal assigment schedules a new value to be applied to a signal at some later time.


If we define our own types for port, the type name must be declare in a package, so that they are visible in the entity declaration.

package int_types is
	type small_int is range 0 to 255;
end package int_type

use work.int_types.all;
entity small_adder is
	port(a,b: in small_int; s: out small_int);
end entity small_adder;


* Attribute of Scalar type

T'left		Left most value in T
T'right		Right most value in T
T'low		least value in T
T'high		greatest value in T
T'ascending	true if T is an ascending range, false otherwise
T'image(x)	a string representing the value of x
T'value(s)	the value in T that is represented by s

type resistance is range 0 to 1E9
	units
		ohm;
		kohm = 1000 ohm;
		Mohm = 1000 kohm;
end units resistance;	

resistance'left = 0 ohm
resistance'right = 1E9 ohm
resistance'low = 0 ohm
resistance'high = 1E9 ohm
resistance'ascending = true
resistance'image(2 kohm) = "2000 ohm"			--String represent value x
resistance'value("5 Mohm") = 5_000_000 ohm		--value of x

* Attribute that applies to just discrete and physical types

T'pos(x)			-- position number of x in T
T'val(n)			--value in T at position n
T'succ(x)			--value in T at position one greater than that of x
T'pred(x)			--value in T at position one less than that of x
T'leftof(x)			--value in T at position one to the left of x
T'rightof(x)			--value in T at position one to the right of x

