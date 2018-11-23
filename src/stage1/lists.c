My Language V0.2.3f 0000000 00-00-0000
Prealpha
======================================

Caution: early versions will probably be about as stable as a house of cards built atop of jenga towers sitting on a card table.
Code accordingly.

FUNCTIONS
---------

as a general rule:
- a function in ALL CAPS is a binary operator, which returns it's result, or a control function, which doesn't return.
- infix symbols are binary operators as above
- prefix symbols change how the thing they are attatched to is interpreted
- postfix symbols change a variable in place
- a function in lowercase needs it's arguments in (parenthases), and has it's return specified
- a symbol is a binary operator or a unary operator, and returns it's result
any returned array will be 1 dimensional.

My language will have the following functions:

wait(foo) : wait for foo milliseconds, returns void
time() : returns the current real time, timtyp
clock() : return the current program time, clktyp
beep() : print \a, returns void
donothing() : does nothing, optimised out

IF (foo) {} : if foo is true, do the function enclosed in {}.
ELSE {} : if the function if fails, do the function enclosed in {}.
ELSEIF (foo) {} : single-tier version of ELSE {IF (foo) {}}
WHILE (foo) {} : loop the function enclosed in {} until foo is false.
UNTIL (foo) {} : loop the function enclosed in {} until foo is true.
BREAK : immediately exit the current loop
GOTO (foo) : go to label foo. NOTE: there is no return function. putting a goto inside a function declaration can screw up your control flow.
DOTIMES (foo) {} : do whatever is in {} foo times. if foo is a float, rounds down. if foo is infinity, you're trying too hard.
MAP (foo) ❬x❭ {} : for array or linked list foo, do whatever is in {} where bar is the list item
KEY (foo) ❬x❭ {...} : key a list using x as the list item
¶foo : a label called foo. Please don't put these INSIDE loops unless you know what you're doing.
If you GOTO out of a WHILE or DOTIMES, the parser will think you are still in that loop! This does not apply to IF, ELSEIF, or ELSE.

printf(...) : print a formatted value to stdout, as in C. returns as in C. Formats as in C.
sprintf(...) : print a formatted value to variable, as in C. returns as in C. Formats as in C.
fprintf(...) : append a formatted value to file, as in C. returns as in C. Formats as in C.
scanf(...) : get a value matching format from stdin, as in C. returns as in C. Formats as in C.
sscanf(...) : get a value matching format from a string, as in C. returns as in C. Formats as in C.
fscanf(...) : get a value matching format from file, as in C. returns as in C. Formats as in C.
fflush(...) : flush an output file, as in C. returns as in C. Formats as in C.
fopen(...) : open a file as a stream, as in C. returns as in C. Formats as in C.
fclose(...) : close a stream, as in C. returns as in C. Formats as in C.
fseek(...) : go to an offset in a file, as in C. returns as in C. Formats as in C.
ftell(...) : get the current offset in a file, as in C. returns as in C. Formats as in C.
rewind(...) : go to the beginning of a file, as in C. returns as in C. Formats as in C.
write(foo, ...) : write the strings or variables to file foo, similar to Pascal. convert formats automaticaly.
writeln(foo, ...) : write the strings or variables to file foo and append a newline, similar to Pascal. convert formats automaticaly.
read(foo, ...) : read the next field from a file, similar to Pascal. foo is the file, subsequent arguments are variables.
readln(foo, ...) : read a line from a file and assign fields in order, similar to Pascal. foo is a file, subsequent fields are variables.

FUNCTION foo(...) {...} : define a function foo. () contains an exaustive list of the internal names of arguments, {} contains the function itself.
VARIADIC foo(bar) {...} : define a function foo. bar is an array of arguments, {} contains the function itself.
EXTERN foo(...) : define an external function that takes standard linkage.
TYPE FOO bar : define a datatype FOO, whereas FOO is a literal string of case insensitive letters or underscores and bar is number between 0 and CPU maximum (assumed to be 64) specifying bit width which may be prefixed by a U or S to indicate signing, and may be followed by a * to denote repeating units
FOO bar, quux, xyzzy : where FOO is a valid datatype, make variables bar, quux, and xyzzy that type
GLOBAL FOO bar, quux, xyzzy : where FOO is a valid datatype, make global variables bar, quux, and xyzzy that type
UNDECLARE bar, quux, xyzzy : unlink the names bar, quux, and xyzzy from the address they point to. the values can still be retrieved with direct addressing methods.
ARRAY foo[bar] {...} : make an array foo of size bar. More square brackets can be added as quux[xyzzy][plugh][waldo] to define a multi dimensional array.
foo[bar][quux] : the quux-th element of the bar-th column of array foo
STRUCT FOO {...} : create a structured datatype FOO with the keys named in {}.
foo.bar : the field bar from the variable foo, where foo is a structure. foo.bar is not a valid variable name otherwise because of this syntax, use foo_bar.
foo>>>bar , foo➤bar : structure pointer
LLIST foo (bar) {...} : create a linked list bar of nodes with .data fields containing the values in {}
NODE FOO bar : create a node bar with data field of valid type FOO
TREERT FOO bar : make a leaf that loops back to itself with a data field of valid type FOO.
LEAF FOO bar : create a leaf bar with data field of valid type FOO

