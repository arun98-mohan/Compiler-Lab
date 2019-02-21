%%
[^aeiou]*a[^aeiou]*e[^aeiou]*i[^aeiou]*o[^aeiou]*u[^aeiou]* {printf("\nVowella: %s",yytext);}
%%
int main()
{
 yylex();
 return 0;
}
