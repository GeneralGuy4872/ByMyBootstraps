NAME	[^'";:\[\]\{\}\|\\\<\>,\.\?/~`!@#\$%\^\&\*\(\)\-\+=❬❭⟦⟧⌊⌋⌈⌉↯¶➤…×÷⋆⍟√¡∧∨⍲⍱⊕↔≡»«→←¬⇔∈∪∩⊂⊖≤≥≠≈¢≝⤆⤇£⸮¿№±ℓ⏎↵↹⇥␣⍽⌛⎋⚠💣☠0987654321\n\r\t␀␁␂␃␄␅␆␇␈␉␊␋␌␍␎␏␐␑␒␓␔␕␖␗␘␙␚␛␜␝␞␟␠␡             ⠀　][^'";:\[\]\{\}\|\\\<\>,\.\?/~`!@#\$%\^\&\*\(\)\-\+=❬❭⟦⟧⌊⌋⌈⌉↯¶➤…×÷⋆⍟√¡∧∨⍲⍱⊕↔≡»«→←¬⇔∈∪∩⊂⊖≤≥≠≈¢≝⤆⤇£⸮¿№±ℓ⏎↵↹⇥␣⍽⌛⎋⚠💣☠\n\r\t␀␁␂␃␄␅␆␇␈␉␊␋␌␍␎␏␐␑␒␓␔␕␖␗␘␙␚␛␜␝␞␟␠␡             ⠀　]*
NUMBER	[0987654321]+
STRING	\"(\\.|[^\"])*\"
EXACT	\'[^\']*\'
NEWLINE	[␊␍;⏎↵\n\r]
SPACE	[␣⍽ ␠            ⠀　]
TAB	[↹⇥\t␉]

DONOTHING	("NOP"|"NOOP"|"NOPR"|"CONTINUE"|"SWYM")
FUNCTIONS	("wait"|"time"|"clock"|"beep"|[sf]?"printf"|[sf]?"scanf"|"f"("gets"|"puts"|"flush"|"open"|"seek"|"tell")|"rewind"|"f"("read"|"write")|"elog"|"abs"|"cabs"|"floor"|"ceiling"|"div"|"elog"|"sqrt"|"cbrt"|"min"|"max"|"mean"|("arc")?("sin"|"cos"|"tan"|"cot"|"sec"|"csc")|"regex"|"match"|"search"|"rand"|"roll"|"deal"|"choose"|("size"|"type"|"class"|"sign")"of"|"isnumber"|[sd]"float"|"complex"|"strto"([kfdl]|"ll"|"ul"|"ull")|"ato"([fil]|"ll")|"add"|"remove"|"system"|([mc]|"re")"alloc"|"free"|"move"[bwl]|("zero"|"sign")"fill"|"xswap")
CONDITIONAL	("IF"|"ELSE"|"ELSEIF"|"ASSERT"|"FORK")
DECLARATOR	("FUNCTION"|"VARIADIC"|"EXTERN"|"TYPE")
DATATYPES	("BOOL"|([US]"_")?("BYTE"|"WORD"|"LONG"|"QUAD")|"STRING"|"C_INT"|"FLOAT"|"DOUBLE"|"ARRAY"|"FILE"|"LLIST"|"NODE"|"TREERT"|"LEAF"|("TIM"|"CLK"|"DIV"|"SIZ"|"TYP")"TYP"|"PATTRN"|"VOID")
LOOPFUN	("WHILE"|"UNTIL"|"DOTIMES")
CONTROL	("↯"|"BREAK"|"💣"|"ABORT"|"☠"|"POKE5945862")
ENDSTATE ("EXIT"|"ERROR"|"RETURN")

%top
#define YY_EXTERN_C extern "C"
#include myheaders.h
#include myheaders++.h++
#include typetree.h
%}

%{
#include "y.tab.h"

static unsigned int errors = 0
%}

%%
<<EOF>>			{
			printf("end of file reached. %i lines read with %i errors.", lineno(), errors);
			exit(0);
			}
{WHITESPACE}+		{}
{TAB}+			{}
{NEWLINE}+		return(NEWLINE);
{DONOTHING}		{}

<LIST>"{"		{
			yylval.str = text();
			return("{");
			}
<LIST>"}"		{
			yylval.str = text();
			popstate();
			return("}");
			}
<INITIAL>"{"		{
			yylval.str = text();
			push_state(BLOCK);
			return(BEGINBLOCK);
			}
