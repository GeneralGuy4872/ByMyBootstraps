#Psuedocode for lexer. waiting on book.
NAME	[^'";:\[\]\{\}\|\\\<\>,\.\?/~`!@#\$%\^\&\*\(\)\-\+=❬❭⟦⟧⌊⌋⌈⌉¶➤×÷⋆⍟√¡∧∨⍲⍱⊕↔≡»«→←¬⇔∈∪∩⊂⊖≤≥≠≈¢£¿№±ℓ⏎↯↹␣⍽⌛⎋⚠💣☠0987654321][^'";:\[\]\{\}\|\\\<\>,\.\?/~`!@#\$%\^\&\*\(\)\-\+=❬❭⟦⟧⌊⌋⌈⌉¶➤×÷⋆⍟√¡∧∨⍲⍱⊕↔≡»«→←¬⇔∈∪∩⊂⊖≤≥≠≈¢£¿№±ℓ⏎↯↹␣⍽⌛⎋⚠💣☠]*
DECIMAL [0987654321]+
BINARY	%[01]+
OCTAL	@[01234567]+
HEXADECIMAL	\$[0987654321AaBbCcDdEeFf]
STRING	["'][.]*["']
NEWLINE	[⏎↯;]
SPACE	[␣⍽]
TAB	[↹]
TYPENAME	[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM]{1,6}

SIGNED	[\-]*DECIMAL+
FRACTIONAL	SIGNED\.DECIMAL
ELEMENT	NAME([\[]INTERGER*[\]])+

INTEGER	(SIGNED | BINARY | OCTAL | HEXADECIMAL | ADDRESS)
NUMBER	(INTERGER | FRACTIONAL)
ANYTHING	(NUMBER | NAME | POINTER | ELEMENT)

POINTER	\*(NAME | ELEMENT | INTERGER)
ADDRESS \&(NAME | ELEMENT)

%{
#include myheaders.h
#include typetree.h
%}

%%
SPACE	printf(" ");
TAB	printf("\t");
NEWLINE	printf("\n");

⌛ANYTHING	printf("wait(", $2, ")");
ELSEIF	printf("ELSE IF");
¶[.]+	printf($2, ":");
TYPE TYPENAME TYPENAME	printf("typedef ", $3, " ", $2, "\n", "struct typtyp* type_table_", $2, "(type_table_", $2, "){.parent = type_table_", $3, ", .isnumber = type_table_", $3, ", .type = \"", $2, "\"")
ASSIGN TYPENAME NAME	printf($2, " ", $3, "\n", "struct typtyp* type_of_", $3, "(type_of_", $3, "){.parent = type_table_", $2, ", .isnumber = type_table_", $2, ", .type = \"", $2, "\"")
STATIC TYPENAME NAME	printf("static ", $2, " ", $3, "\n", "struct typtyp* type_of_", $3, "(type_of_", $3, "){.parent = type_table_", $2, ", .isnumber = type_table_", $2, ", .type = \"", $2, "\"")
(>>> | ➤)	printf("->")