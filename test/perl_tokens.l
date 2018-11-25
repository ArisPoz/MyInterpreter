%{                                                                                          
#include "perl_bison.tab.h"                                                                     
extern int line_number;                                                                     
%}                                                                                          
%option bison-bridge bison-locations

%%
$[a-zA-Z][a-zA-Z0-9]* { yylval->str = strdup(yytext); return VARIABLE;}
[0-9]+ {return INTEGER;}
";" {return SEMICOLON;}
"=" {return EQUAL;}
%%
