%{                                                                                   
	#include <stdarg.h>
	#include <stdio.h>   
	void yyerror (char const *);
	#define YYSTYPE char *
	#define YYPARSE_PARAM scanner
	#define YYLEX_PARAM scanner
	extern "C" int yylex();
	extern "C" int yyparse();
       
	int line_number=1;   
	int yydebug=1;                                                                    
	int indent=0;                                                                     
	char *iden_dum;                                                                   
%}     
%locations
%pure-parser
%union {
	char *str;
	int ival;
	float fval;
}

%token <ival> INT
%token <fval> FLOAT                                                                              
%token <str> STRING                                                                 

%%
declaration:
	VARIABLE EQUAL variable_type_definition SEMICOLON {printf("you declared an % variable");};

variable_type_definition:
	INT {printf(" integer");};	
	
%%
 void yyerror(char const *s)
 {
 fprintf(stderr,"%s\n",s);
 }  
main ()                                                                              
{  
                                                                                
  yyparse ();                                                                        
}
