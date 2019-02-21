%%
^("+"|"-")[0-9]+\n printf("\nMatch: %s of length: %d \n",yytext,yyleng);
.|\n {}
%%
int main()
{
 yylex();
 return 0;
}