#include "/path/to/foo" : add the entire file foo here.
#define foo bar : replace all regex foo with regex bar
and so on as in the C preprocessor

; , ⏎ , ↯ : equivilant to new line
EXIT : close the program immidiately

math types noted below
foo + bar : foo plus bar
foo - bar : foo minus bar
-foo : foo times -1
foo * bar , foo × bar : foo times bar
foo / bar , foo ÷ bar : foo over bar
foo ^ bar , foo ** bar , foo ⋆ bar : foo to the power of bar
foo ^^ bar : tertiation, foo raised to foo bar times
foo % bar : foo modulus bar
foo LOG bar , foo ⍟ bar : logarithem of bar to base foo
foo ROOT bar , foo √ bar : foo root bar
!foo : foo factorial
¡foo : foo derangement
foo nCr bar : combinations of foo elements from bar items
foo nPr bar : permutations of foo elements from bar items

elog(foo) : the natural logarithem of foo
abs(foo) , ⟦foo⟧ : absolute value of number foo. returns according to mathtypes
cabs(foo) : the complex absolute value of foo.
floor(foo) , ⌊foo⌋ : floor of number foo, returns shortest int format possible
ceiling(foo) , ⌈foo⌉ : ceiling of number foo, returns shortest int format possible
div(foo, bar) : divide int over bar. returns divtyp.
elog(foo) : natural logarithem of foo
sqrt(foo) : the square root of foo
cbrt(foo) : the cube root of foo

max(foo, bar...) : return the greatest value of numbers foo and bar. returns that number.
min(foo, bar...) : return the least value of numbers foo and bar. returns that number.
mean(foo, bar...) : find the adverage of numbers foo and bar. returns according to mathtypes
median(foo, bar...) : find the median of a list of values. returns according to mathtypes
mode(foo, bar...) : find the mode of a list of values. returns according to mathtypes

sin(foo) : the sine of foo, returns float
cos(foo) : the cosine of foo, returns float
tan(foo) : the tangent of foo, returns float
cot(foo) : the cotangent of foo, returns float
sec(foo) : the secant of foo, returns float
csc(foo) : the cosecant of foo, returns float
arcsin(foo) : the arcsine of foo, returns float
arccos(foo) : the arccosine of foo, returns float
arctan(foo) : the arctangent of foo, returns float
arccot(foo) : the arccotangent of foo, returns float
arcsec(foo) : the arcsecant of foo, returns float
arccsc(foo) : the arccosecant of foo, returns float

foo++ : foo + 1
foo-- : foo - 1
foo>> : barrel shift foo to the right by one (left on big endian systems)
foo<< : barrel shift foo to the left by one (right on big endian systems)
foo-> : shift foo to the right by one, drop excess (left on big endian systems)
foo<- : shift foo to the left by one, drop excess (right on big endian systems)

