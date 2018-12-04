%token BEGINBLOCK ENDBLOCK BEGINLOOP ENDLOOP FUNCTION CONDITIONAL DECLARATOR DATATYPES STATIC LOOPFUN ENDSTATE CONTROL NULL NUMBER STRING NAME NEWLINE
%token PLUSPLUS MINUSMINUS DOUBLEASTRIKS TERTIATE LOGICNAND LOGICNOR LOGICXOR LOGICAND LOGICOR
%token ❬ ❭ ⌛ ↯ … ⎋ ⚠ → × ÷ ⋆ ⍟ √ nPr nCr ¡ ⟦ ⟧ ⌊ ⌋ ⌈ ⌉ ⍲ ⍱ ∧ ∨ ⊕ ↔ ➤ » « ← ⇔ ≡ ∈ ∪ ∩ ⊂ ⊖ ≤ ≥ ≠ ≈ ¢ ¿ № ± ℓ ¶ ≝

%right ≝
%left PLUSPLUS MINUSMINUS
%left ⇔
%left LOGICXOR
%left LOGICNOR
%left LOGICNAND
%left LOGICOR
%left LOGICAND
%left ↔
%left ⊕
%left ⍱
%left ⍲
%left ∨ '|'
%left ∧
%left ≡ ≤ ≥ ≈ '<' '>' '='
%left '+' ¢
%left × ÷ '%' nPr nCr
%right ⋆ ⍟ √ '^' TERTIATE DOUBLEASTRIKS
%left ➤ …
%right '-' '`' '~' ⌛ ⎋ ⚠ '!' ¡
%right № ± ℓ '?' ¿
%right '*' '&'
%right '$' '@'
%left PAREN FUNCTION BRACKET ENDSTATE
%left VARIABLE SIGNAL DATATYPE INTERGER FLOAT FILEPATH STRING
%left CONTROL
%right ESCAPECHAR ¶
%left CONDITIONAL DECLARATOR LOOPFUN
%left EXACT