<INITIAL>"}"		{
			yylval.str = text();
			fprintf(stderr, "WARNING: Hey, was there a \{ to match to this \} at line %i\n", lineno());
			errors++;
			return(ENDBLOCK);
			}
<BLOCK>"{"		{
			yylval.str = text();
			push_state(BLOCK);
			return(BEGINBLOCK);
			}
<BLOCK>"}"		{
			yylval.str = text();
			popstate();
			return(ENDBLOCK);
			}
<BLOCKINIT>"{"		{
			yylval.str = text();
			popstate();
			push_state(BLOCK);
			return(BEGINBLOCK);
			}
<BLOCKINIT>"}"		{
			yylval.str = text();
			popstate();
			fprintf(stderr, "WARNING: Hey, was there a \{ to match to this \} at line %i\n", lineno());
			errors++;
			return(ENDBLOCK);
			}
<LOOP>"{"		{
			yylval.str = text();
			push_state(BLOCK);
			return(BEGINBLOCK);
			}
<LOOP>"}"		{
			yylval.str = text();
			popstate();
			return(ENDLOOP);
			}
<LOOPINIT>"{"		{
			yylval.str = text();
			popstate();
			push_state(LOOP);
			return(BEGINLOOP);
			}
<LOOPINIT>"}"		{
			yylval.str = text();
			popstate();
			fprintf(stderr, "WARNING: Hey, was there a \{ to match to this \} at line %i\n", lineno());
			errors++;
			return(ENDLOOP);
			}
"("			{
			yylval.str = text();
			return("(");
			}
")"			{
			yylval.str = text();
			return(")");
			}
"❬"			{
			yylval.str = text();
			return(❬);
			}
"❭"			{
			yylval.str = text();
			return(❭);
			}
"["			{
			yylval.str = text();
			return("[");
			}
"]"			{
			yylval.str = text();
			return("]");
			}

{FUNCTIONS}		{
			yylval.str = text();
			return(FUNCTION);
			}
{CONDITIONAL}		{
			yylval.str = text();
			push_state(BLOCKINIT);
			return(CONDITIONAL);
			}
{DECLARATOR}		{
			yylval.str = text();
			push_state(BLOCKINIT);
			return(DECLARATOR);
			}
{DATATYPES}		{
			yylval.str = text();
			return(DATATYPE);
			}
"STATIC"		{
			yylval.str = text();
			return(STATIC);
			}
{LOOPFUN}		{
			yylval.str = text();
			push_state(LOOPINIT);
			return(LOOPFUN);
			}
{ENDSTATE}		{
			yylval.str = text();
			return(ENDSTATE);
			}
{CONTROL}		{
			yylval.str = text();
			return(CONTROL);
			}
"NULL"			{
			yylval.str = text();
			return(NULL);
			}

"⌛"			{
			yylval.str = text();
			return(⌛);
			}
("..."|"…")		{
			yylval.str = text();
			return(…);
			}
"."			{
			yylval.str = text();
			return(".");
			}
"⎋"			{
			yylval.str = text();
			return(⎋);
			}
"⚠"			{
			yylval.str = text();
			return(⚠);
			}
"++"			{
			yylval.str = text();
			return(PLUSPLUS);
			}
"+"			{
			yylval.str = text();
			return("+");
			}
"--"			{
			yylval.str = text();
			return(MINUSMINUS);
			}
("->"|"→")		{
			yylval.str = text();
			return(→);
			}
"-"			{
			yylval.str = text();
			return("-");
			}
"**"			{
			yylval.str = text();
			return(DOUBLEASTRIKS);
			}
"*"			{
			yylval.str = text();
			return("*");
			}
"×"			{
			yylval.str = text();
			return(×);
			}
"/"			{
			yylval.str = text();
			return("/");
			}
"÷"			{
			yylval.str = text();
			return(÷);
			}
