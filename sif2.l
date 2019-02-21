%{
char i;char d[100];
%}
%%
switch[(][0-9]+[)] {
//printf("\nMatched:%s",yytext);
i=yytext[7];
//printf("\n%c",i);
printf("if(i==%c)",i);
}
case[0-9]+[:][a-z'+'';'] {printf("\n%s",yytext+6);
}
%%
int main()
{
yylex();
return 0;
}
