
 /****** 
   setup the C/lex infrastructure.
   Add libraries and header files as needed.
 ******/
%{
#include <stdio.h>
#include "demo.tab.h"
extern YYSTYPE yylval;
int yyerror(char* s);
%}


%%

 /* for the keyword "VAR" return VAR as the type */
"VAR" { return(VAR); }

 /* tokenize words  */
[A-Za-z]+ { yylval.str = strdup(yytext); return(IDENTIFIER); }

 /* tokenize the semi-colon */
";"        { return(';'); }

 /* skip whitespace (spaces, tabs, form feeds etc */
[ \t\f\v]  { }

%%

 /****** supporting C code ******/
 /* cleanup any loose ends at the end of input,
 * currently just returns true (1) */
int yywrap()
{
   return 1;
}

 /* print any generated error messages (to stderr) */
int yyerror(char* s)
{
   fprintf(stderr, "***Error detected: %s\n   continuing with processing.\n", s);
   return 1;
} 
