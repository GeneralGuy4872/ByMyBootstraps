NAME	[^'";:\[\]\{\}\|\\\<\>,\.\?/~`!@#\$%\^\&\*\(\)\-\+=❬❭⟦⟧⌊⌋⌈⌉¶➤…×÷⋆⍟√¡∧∨⍲⍱⊕↔≡»«→←¬⇔∈∪∩⊂⊖≤≥≠≈¢≝⤆⤇£¿№±ℓ⏎↯↹➳␣⍽⌛⎋⚠💣☠0987654321\n\r\t ][^'";:\[\]\{\}\|\\\<\>,\.\?/~`!@#\$%\^\&\*\(\)\-\+=❬❭⟦⟧⌊⌋⌈⌉¶➤…×÷⋆⍟√¡∧∨⍲⍱⊕↔≡»«→←¬⇔∈∪∩⊂⊖≤≥≠≈¢≝⤆⤇£¿№±ℓ⏎↯↹➳␣⍽⌛⎋⚠💣☠\n\r\t ]*
DECIMAL [0987654321]+
BINARY	%[01]+
OCTAL	@[01234567]+
HEXADECIMAL	\$[0987654321AaBbCcDdEeFf]
STRING	["'][.]*["']
NEWLINE	[⏎↯;\n\r]
SPACE	[␣⍽ ]
TAB	[↹➳\t]
TYPENAME	[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM]{1,6}

SIGNED	[\-]*{DECIMAL}+
FRACTIONAL	{SIGNED}\.{DECIMAL}
ELEMENT	{NAME}([\[]{INTERGER}[\]])+

INTEGER	({SIGNED}|{BINARY}|{OCTAL}|{HEXADECIMAL}|{ADDRESS})
NUMBER	({INTERGER}|{FRACTIONAL})
ANYTHING	({NUMBER}|{NAME}|{POINTER}|{ELEMENT})

POINTER	\*({NAME}|{ELEMENT}|{INTERGER})
ADDRESS \&({NAME}|{ELEMENT})

%top
#include myheaders.h
#include typetree.h
%}

%{
static unsigned long errors = 0
static unsigned char blocklevel = 0
static unsigned char parenlevel = 0
static unsigned char looplevel = 0
static unsigned char indentlevel = 0
%}

%%
<<EOF>>		{
		printf("end of file reached with %i errors.", errors)
{WHITESPACE}+	{
		return(" ");
		}
{TAB}		{
		indentlevel++;
		return" ";
		}
{NEWLINE}+	{
		indentlevel = 0;
		return("\n");
		}

<LIST>[\{]	{
		return(BEGINLIST);
		}
<LIST>[\}]	{
		popstate();
		return(ENDLIST);
		}
<INITIAL>[\{]	{
		push_state(BLOCK);
		blocklevel++;
		return(BEGINBLOCK);
		}
<INITIAL>[\}]	{
		fprintf(stderr, "WARNING: Hey, was there a \{ to match to this \} at line %i\n", lineno());
		errors++;
		blocklevel--;
		return(ENDBLOCK);
		}
<BLOCK>[\{]	{
		blocklevel++;
		return(BEGINBLOCK);
		}
<BLOCK>[\}]	{
		popstate();
		blocklevel--;
		return(ENDBLOCK);
		}
<LOOP>[\{]	{
		looplevel++;
		return(BEGINLOOP);
		}
<LOOP>[\}]	{
		looplevel--;
		popstate();
		return(ENDLOOP);
		}
[\(]		{
		paralevel++;
		return(LPARA);
		}
[\)]		{
		paralevel--;
		return(RPARA);
		}
[❬]		{
		push_state(GETLOCAL);
		return(LANGLE);
		}
[❭]		{
		popstate();
		return(RANGLE);
		}

wait		{
		return(wait);
		}
⌛/{?}		{
		return(HOURGLASS);
		}
time()		{
		return(time);
		}
clock()		{
		return(clock);
		}
IF		{
		push_state(BLOCK);
		return(IF);
		}
ELSE		{
		push_state(BLOCK);
		return(ELSE);
		}
ELSEIF		{
		push_state(BLOCK);
		return(ELSEIF);
		}
WHILE		{
		push_state(LOOP);
		return(WHILE);
		}
UNTIL		{
		push_state(LOOP);
		return(UNTIL);
		}
DOTIMES		{
		push_state(LOOP);
		return(DOTIMES);
		}
BREAK		{
		popstate();
		return(break);
		}
GOTO		{
		#uummmmmmm frak
		return(GOTO);
		}
¶/{name}	{
		return(LABLE);
		#something to do with yytext?
		return(Name);
		}
printf(...) : C , native calling object
sprintf(...) : C , native calling object
fprintf(...) : C , native calling object
scanf(...) : C , native calling object
sscanf(...) : C , native calling object
fscanf(...) : C , native calling object
fgets(...) : C , native calling object
fflush(...) : C , native calling object
fopen(...) : C , native calling object
fclose(...) : C , native calling object
fseek(...) : C , native calling object
ftell(...) : C , native calling object
rewind(...) : C , native calling object
write(...) : ~ , native
writeln(...) : ~ , native
read(...) : ~ , native
readln(...) : ~ , native
FUNCTION foo() {...} : C , native parser calling native and C
VARIADIC foo(bar, baz) ❬x❭ {...} : C , native parser calling native and C
EXTERN FOO bar() : C , native calling object
TYPE FOO bar : C , native calling object
FOO bar, baz, quux : C , native calling object
FOO bar[quux] {} : C , native calling object
STATIC FOO bar, baz, quux : C , native calling object
foo[bar][quux] : C , native calling object
STRUCT FOO {...} : C , native calling object
foo.bar : C , native calling object
foo>>>bar , foo➤bar : C , native calling object
foo:bar : C , native calling object
LLIST foo {...} : C , native calling object
⎋foo , EXIT (foo) {} : C , native calling object
⚠foo , ERROR (foo) : C , native calling object
💣 , ABORT : C , native calling object
ASSERT (foo) : C , native calling object
☠ , POKE5945862 : Implementation dependent
foo + bar : C , native calling object
foo - bar : C , native calling object
-foo : C , native calling object
foo * bar , foo × bar : C , native calling object
foo / bar , foo ÷ bar : C , native calling object
foo ^ bar , foo ** bar , foo ⋆ bar : *C , native calling object
foo ^^ bar : *C , native calling object
foo % bar : C , native calling object
foo LOG bar , foo ⍟ bar : *C , native calling object
foo ROOT bar , foo √ bar : *C , native calling object
!foo : C , native calling object
¡foo : C , native calling object
foo nCr bar : C , native calling object
foo nPr bar : C , native calling object
elog(foo) : C , native calling object
abs(foo) , ⟦foo⟧ : *C , native calling object
cabs(foo) : C , native calling object
floor(foo) , ⌊foo⌋ : *C , native calling object
ceiling(foo) , ⌈foo⌉ : *C , native calling object
div(foo, bar) : *C , native calling object
sqrt(foo) , √bar : *C , native calling object
cbrt(foo) : *C , native calling object
max(foo, bar...) : *C , native calling object
min(foo, bar...) : *C , native calling object
mean(foo, bar...) : *C , native calling object
median(foo, bar...) : ~ , native
mode(foo, bar) : ~ , native
sin(foo) : C , native calling object
cos(foo) : C , native calling object
tan(foo) : C , native calling object
cot(foo) : *C , native calling object
sec(foo) : *C , native calling object
csc(foo) : *C , native calling object
arcsin(foo) : C , native calling object
arccos(foo) : C , native calling object
arctan(foo) : C , native calling object
arccot(foo) : *C , native calling object
arcsec(foo) : *C , native calling object
arccsc(foo) : *C , native calling object
foo++ : *C , native calling object
foo-- : *C , native calling object
foo>> : *C , native calling object
foo<< : *C , native calling object
foo-> : *C , native calling object
foo<- : *C , native calling object
`foo : C , native calling object
foo ∧ bar , foo AND bar , foo & bar : C , Native calling object
foo ∨ bar , foo OR bar , foo | bar : C , Native calling object
foo ⍲ bar , foo NAND bar : C , Native calling object
foo ⍱ bar , foo NOR bar : C , Native calling object
foo ⊕ bar , foo XOR bar : C , Native calling object
foo ↔ bar , foo XNOR bar : C , Native calling object
foo >> bar , foo » bar : C , Native calling object
foo << bar , foo « bar : C , Native calling object
foo -> bar , foo → bar : C , Native calling object
foo <- bar , foo ← bar : C , Native calling object
¬foo , ~foo : C , Native calling object
=foo : C , Native calling object
foo && bar : C , Native calling object
foo || bar : C , Native calling object
foo ~&& bar , foo ¬&& bar , foo !&& bar : *C , Native calling object
foo ~|| bar , foo ¬|| bar , foo !&& bar : *C , Native calling object
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
foo ≈ bar , foo APROX bar : Parser , Native
foo ≡ bar , foo == bar : C , Native calling object
foo ¢ bar , foo CON bar : *C , Native calling object
strtok(foo, bar) : C , native calling object
regex(foo) : C++ , Native calling object
sedex(foo) : C++ , Native calling object
awkex(foo) : C++ , Native calling object
match(foo, bar) : C++ , Native calling object
substitute(foo, bar, quux) : C++ , Native calling object
rand(foo) : C , Native calling object
roll(foo, bar) : Parser , Native
deal(foo, bar) : *C , native calling object
shuffle(foo) : ~ , native
RETURN foo : parser and C , native parser calling native and C
lambda(foo, bar, baz) ❬x, y, z❭ {...} : *C , native
λ(foo, bar, baz) ❬x, y, z❭ {...} : *C , native
sizeof(foo) : C , native calling object
typeof(foo) : C , native calling object
classof(foo) : C , native calling object
isnumber(foo) : C , native calling object
signof(foo) : C , native calling object
float(foo) : C , native calling object
dfloat(foo) : C , native calling object
complx(foo) : C , native calling object
minisize(foo) : ~ , native
atof(foo) : C , native calling object
atoi(foo) : C , native calling object
atol(foo) : C , native calling object
tostring(printf_format, foo) : ~ , native
toupper(foo) : ~ , native using UnicodeData.txt
tolower(foo) : ~ , native using UnicodeData.txt
confuseables(foo) : ~ , native using Confuseables.txt
add(foo, bar, quux) : *C , native calling object
remove(foo, bar) : *C , native calling object
system(...) : C , native calling object
FORK {} : C , native calling object
malloc(foo) : C , native calling object
calloc(foo, bar) : C , native calling object
free(foo) : C , native calling object
realloc(foo, bar) : C , native calling object
moveb(foo, bar) : Asm , native calling object
movew(foo, bar) : Asm , native calling object
movel(foo, bar) : Asm , native calling object
zerofill(foo) : C calling Asm , native calling object
signfill(foo) : C calling Asm , native calling object
xswap(foo, bar) : *C , Native calling object
swap(foo, bar) : *C++ , native calling object
:= , ≝ : C , native calling object
:< , ⤆ : C++ , native calling object
:> , ⤇ : C++ , native calling object

stdout : C , stdout
stdin : C , stdin
stderr : C , stderr
cout : C++ , std::cout
cin : C++ , std::cin
cerr : C++ , std::cerr
clog : C++ , std::clog
NULL : C , NULL
ⅈ : C , _IMAGINARY_I
ℯ : C , M_E
π : C , M_PI
φ : *C , (double) ((1 + sqrt(5)) / 2)
∞ , infinity : *C , INFINITY
� , notanumber : *C , NAN
true : *C , signed char TRUE
false : *C , signed char FALSE
ternary : *C , signed char -1

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
ARRAY : C, <type> [][]...
FILE : C, FILE
INPUT : C++, istream
OUTPUT : C++, ostream
LLIST : C, struct node*
NODE : C, struct {*node, *node}; aditional anything field added
TREERT : C, struct leaf*
LEAF : C, struct {*leaf}; aditional anything field added
TIMTYP : C, time_t
CLKTYP : C, clock_t
DIVTYP : C, div_t
TYPTYP : C, struct {*typtyp, *typtyp, char[6]}
PATTRN : C++, basic_regex
VOID : C, void
NULL : C, void* [0]

* : C, *foo
& : C, &foo
? : *C, <see type tree>
¿ : *C, <see type tree>
№ : *C, <see type tree>
± : *C, IF (foo ≠ 0) {IF (foo > 0) {return 1} ELSEIF (foo < 0) {return -1} ELSE {RETURN �;fprintf(stderr, "innnnnteresting...\n")}} ELSE {return 0}
ℓ : *C, sizeof(foo)