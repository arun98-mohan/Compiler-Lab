%{
#include <stdio.h>
%}
%%
[0-9]+\n  {yyless(2); printf("Saw an integer: %s", yytext); }
.|\n { }
%%
int main(void)
{
yylex();
return 0;
}
