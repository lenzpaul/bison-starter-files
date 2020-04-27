/****** declarations and C support ******/

%{
#include<stdio.h>
#include<string.h>
int yylex(void);
int yywrap();
int yyerror(char* s);
%}

 /* identify the top level language component */
%start script

 /* identify what kind of values can be associated with the language components */
%union { char * str; }

/* TOKENS */
%token IDENTIFIER VAR

 /* for the token types that have an associated value, identify its type */
%type<str> IDENTIFIER  /* refers to yylval.str */

%%

/** Grammar rules **/ 

script:
		vardecl 
		;

 /* vardecl --> VAR IDENTIFIER ;
  *    where there is some character string associated with IDENTIFIER */
vardecl: VAR IDENTIFIER ';'
	{
	   /* display the text associated with IDENTIFIER (field $2) */
	   printf("...declared variable %s...\n", $2);
	};


%%

 /****** supporting C to carry out parsing ******/

int main()
{
   //printf("Beginning syntax checking:\n\n");
   printf("You may proceed with input...\n\n");
   int result = yyparse();
   //printf("\nSyntax checking complete\n\n");
   printf("\nMay the foo be with you!  \n\n");

   return result;
}