`foo : bitwise inverse of foo, returns result
foo ∧ bar , foo AND bar , foo & bar : bitwise foo AND bar, returns result
foo ∨ bar , foo OR bar , foo | bar : bitwise foo OR bar, returns result
foo ⍲ bar , foo NAND bar : bitwise foo NAND bar, returns result
foo ⍱ bar , foo NOR bar : bitwise foo NOR bar, returns result
foo ⊕ bar , foo XOR bar : bitwise foo XOR bar, returns result
foo ↔ bar , foo XNOR bar : bitwise foo XNOR bar, returns result
foo >> bar , foo » bar : barrel shift foo to the right by bar (left on big endian systems), returns result
foo << bar , foo « bar : barrel shift foo to the left by bar (right on big endian systems), returns result
foo -> bar , foo → bar : shift foo to the right by bar, drop excess (left on big endian systems), returns result
foo <- bar , foo ← bar : shift foo to the left by bar, drop excess (right on big endian systems), returns result

¬foo , ~foo : logical NOT foo
=foo : logical value of foo
foo && bar : logical foo AND bar
foo || bar : logical foo OR bar
foo ~&& bar , foo ¬&& bar , foo !&& bar : logical foo NAND bar
foo ~|| bar , foo ¬|| bar , foo !&& bar : logical foo NOR bar
foo ~= bar , foo ¬= bar , foo != bar : logical foo XOR bar
foo ⇔ bar , foo <> bar , foo IFF bar : logical foo XNOR bar

foo ∈ bar , foo ELEMENT bar : test if array or linked list bar contains element foo, returns bool result
foo ∪ bar , foo UNION bar : 1-dimensional union of arrays or linked list foo and bar, returns array
foo ∩ bar , foo INTRSECT bar : 1-dimensional intersection of arrays or linked lists foo and bar, returns array
foo ⊂ bar , foo SUBSET bar : test if array or linked list foo is a subset of bar, returns bool result
foo ⊖ bar , foo DIFF bar : 1 dimensional symetric difference of arrays or linked lists foo and bar, returns array

foo < bar , foo LT bar : test if foo is less than bar, returns bool result
foo > bar , foo GT bar : test if foo is greater than bar, returns bool result
foo ≤ bar , foo LE bar : test if foo is less than or equal to bar, returns bool result
foo ≥ bar , foo GE bar : test if foo is greater than or equal to bar, returns bool result
foo ≠ bar , foo NE bar : test if foo is not equal to bar, returns bool result
foo = bar , foo EQ bar : test if foo is equal to bar, returns bool result
foo ≈ bar , foo APROX bar : test if floor or ceiling of foo is equal to the floor or ceiling of bar
foo ≡ bar , foo == bar : test byte for byte if foo matches bar, returns bool

foo ¢ bar , foo CON bar : concatinate the anythings foo and bar, returns the resulting anything. may be an invalid type.

strtok(foo, bar) : replace the character bar in string foo with a null character, return pointer to current position.
regex(foo) : compile the regex foo and return the pattern
match(foo, bar) : match all foo in string or array of strings bar, return output as a string or an array of strings
substitute(foo, bar, quux) : substitute all foo for bar in quux, but return output

rand(foo) : number between 0 and foo, returns number
roll(foo, bar) : roll <foo>d<bar>, returns sum of sides
deal(foo, bar) : deal bar sequential elements from array or linked list foo, returns array
choose(foo) : choose 1 random element from array foo and return it
shuffle(foo) : randomize array foo, return array.
sort(foo) : sort array foo, return array.

RETURN foo : make the containing function return foo. If you need return to evaluate something, put it in () like FOR, such as RETURN (foo + bar)
RETURN void : does nothing, optimized out

lambda(foo, bar, baz) ❬quux, garply, waldo❭ {...} : do anonamous function in {...} to anythings foo, bar, and baz, reffered to by local variabls quux, garply, and waldo. will iterate arrays or linked lists. multiple such items will be combined in all possible ways, eg ((foo nCr bar) * (bar nCr quux)) times

sizeof(foo) : returns the number of bits in anything foo. sizeof(&[any variable]) should return the CPU address register size.
typeof(foo) : uses the type tree to determin the type of foo
classof(foo) : uses the type tree to determin the generalized type of foo
isnumber(foo) : uses the type tree to determin if foo is a number type. returns 1 for numbers, 0 for non numbers, -1 for number structs, and NaN for possible numbers.
signof(foo) : determins the sign of foo. returns -1 for negitives, 1 for positives, 0 for 0, and NaN on error.

float(foo) : convert int foo to a float
dfloat(foo) : convert int or float foo to a double
complx(foo) : convert int, float, or double to complex
NOTE if you want a floating point number to be converted to an int type, you want the function floor(). remember this by the silly image of the float literaly floating, and you need it to be pulled down to the floor.

tonumber(foo) : converts string foo to number by mathtypes
atof(foo) : convert string foo to a double
atoi(foo) : convert string foo to a word
atol(foo) : convert string foo to a long

tostring(printf_format, foo) : converts foo to a string
toupper(foo) : convert the string foo to UPPERCASE
tolower(foo) : convert the string foo to lowercase
confuseables(foo) : remove all confuseables from string foo, according to the official confuseables.txt

add(foo, bar, quux) : add foo to linked list bar at position quux
remove(foo, bar) : remove node bar from linked list foo

moveb(foo, bar) : move 1 byte from address bar to address foo and return the value moved. foo and bar can be an interger or an & adress
movew(foo, bar) : move 2 bytes from address bar to address foo and return the value moved. foo and bar can be an interger or an & adress
movel(foo, bar) : move 4 bytes from address bar to address foo and return the value moved. foo and bar can be an interger or an & adress
zerofill(foo) : double the width of int foo by buffering it with zeros. return result. fails if sizeof(foo) is not a power of 2 greater than 8 and less than 33
signfill(foo) : double the width of int foo by buffering it with signed fill. return result. fails if sizeof(foo) is not a power of 2 greater than 8 and less than 33
assembly functions included for writing memory management functions that can be implementation independent.
Intended to be used with variable pointers. SEE BELOW WARNING ABOUT ABSOLUTE MEMORY ADDRESSING IN PRE-EXISTING ENVIROMENTS.

Final implementation will group non-byte datatypes into byte sized blocks.
(i.e. 8 bools will grouped together to make a byte)
(C can't do this, but this language as written, with disregard to back end, should be able to implement a compiler to do it.)

functions for transfinites, base-60 numbers, and graphics deferred.

Parseing
--------
comments, and \ have the absolute highest priority.
quotes, single or double, come next.
functions inside parenthases, normal functions(), and special bracket functions, have the highest precedance of true operators
prefix operators are evaluated inside to out. this includes unary functions, inquiries, splat, pointers, and base signs. be mindful of applying large chains of these (splat interprets anything attatched the left of it as a variable, number signs cannot be applied to strings, pointers applied to numbers are VERY DANGEROUS)
structure dots and structure pointers are evaluated next
infix mathmatical operators are next, then tests (set theory, then [in]equality, then bitwise, lastly logical);
postfix operator assignments are evaluated next to last.
assignments, extraction, and insertion are evaluated last.

functions such as return, {}, ;, newline, and control functions are evaluated differently. they control how other functions are evaluated.

Mathmatical operators follow standard order of operations.
logic and bitwise operators follow the order not, and, or, nand, nor, xor, xnor. not is actually considered a prefix or function.
Operators other than assignments are evaluated left to right; assignment precedent is REVERSED OF THIS.

SPECIAL VARIABLES
-----------------
stdout : the C-style output file
stdin : the C-style input file
stderr : the C-style error file
cout : the C++-style output file
cin : the C++-style input file
cerr : the C++-style error file
clog : the C++-style logging file
endln : C++ newline
NULL : a null file or bitbucket, implemented as a null pointer.
ⅈ : √-1, for complex numbers
ℯ : eulars number, double
π : pi, double
∞ : infinity macro
� : quiet Not a Number macro (literal U+FFFD)
true : bool of 1
false : bool of 0
ternary : bool of -1

formating
---------

§comment : if § occurs unescaped on a line, the rest of the line is ignored, or until ;

numbers, where foo and bar are strings of digits 1234567890, as well as aAbBcCdDeEfF for hexadecimal
foo : decimal
$foo : hexadecimal
%foo : binary
-foo : negitive signed decimal
@foo : octal
foo.bar : float
-foo.bar : negitive float

there is no syntax defined for negitive binary, hexadecimal, or octal numbers

Variable names should only consist of letters to prevent unexpected behavior.
using high adress characters may cause an increse in application size

The assignment operator is :=, as in algol or pascal
An insertion operator, :<, and extraction operator, :>, are also avalible

"this is a string"

'the raw value of the string'

a newline, ; or ⏎ appearing before a string is closed will be interpreted as a newline,
but will cause the parser to generate a warning about the virtues of escape sequences.
a \ followed by whitespace or newline will generate a warning telling you how to properly escape an escape character.

FOR (foo) {this is a grouping}
FOR (foo)
{
this is a multiline grouping
}

ARRAY foo[4] {this, is, an, array}

ARRAY foo[2][3]
{
{this, is, a}
{2, dimensional, array}
}

ARRAY foo[2][2][2]
{
{
{this, is}
{an, array}
}
{
{that, contains}
{three, dimensions}
}
}

ARRAY foo[2][2] {{newlines, are}{not, required}}

ARRAY foo[2][2][2] {neither, are, subgroupings, they, are, just, for, readability}

escape character \
special character shortcuts are as in C except as noted above.

adressing and inquiring
-----------------------

&foo : the adress of foo
*foo : pointer to foo
?foo : indicates the type of foo, same as typeof(foo)
¿foo : indicates the recursive type of foo, same as classof(foo)
№foo : indicates whether foo is a number, same as isnumber(foo)
±foo : the sign of foo, same as signof(foo)
ℓfoo : the size of foo, same as sizeof(foo)
£foo : expand an array or linked list as a comma seperated list here (recursively).

WARNING! using & or * on a decimal, hexidecimal, binary, or octal interger will read the ABSOLUTE ADDRESS.
This is an INTENDED RESPONSE, not a bug. IF YOU USE THIS ON A PRE-EXISTING OPERATING SYSTEM, ON YOUR HEAD BE IT.

DATATYPES
---------

BOOL : 2 bits <currently implementation dependent>
BYTE : 8 bits unspecified sign
WORD : 16 bits unspecified sign
LONG : 32 bits unspecified sign
QUAD : 64 bits unspecified sign
S_[BYTE|WORD|LONG|QUAD] : signed versions of above
U_[BYTE|WORD|LONG|QUAD] : unsigned versions of above
STRING : utf8 ansi-style string. multibyte characters are stored internaly as multiple characters.
FLOAT : single precision float
DOUBLE : double precision float
ARRAY : array of anythings, can be multidimensional if rectangular/cuboid/hypercuboid.
FILE : a C-style file
ISTREM : a C++ style input stream
OSTREM : a C++ style output stream
LLIST : a doubly-linked list. implemented as a collection of nodes.
NODE : a structure consisting of a pointer .prev, an anything .data, and a pointer .next
LEAF : a structure consisting of a pointer .parent, and an anything .data
TIMTYP : a structure for holding C style real times.
CLKTYP : an number type for storing the C-style elapsed time.
DIVTYP : the result of div. a struct with fields numer and denom.
TYPTYP : an enumerated type of all the basic types. 
PATTRN : a compiled regex
VOID : a nothing 0 bits wide

"detonation" in this document refers to a fatal crash
int in this document refers to a byte, word, long, or quad (either signed or unsigned), or clktyp
number in this document refers to an int, a float, or double

assigning a negitive or overflowing number to an int will not affect it, since the format is unspecified, so long as the number is within range
assigning a negitive number to an unsigned int will detonate
assigning a number to any int that is outside the range supported by that format will detonate
assigning a value to a pointer should never fail, but may cause strange behavior

math typing: int FOO single = single, [int | single] FOO double = double
math typeing in current versions also does C-style interger promotions, and is spotty at best for parenthases functions. THIS IS A BUG (bug#0).
operations dealing with bytes SHOULD not return a word or long unless the value overflows a byte.
operations dealing in signed values SHOULD return a signed value unless the returned value is positive and too large to hold.
all math functions should return the smallest length type possible, and use this type for calculation unless architecture makes this impractical.
Strings and NOWHERE evaluate to Quiet_NaN in math fuctions.
Non-empty strings evaluate as true if taken with =foo in logic functions. =NOWHERE evaluates as false.

While the language may be initialy written for i686 and x86_64, it was concieved for the 68020+68881.
A backport for 680x0 will be made avalible for the first system whos calling conventions can be located and demystifyed.
a barebones embedded Z80 implementation for system design is also planned

Error strings should all be converted to a more consistant string of "NULL".

DEFINEING FUNCTIONS
-------------------

a function can be defined as follows:

FUNCTION foo(bar, quux)
	{
	if(bar < quux) {return bar}
	else {return quux}
	}

this will make a function that returns the lesser of two numbers, bar and quux.
Note there is no checking to see if bar or quux are numbers.
If bar or quux are not numbers, the function will detonate.
a function can return more than one type, hence it is not necessary to say what it's return type is like in C


EXAMPLES
--------
mandatory hello world program.
Unlike C, but like older languages and modern interpreted languages,
there is no main function required. one could define a main function
and call it at the end of the program, but this is unneccisary.
It is recommended to have things defined before you use them, however. The compiler doesn't read that far ahead.

Example 1:
printf("Hello, World!\n")

Example 2:
cout :< "Hello, World!" ¢ endln

Example 3:
writeln(cout, "Hello, World!")

Note that all examples are only 1 line of code.

Deferred fetures
----------------

full support of up-arrow notation

Transfinite number support

Base 60 math support

Complete set of complex number functions

Support for Spherical and Antispherical geometries

(Bitmap) graphics support with pixles, lines, rectangles, circles, and turtles
loading and saving a format similar to LOGO sourcecode, SVG, or macintosh quickdraw's PICT
bitmap loading, blitting & masking

Ability to output sound by frequency, note, or telephone button for a given duration.
would support sine, square, and sawtooth for note and frequency. telephone would always be duplexed sine.
Ability to load and save sound scripts

The ability to store 4 bools in a byte

Support for Nibbles and the ability to store 2 of them in a byte

Support for Octal pairs and the ability to store 4 of them in 3 byte groups

support for awk, sed, or perl style regexs

Support for Q8.8, Q16.16, and Q32.32 numbers
Support for EBCDIC-APL, MAC-ROMAN, ISO-8859-1

a true interpreter (would not replace APL transpiler, but be a third implementation)
full parody of file IO functions for APL transpiler
runtime bytecode compatibility amoungst both|all implimentations
the actual APL transpiler

cross compilation and assembly-only implementation for Z80 embedded system design

BUILDING
--------
The source for the first alpha version is projected to need:
- a POSIX shell
- a Make utility
- a C compiler
- a C++ compiler
- a C preprocessor that can be called independently
- an Assembler
- a Linker
- flex or lex
- yacc or bison
- curl (to ensure the most current unicode files)
- an Awk interpreter (for processing the unicode files)

To implement both the C and Pascal sides of the file, The current implementation is to "Volley" the file back and fourth between flex/lex and plex until no tokens remain.
This is done by having both lexers switch to outputting a second source file that contains the functions destined for the other, while at the same time only returning an extern function token for their own language.
This can be done recursively.

future rewrites may also require
- an M4 macro processor


Yes, this first alpha version is expected to be huge in size and have dozens of intermidiate object files. I expect it to get bigger, not smaller, as there is a 1:1 corraspondance between primary functions and object files.
This is because the alpha version will be only the first and second step in a bootstrapping process, and the first revision of them at that.
I do expect the final version of the bootstrapping process to gradually get smaller after the third iteration as external object files are rolled into a single file and optimized. I'm probably wrong.
The use of the C preprocessor is not expected to change. It does everything I need it to.
I don't forsee needing any other languages for the commands I've included, but I can forsee complications which may arise that could call for the ones in the second list. the two lists taken together covers most of my useful programming skills. amoungst the languages that I will definately NOT be including is Cobol.
This language is designed for POSIX-compliant enviroments. Barring a signifigant change in policy by Microsoft, Windows support is unlikely to be feasible, but may be possible by extra-ordinary mesures (like compleatly reimplimenting everything about how unicode is implemented internaly).

Primary functions
-----------------
A primary function is a function that is included in the first step of the bootstrapping process. CPP Macros don't count.
Any built-in function that is not a function that is not a primary function is called a "secondary function", and can be implemented with primary functions.
This language standard does not mandate that the functions are implemented in the languages specified; Ideally, they could all be reduced to a single language.
Starting at iteration 3, I plan to implement both a Static Compiler and an APL transpiler. Iteration 3 is also the first iteration to have all the built-ins.
Here is a list of how I implement built-ins in the first 2 iterations:

function: 1st iteration , 2nd iteration

wait() : ~ , native
time() : C  , native calling object
clock() : C , native calling object
IF (foo) {} : C , native calling object
ELSE {} : C , native calling object
ELSEIF (foo) {} : C , native calling object
WHILE (foo) {} : C , native calling object
UNTIL (foo) {} : C , native calling object
DOTIMES (foo) {} : C , native reimplimentation
BREAK : parser , native parser
GOTO (foo) : parser , native parser
MAP (foo) ❬x❭ {} : C , native calling object
KEY (foo) ❬x❭ {...} : C , native calling object
¶foo : parser , native parser
printf(...) : C , native calling object
sprintf(...) : C , native calling object
fprintf(...) : C , native calling object
scanf(...) : C , native calling object
sscanf(...) : C , native calling object
fscanf(...) : C , native calling object
fflush(...) : C , native calling object
fopen(...) : C , native calling object
fclose(...) : C , native calling object
fseek(...) : C , native calling object
ftell(...) : C , native calling object
rewind(...) : C , native calling object
assign(...) : C , native calling object
write(...) : C , native calling object
writeln(...) : C , native calling object
read(...) : C , native calling object
readln(...) : C , native calling object
FUNCTION foo() {...} : ~ , native parser calling native and C
VARIADIC foo(bar) {...} : C , native calling object
EXTERN foo() : C , native calling object
TYPE FOO bar : C , native calling object
FOO bar, quux, xyzzy : C , native calling object
GLOBAL FOO bar, quux, xyzzy : C , native calling object
UNDECLARE bar, quux, xyzzy : C , native calling object
foo[bar][quux] : C , native calling object
STRUCT FOO {...} : C , native calling object
foo.bar : C , native calling object
LLIST foo {...} : C , native calling object
EXIT : C , native calling object
foo + bar : C , native calling object OR Fortran
foo - bar : C , native calling object OR Fortran
-foo : C , native calling object OR Fortran
foo * bar , foo × bar : C , native calling object OR Fortran
foo / bar , foo ÷ bar : C , native calling object OR Fortran
foo ^ bar , foo ** bar , foo ⋆ bar : C , native calling object OR Fortran
foo ^^ bar : C , native calling object OR Fortran
foo % bar : C , native calling object OR Fortran
foo LOG bar , foo ⍟ bar : C , native calling object OR Fortran
foo ROOT bar , foo √ bar : C , native calling object OR Fortran
!foo : C , native calling object OR Fortran
¡foo : C , native calling object OR Fortran
foo nCr bar : C , native calling object OR Fortran
foo nPr bar : C , native calling object OR Fortran
elog(foo) : C , native calling object OR Fortran
abs(foo) , ⟦foo⟧ : C , native calling object OR Fortran
cabs(foo) : C , native calling object OR Fortran
floor(foo) , ⌊foo⌋ : C , native calling object OR Fortran
ceiling(foo) , ⌈foo⌉ : C , native calling object OR Fortran
div(foo, bar) : C , native calling object OR Fortran
sqrt(foo) : Pascal , native calling object OR Fortran
cbrt(foo) : Pascal , native calling object OR Fortran
max(foo, bar...) : C , native calling object OR Fortran
min(foo, bar...) : C , native calling object OR Fortran
mean(foo, bar...) : C , native calling object OR Fortran
median(foo, bar...) : ~ , native
mode(foo, bar) : ~ , native
sin(foo) : C , native calling object OR Fortran
cos(foo) : C , native calling object OR Fortran
tan(foo) : C , native calling object OR Fortran
cot(foo) : C , native calling object OR Fortran
sec(foo) : C , native calling object OR Fortran
csc(foo) : C , native calling object OR Fortran
arcsin(foo) : C , native calling object OR Fortran
arccos(foo) : C , native calling object OR Fortran
arctan(foo) : C , native calling object OR Fortran
arccot(foo) : C , native calling object OR Fortran
arcsec(foo) : C , native calling object OR Fortran
arccsc(foo) : C , native calling object OR Fortran
foo++ : C calling Asm , native calling object
foo-- : C calling Asm , native calling object
foo>> : C calling Asm , native calling object
foo<< : C calling Asm , native calling object
foo-> : C calling Asm , native calling object
foo<- : C calling Asm , native calling object
`foo : C calling Asm , native calling object
foo ∧ bar , foo AND bar , foo & bar : C , Native calling object or Asm
foo ∨ bar , foo OR bar , foo | bar : C , Native calling object or Asm
foo ⍲ bar , foo NAND bar : C , Native calling object or Asm
foo ⍱ bar , foo NOR bar : C , Native calling object or Asm
foo ⊕ bar , foo XOR bar : C , Native calling object or Asm
foo ↔ bar , foo XNOR bar : C , Native calling object or Asm
foo >> bar , foo » bar : C , Native calling Asm
foo << bar , foo « bar : C , Native calling Asm
foo -> bar , foo → bar : C , Native calling Asm
foo <- bar , foo ← bar : C , Native calling Asm
¬foo , ~foo : C , Native calling object
=foo : C , Native calling object
foo && bar : C , Native calling object
foo || bar : C , Native calling object
foo ~&& bar , foo ¬&& bar , foo !&& bar : C , Native calling object
foo ~|| bar , foo ¬|| bar , foo !&& bar : C , Native calling object
foo ~= bar , foo ¬= bar , foo != bar : C , Native calling object
foo ⇔ bar , foo <> bar , foo IFF bar : C , Native calling object
foo ∈ bar , foo ELEMENT bar : C , Native calling object
foo ∪ bar , foo UNION bar : C , Native calling object
foo ∩ bar , foo INTRSECT bar : C , Native calling object
foo ⊂ bar , foo SUBSET bar : C , Native calling object
foo ⊖ bar , foo DIFF bar : C , Native calling object
foo < bar , foo LT bar : C , Native calling object
foo > bar , foo GT bar : C , Native calling object
foo ≤ bar , foo LE bar : C , Native calling object
foo ≥ bar , foo GE bar : C , Native calling object
foo ≠ bar , foo NE bar : C , Native calling object
foo = bar , foo EQ bar : C , Native calling object
foo ≈ bar , foo APROX bar : C , Native calling object
foo ≡ bar , foo == bar : C , Native calling object
foo ¢ bar , foo CON bar : C , Native calling object
strtok(foo, bar) : C , native calling object
regex(foo) : C++ , Native calling object
match(foo, bar) : C++ , Native calling object
substitute(foo, bar, quux) : C++ , Native calling object
rand(foo) : C , Native calling object
roll(foo, bar) : ~ , Native
deal(foo, bar) : C , native calling object
shuffle(foo) : ~ , native
sort(foo) : ~ , native
RETURN foo : ~ , native parser calling native and C
lambda(foo, bar, baz) ❬quux, garply, waldo❭ {...} : C++ , native
sizeof(foo) : C , native calling object
typeof(foo) : C , native calling object
classof(foo) : C , native calling object
isnumber(foo) : C calling C++ , native calling object
signof(foo) : C calling C++ , native calling object
float(foo) : C , native calling object
dfloat(foo) : C , native calling object
complx(foo) : C , native calling object
minisize(foo) : ~ , native
atof(foo) : C , native calling object
atoi(foo) : C , native calling object
atol(foo) : C , native calling object
tostring(printf_format, foo) : C , native
toupper(foo) : ~ , native using UnicodeData.txt
tolower(foo) : ~ , native using UnicodeData.txt
confuseables(foo) : ~ , native using Confuseables.txt
add(foo, bar, quux) : C , native calling object
remove(foo, bar) : C , native calling object
moveb(foo, bar) : Asm , native calling object
movew(foo, bar) : Asm , native calling object
movel(foo, bar) : Asm , native calling object
zerofill(foo) : C calling Asm , native calling object
signfill(foo) : C calling Asm , native calling object
:= : C , native calling object
:< : C++ , native calling object
:> : C++ , native calling object

