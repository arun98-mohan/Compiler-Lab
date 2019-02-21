%%
[a-z]+[*|/|-|+]+[a-z][a-z'+''-''*''/']* {printf("\nMatched:%s",yytext);int i=0;char t; 
for(i=0;i<yyleng;i++)
 {
if(((yytext[i]=='+')||(yytext[i]=='-')||(yytext[i]=='*')||(yytext[i]=='/'))&&(yytext[i+1]!='\0')){
     t=yytext[i];
     yytext[i]=yytext[i+1];
     yytext[i+1]=t;
i=i+1;
}
 }
printf("\nNew string:%s",yytext);
//yymore();printf("\n%s",yytext);
}
%%
int main()
{
yylex();
return 0;
}