"^^"			{
			yylval.str = text();
			return(TERTIATE);
"^"			{
			yylval.str = text();
			return("^");
			}
"⋆"			{
			yylval.str = text();
			return(⋆);
			}
"%"			{
			yylval.str = text();
			return("%");
			}
("⍟"|"LOG")			{
			yylval.str = text();
			return(⍟);
			}
("√"|"ROOT")		{
			yylval.str = text();
			return(√);
			}
"nPr"			{
			yylval.str = text();
			return(nPr);
			}
"nCr"			{
			yylval.str = text();
			return(nCr);
			}
("¬&&"|"~&&"|"!&&")	{
			yylval.str = text();
			return(LOGICNAND);
			}
("¬||"|"~||"|"!||")	{
			yylval.str = text();
			return(LOGICNOR);
			}
("¬="|"~="|"!=")	{
			yylval.str = text();
			return(LOGICXOR);
			}
("¬"|"~")		{
			yylval.str = text();
			return("~");
			}
"!"			{
			yylval.str = text();
			return("!");
			}
"¡"			{
			yylval.str = text();
			return(¡);
			}
"⟦"			{
			yylval.str = text();
			return(⟦);
			}
"⟧"			{
			yylval.str = text();
			return(⟧);
			}
"⌊"			{
			yylval.str = text();
			return(⌊);
			}
"⌋"			{
			yylval.str = text();
			return(⌋);
			}
"⌈"			{
			yylval.str = text();
			return(⌈);
			}
"⌉"			{
			yylval.str = text();
			return(⌉);
			}
("`&"|"⍲"|"NAND")		{
			yylval.str = text();
			return(⍲);
			}
("`|"|"⍱"|"NOR")		{
			yylval.str = text();
			return(⍱);
			}
"`"			{
			yylval.str = text();
			return("`");
			}
("∧"|"AND")		{
			yylval.str = text();
			return(∧);
			}
"&&"			{
			yylval.str = text();
			return(LOGICAND);
			}
"&"			{
			yylval.str = text();
			return("&");
			}
("∨"|"OR")		{
			yylval.str = text();
			return(∨);
			}
"||"			{
			yylval.str = text();
			return(LOGICOR);
			}
"|"			{
			yylval.str = text();
			return("|");
			}
("⊕"|"XOR")		{
			yylval.str = text();
			return(⊕);
			}
("↔"|"XNOR")		{
			yylval.str = text();
			return(↔);
			}
(">>>"|"➤")		{
			yylval.str = text();
			return(➤);
			}
(">>"|"»")		{
			yylval.str = text();
			return(»);
			}
(">"|"GT")		{
			yylval.str = text();
			return(">");
			}
("<<"|"«")		{
			yylval.str = text();
			return(«);
			}
("<-"|"←")		{
			yylval.str = text();
			return(←);
			}
("⇔"|"<>"|"IFF")	{
			yylval.str = text();
			return(⇔);
			}
("<"|"LT")		{
			yylval.str = text();
			return("<");
			}
("≡"|"==")		{
			yylval.str = text();
			return(≡);
			}
("="|"EQ")			{
			yylval.str = text();
			return("=");
			}
("∈"|"ELEMENT")		{
			yylval.str = text();
			return(∈);
			}
("∪"|"UNION")		{
			yylval.str = text();
			return(∪);
			}
("∩"|"INTRSECT")	{
			yylval.str = text();
			return(∩);
			}
("⊂"|"SUBSET")		{
			yylval.str = text();
			return(⊂);
			}
("⊖"|"DIFF")		{
			yylval.str = text();
			return(⊖);
			}
("≤"|"LE")		{
			yylval.str = text();
			return(≤);
			}
("≥"|"GE")		{
			yylval.str = text();
			return(≥);
			}
("≠"|"NE")		{
			yylval.str = text();
			return(≠);
			}
("≈"|"APROX")		{
			yylval.str = text();
			return(≈);
			}
"¢"			{
			yylval.str = text();
			return(¢);
			}
"$"			{
			yylval.str = text();
			return("$");
			}
"@"			{
			yylval.str = text();
			return("@");
			}
"?"			{
			yylval.str = text();
			return("?");
			}
"¿"			{
			yylval.str = text();
			return(¿);
			}
"№"			{
			yylval.str = text();
			return(№);
			}
"±"			{
			yylval.str = text();
			return(±);
			}
"ℓ"			{
			yylval.str = text();
			return(ℓ);
			}
"¶"			{
			yylval.str = text();
			return(¶);
			}
"\\"			{
			yylval.str = text();
			return("\\");
			}
("≝"|":=")		{
			yylval.str = text();
			return(≝);
			}

{NUMBER}	{
		yylval.num = atoll(text());
		return(NUMBER);
		}
{STRING}	{
		yylval.str = text();
		return(STRING);
		}
{NAME}		{
		yylval.str = text();
		return(NAME);
		}