stdout : C , stdout
stdin : C , stdin
stderr : C , stderr
cout : C++ , std::cout
cin : C++ , std::cin
cerr : C++ , std::cerr
clog : C++ , std::clog
endln : C++ , endl
NULL : C , NULL
ⅈ : C , _IMAGINARY_I
ℯ : C , M_E
π : C , M_PI
∞ : C , HUGE_VAL
� : C++ , quiet_NaN
true : C , signed char TRUE
false : C , signed char FALSE
ternary : C , signed char -1

BOOL : C, signed char
BYTE : C, unsigned char * [1]
WORD : C, unsigned short * [1]
LONG : C, unsigned long * [1]
QUAD : C, unsigned long long * [1]
S_BYTE : C, signed char
S_WORD : C, short
S_LONG : C, long
S_QUAD : C, long long
U_BYTE : C, unsigned char
U_WORD : C, unsigned short
U_LONG : C, unsigned long
U_QUAD : C, unsigned long long
STRING : C, char * [up to MAX_BUFFER]
FLOAT : C, float
DOUBLE : C, double
ARRAY : C, void * [][]...
FILE : C, FILE
INPUT : C++, istream
OUTPUT : C++, ostream
LLIST : C, struct * []
NODE : C, struct {* struct, * void, * struct}
TIMTYP : C, time_t
CLKTYP : C, clock_t
DIVTYP : C, div_t
TYPTYP : C, struct {char[6], * struct}
PATTRN : C++, basic_regex
VOID : C, void

