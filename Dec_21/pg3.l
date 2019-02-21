%{
#include <stdio.h>
%}
%%

[a-z]+\n  {yymore(); printf("\n String: %s \n", yytext); }
.|\n { }
%%
int main(void)
{
yylex();
return 0;
}
