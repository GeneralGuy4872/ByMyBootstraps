NAME	[^'";:\[\]\{\}\|\\\<\>,\.\?/~`!@#\$%\^\&\*\(\)\-\+=❬❭⟦⟧⌊⌋⌈⌉¶➤×÷⋆⍟√¡∧∨⍲⍱⊕↔≡»«→←¬⇔∈∪∩⊂⊖≤≥≠≈¢£¿№±ℓ⏎↯↹␣⍽⌛⎋⚠💣☠0987654321][^'";:\[\]\{\}\|\\\<\>,\.\?/~`!@#\$%\^\&\*\(\)\-\+=❬❭⟦⟧⌊⌋⌈⌉¶➤×÷⋆⍟√¡∧∨⍲⍱⊕↔≡»«→←¬⇔∈∪∩⊂⊖≤≥≠≈¢£¿№±ℓ⏎↯↹␣⍽⌛⎋⚠💣☠]*
DECIMAL [0987654321]+
BINARY	%[01]+
OCTAL	@[01234567]+
HEXADECIMAL	\$[0987654321AaBbCcDdEeFf]
STRING	["'][.]*["']
NEWLINE	[⏎↯;\n]
SPACE	[␣⍽ ]
TAB	[↹\t]
TYPENAME	[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM]{1,6}

SIGNED	[\-]*{DECIMAL}+
FRACTIONAL	{SIGNED}\.{DECIMAL}
ELEMENT	{NAME}([\[]INTERGER*[\]])+

INTEGER	({SIGNED}|{BINARY}|{OCTAL}|{HEXADECIMAL}|{ADDRESS})
NUMBER	({INTERGER}|{FRACTIONAL})
ANYTHING	({NUMBER}|{NAME}|{POINTER}|{ELEMENT})

POINTER	\*({NAME}|{ELEMENT}|{INTERGER})
ADDRESS \&({NAME}|{ELEMENT})

%{
#include myheaders.h
#include typetree.h
%}

%%
{BLANK}	printf(" ");
{TAB}	printf("\t");
{NEWLINE}	printf("\n");

⌛/{ANYTHING}	printf("wait(", $2, ")");
¶[.]+	printf($2, ":");
{TYPE}/{SPACE}/{TYPENAME}/{SPACE}/{TYPENAME}	printf("typedef ", $5, " ", $3, "\n", "struct typtyp* type_table_", $5, "(type_table_", $5, "){.parent = type_table_", $3, ", .isnumber = type_table_", $3, ", .type = \"", $2, "\"")
{TYPENAME}/{SPACE}/{NAME}	printf($1, " ", $3, "\n", "struct typtyp* type_of_", $3, "(type_of_", $3, "){.parent = type_table_", $1, ", .isnumber = type_table_", $1, ", .type = \"", $2, "\"")
STATIC/{SPACE}/{TYPENAME}/{SPACE}/{NAME}	printf("static ", $3, " ", $5, "\n", "struct typtyp* type_of_", $3, "(type_of_", $3, "){.parent = type_table_", $2, ", .isnumber = type_table_", $2, ", .type = \"", $2, "\"")
(>>>|➤)	printf("->")
