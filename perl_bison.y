%{                                                                                   
	#include <stdarg.h>
	#include <stdio.h>   
	void yyerror (char const *);
       
	int yylex();
	int line_number=1;   
	int yydebug=1;                                                                    
	int indent=0;                                                                     
	char *iden_dum;                                                                   
%}                                              
%token SEMICOLON
%token EQUAL
%token VARIABLE
%token INTEGER
%token FLOAT
%token STRING
%token MISSINGD

%%
declaration:
	variable EQUAL type_definition SEMICOLON {printf("you declared a variable");}
	| MISSINGD EQUAL type_definition SEMICOLON {printf("you forgot $");}
		;

variable: VARIABLE{ printf("\n");}; 

type_definition:
	INTEGER {printf("you gave an integer\n");}
	|FLOAT {printf("you gave a float\n");}
	|STRING {printf("you gave a string\n");}
;
/*
variable_declaration:
	VARIABLE { printf("\n %s",$1);};
*/
	
%%
 void yyerror(char const *s)
 {
 fprintf(stderr,"%s\n",s);
 }  
main ()                                                                              
{  
                                                                                
  yyparse ();                                                                        
}
