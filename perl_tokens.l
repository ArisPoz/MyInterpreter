%{                                                                                          
#include "perl_bison.tab.h"                                                                     
extern int line_number;                                                                     
%}                                   
%%
$[a-zA-Z][a-zA-Z0-9]* { return VARIABLE;}
[a-zA-Z][a-zA-Z0-9]* { return MISSINGD;}
[0-9]+ {return INTEGER;}
[a-zA-Z] {return STRING;}
[0-9]+/.[0-9]+ {return FLOAT;}
";" {return SEMICOLON;}
"=" {return EQUAL;}
[\n] ;
%%


