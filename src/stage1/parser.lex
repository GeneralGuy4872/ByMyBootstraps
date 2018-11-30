NAME	[^'";:\[\]\{\}\|\\\<\>,\.\?/~`!@#\$%\^\&\*\(\)\-\+=❬❭⟦⟧⌊⌋⌈⌉↯¶➤…×÷⋆⍟√¡∧∨⍲⍱⊕↔≡»«→←¬⇔∈∪∩⊂⊖≤≥≠≈¢≝⤆⤇£¿№±ℓ⏎↵↹⇥␣⍽⌛⎋⚠💣☠0987654321\n\r\t␀␁␂␃␄␅␆␇␈␉␊␋␌␍␎␏␐␑␒␓␔␕␖␗␘␙␚␛␜␝␞␟␠␡             ⠀　][^'";:\[\]\{\}\|\\\<\>,\.\?/~`!@#\$%\^\&\*\(\)\-\+=❬❭⟦⟧⌊⌋⌈⌉↯¶➤…×÷⋆⍟√¡∧∨⍲⍱⊕↔≡»«→←¬⇔∈∪∩⊂⊖≤≥≠≈¢≝⤆⤇£¿№±ℓ⏎↵↹⇥␣⍽⌛⎋⚠💣☠\n\r\t␀␁␂␃␄␅␆␇␈␉␊␋␌␍␎␏␐␑␒␓␔␕␖␗␘␙␚␛␜␝␞␟␠␡             ⠀　]*
NUMBER	[0987654321]+
STRING	([\"][^\"]*[\"]|[\'][^\']*['])
NEWLINE	[␊␍;⏎↵\n\r]
SPACE	[␣⍽ ␠            ⠀　]
TAB	[↹⇥\t␉]

DONOTHING	(NOP|NOOP|NOPR|CONTINUE|SWYM)
FUNCTIONS	(wait|time|clock|beep|[sf]?printf|[sf]?scanf|f(gets|flush|open|seek|tell)|rewind|write[ln]?|read[ln]?|getline|elog|abs|cabs|floor|ceiling|div|elog|sqrt|cbrt|min|max|mean|median|mode|[arc]?(sin|cos|tan|cot|sec|csc)|strtok|(reg|awk|ecma)ex|match|search|replace|rand|roll|deal|choose|shuffle|sizeof|typeof|classof|isnumber|signof|sfloat|dfloat|complex|strto(l|ll|ul|ull|f|d)|ato(f|i|l|ll)|to(upper|lower)|confuseables|add|remove|(m|c|re)alloc|move(b|w|l)|(zero|sign)fill|[x]?swap)
CONDITIONAL	(IF|ELSE|ELSEIF|ASSERT|FORK)
DECLARATOR	(FUNCTION|VARIADIC|EXTERN|TYPE)
DATATYPES	(
LOOPFUN	(WHILE|UNTIL|DOTIMES)
CONTROL	(BREAK|ABORT|💣|ABORT|☠|POKE5945862)
ENDSTATE (EXIT|ERROR|RETURN)
OPERATOR (LOG|ROOT|nCr|nPr|AND|OR|NAND|NOR|XOR|XNOR|IFF|ELEMENT|UNION|INTRSECT|SUBSET|DIFF|LT|GT|LE|GE|NE|EQ|APROX)
ANONYMOUS	(lambda|λ)

%top
#define YY_EXTERN_C extern "C"
#include myheaders.h
#include typetree.h
%}

%{
#include "y.tab.h"

static long long lines = 0
static unsigned int errors = 0
%}

%%
<<EOF>>		{
		printf("end of file reached. %i lines read with %i errors.", lineno(), errors);
		exit(0);
		}
{WHITESPACE}+	{}
{TAB}		{}
{NEWLINE}+	lines++;
{DONOTHING}	{}

<LIST>[\{]	{
		yylval.str = text();
		return(BEGINLIST);
		}
<LIST>[\}]	{
		yylval.str = text();
		popstate();
		return(ENDLIST);
		}
<INITIAL>[\{]	{
		yylval.str = text();
		push_state(BLOCK);
		return(BEGINBLOCK);
		}
<INITIAL>[\}]	{
		yylval.str = text();
		fprintf(stderr, "WARNING: Hey, was there a \{ to match to this \} at line %i\n", lineno());
		errors++;
		return(ENDBLOCK);
		}
<BLOCK>[\{]	{
		yylval.str = text();
		push_state(BLOCK);
		return(BEGINBLOCK);
		}
<BLOCK>[\}]	{
		yylval.str = text();
		popstate();
		return(ENDBLOCK);
		}
<BLOCKINIT>[\{]	{
		yylval.str = text();
		popstate();
		push_state(BLOCK);
		return(BEGINBLOCK);
		}
<BLOCKINIT>[\}]	{
		yylval.str = text();
		popstate();
		fprintf(stderr, "WARNING: Hey, was there a \{ to match to this \} at line %i\n", lineno());
		errors++;
		return(ENDBLOCK);
		}
<LOOP>[\{]	{
		yylval.str = text();
		push_state(BLOCK);
		return(BEGINBLOCK);
		}
<LOOP>[\}]	{
		yylval.str = text();
		popstate();
		return(ENDLOOP);
		}
<LOOPINIT>[\{]	{
		yylval.str = text();
		popstate();
		push_state(LOOP);
		return(BEGINLOOP);
		}
<LOOPINIT>[\}]	{
		yylval.str = text();
		popstate();
		fprintf(stderr, "WARNING: Hey, was there a \{ to match to this \} at line %i\n", lineno());
		errors++;
		return(ENDLOOP);
		}
[\(]		{
		yylval.str = text();
		return(LPARA);
		}
[\)]		{
		yylval.str = text();
		return(RPARA);
		}
[❬]		{
		yylval.str = text();
		return(LANGLE);
		}
[❭]		{
		yylval.str = text();
		return(RANGLE);
		}
[\[]		{
		yylval.str = text();
		return(LBRAK);
		}
[\]]		{
		yylval.str = text();
		return(RBRAK);
		}

{FUNCTIONS}	{
		yylval.str = text();
		return(FUNCTION);
		}
{CONDITIONAL}	{
		yylval.str = text();
		push_state(BLOCKINIT);
		return(CONDITIONAL);
		}
{DECLARATOR}	{
		yylval.str = text();
		push_state(BLOCKINIT);
		return(DECLARATOR);
		}
{DATATYPES}	{
		yylval.str = text();
		return(DATATYPE);
		}
STATIC		{
		yylval.str = text();
		return(STATIC);
		}
{LOOPFUN}	{
		yylval.str = text();
		push_state(LOOPINIT);
		return(LOOPFUN);
		}
{ANONYMOUS}	{
		yylval.str = text();
		push_state(LOOPINIT);
		return(LAMBDA);
		}
{ENDSTATE}	{
		yylval.str = text();
		return(ENDSTATE);
		}
{CONTROL}	{
		yylval.str = text();
		return(CONTROL);
		}
{OPERATOR}	{
		yylval.str = text();
		return(OPERATOR);
		}

[⌛]		{
		yylval.str = text();
		return(HOURGLASS);
		}
[↯]		{
		yylval.str = text();
		return(DANGERVOLTAGE);
		}
[\.]		{
		yylval.str = text();
		return(DOT);
		}
[➤]		{
		yylval.str = text();
		return(ARROWHEAD);
		}
[…]		{
		yylval.str = text();
		return(ELLIPSE);
		}
[⎋]		{
		yylval.str = text();
		return(ESCAPE);
		}
[⚠]		{
		yylval.str = text();
		return(WARNING);
		}
[\+]		{
		yylval.str = text();
		return(PLUS);
		}
[\-]		{
		yylval.str = text();
		return(MINUS);
		}
[\*]		{
		yylval.str = text();
		return(ASTRICKS);
		}
[\×]		{
		yylval.str = text();
		return(TIMES);
		}
[\/]		{
		yylval.str = text();
		return(SOLIDUS);
		}
[÷]		{
		yylval.str = text();
		return(DIVBY);
		}
[^]		{
		yylval.str = text();
		return(CAROT);
		}
[⋆]		{
		yylval.str = text();
		return(STAR);
		}
[%]		{
		yylval.str = text();
		return(PERCENT);
		}
[⍟]		{
		yylval.str = text();
		return(CIRCLESTAR);
		}
[√]		{
		yylval.str = text();
		return(CHECK);
		}
[\!]		{
		yylval.str = text();
		return(EXCLAIM);
		}
[¡]		{
		yylval.str = text();
		return(INVCLAIM);
		}
[⟦]		{
		yylval.str = text();
		return(LDOUBRAK);
		}
[⟧]		{
		yylval.str = text();
		return(RDOUBRAK);
		}
[⌊]		{
		yylval.str = text();
		return(LFLOOR);
		}
[⌋]		{
		yylval.str = text();
		return(RFLOOR);
		}
[⌈]		{
		yylval.str = text();
		return(LCEIL);
		}
[⌉]		{
		yylval.str = text();
		return(RCEIL);
		}
[`]		{
		yylval.str = text();
		return(GRAVE);
		}
[∧]		{
		yylval.str = text();
		return(LOGICAND);
		}
[\&]		{
		yylval.str = text();
		return(AMPERSAND);
		}
[∨]		{
		yylval.str = text();
		return(LOGICOR);
		}
[\|]		{
		yylval.str = text();
		return(PIPE);
		}
[⍲]		{
		yylval.str = text();
		return(LOGICNAND);
		}
[⍱]		{
		yylval.str = text();
		return(LOGICNOR);
		}
[⊕]		{
		yylval.str = text();
		return(CIRCLEPLUS);
		}
[↔]		{
		yylval.str = text();
		return(ARROWLR);
		}
[»]		{
		yylval.str = text();
		return(CHEVERONR);
		}
[«]		{
		yylval.str = text();
		return(CHEVERONL);
		}
[→]		{
		yylval.str = text();
		return(ARROWR);
		}
[←]		{
		yylval.str = text();
		return(ARROWL);
		}
[¬]		{
		yylval.str = text();
		return(LOGICNOT);
		}
[~]		{
		yylval.str = text();
		return(TILDE);
		}
[=]		{
		yylval.str = text();
		return(EQUALS);
		}
[⇔]		{
		yylval.str = text();
		return(DOUBLEARROWLR);
		}
[∈]		{
		yylval.str = text();
		return(ELEMENT);
		}
[∪]		{
		yylval.str = text();
		return(UNION);
		}
[∩]		{
		yylval.str = text();
		return(INTERSECTION);
		}
[⊂]		{
		yylval.str = text();
		return(SUBSET);
		}
[⊖]		{
		yylval.str = text();
		return(CIRCLEMINUS);
		}
[<]		{
		yylval.str = text();
		return(LESSTHAN);
		}
[>]		{
		yylval.str = text();
		return(GREATERTHAN);
		}
[≤]		{
		yylval.str = text();
		return(LESSOREQUAL);
		}
[≥]		{
		yylval.str = text();
		return(GREATEROREQUAL);
		}
[≠]		{
		yylval.str = text();
		return(NOTEQUAL);
		}
[≈]		{
		yylval.str = text();
		return(APPROXIMATELY);
		}
[≡]		{
		yylval.str = text();
		return(EXACTLYEQUAL);
		}
[¢]		{
		yylval.str = text();
		return(CENTS);
		}
[$]		{
		yylval.str = text();
		return(DOLLAR);
		}
[@]		{
		yylval.str = text();
		return(ATSIGN);
		}
[?]		{
		yylval.str = text();
		return(QUESTIONMARK);
		}
[¿]		{
		yylval.str = text();
		return(QUEPASA);
		}
[№]		{
		yylval.str = text();
		return(NUMERO);
		}
[±]		{
		yylval.str = text();
		return(GIVEORTAKE);
		}
[ℓ]		{
		yylval.str = text();
		return(LENGTH);
		}
[£]		{
		yylval.str = text();
		return(LBS);
		}
[¶]		{
		yylval.str = text();
		return(PILCROW);
		}
[≝]		{
		yylval.str = text();
		return(DEFINITION);
		}
[⤆]		{
		yylval.str = text();
		return(DOUBLELEFTARROW);
		}
[⤇]		{
		yylval.str = text();
		return(DOUBLERIGHTARROW);
		}

{NUMBER}	{
		yylval.num = strtoull(text(), NULL, 10);
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