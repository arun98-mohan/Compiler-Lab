%{
int i,ac=0,bc=0;
%}

%%
.* {

ac=0;
bc=0;
for(i=0;i<yyleng;i++)
if(yytext[i]=='a') ac++;
else if(yytext[i]=='b') bc++;
if(ac%2==0 && bc%2==1) printf("\nEvena oddb: %s",yytext);
else printf("\nSorry %s",yytext);
}

%%
int main()
{
 yylex();
 return 0;
}
