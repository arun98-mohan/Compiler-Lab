%%
[^a-z]+ printf("Valid: %s\n",yytext);
.* printf("Invalid\n");
%%

int main()
{
yylex();
return 0;
}