* : C, *foo
& : C, &foo
? : C, <see type tree>
¿ : C, <see type tree>
№ : C, <see type tree>
± : C, IF (foo ≠ 0) {IF (foo > 0) {return 1} ELSEIF (foo < 0) {return -1} ELSE {return �}} ELSE {return 0}
ℓ : C, sizeof(foo)
£ : Parser, <to complicated to explain briefly>

a garbage collector is a HIGH PRIORETY to-do, see bug#1.

PARSING (CONTINUED)
-------------------

a name may not contain any technical symbol. these include:
' " ; : [ ] { } | \ < > , . ? / ~ ` ! @ # $ % ^ & * ( ) - + =
❬ ❭ ⟦ ⟧ ⌊ ⌋ ⌈ ⌉ ¶ ➤ × ÷ ⋆ ⍟ √ ¡ ∧ ∨ ⍲ ⍱ ⊕ ↔ ≡ » « → ← ¬ ⇔ ∈ ∪
∩ ⊂ ⊖ ≤ ≥ ≠ ≈ ¢ £ ¿ № ± ℓ ⏎ ↯ ↹ ␣ ⍽

a name may not contain spaces:
␠ <all en spaces> <all em spaces> <thin spaces>

a name may not contain a number as the first character
0 1 2 3 4 5 6 7 8 9

