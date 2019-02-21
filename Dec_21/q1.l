%%
^(abc)+\n printf("Match: %s",yytext);
.|\n {}
%%
int main()
{
yylex();
return 0;
}