a name may not overlap exactly with a special variable.
stdin stdout stderr cin cout cerr clog endln NULL ⅈ ℯ π ∞ � true false ternary

The compiler automatically generates a type tree and associated variables for each variable. They follow the form:
type_of_[variablename]
Be mindful of these when naming your variables, as collisions will screw up type checking
these are always structures of typtyp

a variable name may not contain an unprintable character
␀ ␁ ␂ ␃ ␄ ␅ ␆ ␇ ␈ ␉ ␊ ␋ ␌ ␍ ␎ ␏ ␐ ␑ ␒ ␓ ␔ ␕ ␖ ␗ ␘ ␙ ␚ ␛ ␜ ␝ ␞ ␟ ␠ ␡

forbidden symbols will NEVER include:
_ ¦ · • ♠ ♡ ♢ ♣ ♤ ♥ ♦ ♧ ♔ ♕ ♖ ♗ ♘ ♙ ♚ ♛ ♜ ♝ ♞ ♟ ː ˑ ⫶ [set of all unicode letters]

Tokens are seperated by "Whitespace". This does not follow the standard unicode definition of "Whitespace".
Whitespace can be specified manually at metacompilation time. By default, this includes:
␠ ␉ ↹ ␣ ⍽ <all en spaces> <all em spaces> <thin spaces>

Lines are seperated by specially defined characters. This can be chosen, too. by default, this includes:
␊ ␍ ; ⏎ ↯

MAX_BUFFER is a value used in string and file operations. it defaults to 512 bytes. This is the amount of memory allocated for buffer reads.

TYPE TREE
the type tree contains the names of all types. any user defined types are automatically added to the type tree.

VERSION NUMBERS
---------------
major version : a number that represents the full version number
minor version : the number of minor revisions since the last time the version number was changed
revision : tiny revisions since last minor version
documentation version : the version of the documentation for the minor version. appears as a letter (starting at a) following the full version number when the previous documentation for the same version was errornous, ommited otherwise.
testbuild number : the sequential testbuild number
testbuild date : the date of the testbuild

format: Ver.major.minor[doc] #NUMBER DD-MM-YYYY

BUG REPORTS
-----------
Number	Reporter	version			Status		Priority
Description
{
Actions taken/planned				Result?		"IF NOT THEN"
.						[waiting]	"IF NOT THEN"
.						[waiting]	"IF NOT THEN"
.						[waiting]	"IF NOT THEN"
LAST RESORT mediocore solution			[waiting]
 -or-
HOTFIX	mediocore solution			[waiting]	"UNTIL"
LONGFIX extraodinary measures			[waiting]
}&{
Actions for next part of issue.....

bug#0	Author		0.1.10 0000000 00-00-0000	FIXED	Annoying
Placeholder for further mathtypes errors

bug#1	Author		0.1.14 0000000 00-00-0000	Unconfirmed	CRITICAL
Placeholder for specific buffer-related memory leaks

bug#2	Author		0.1.17 0000000 00-00-0000	FIXED	CRITICAL
Placeholder for specific FUNCTION/RETURN type related errors

bug#3	Author		0.1.18 0000000 00-00-0000	FIXED	CRITICAL
Placeholder for parser errors related to curly brackets and loops
