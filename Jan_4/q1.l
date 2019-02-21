%{
#include<stdio.h>
int i,flag;
%}
%%
("/*").*("*/") {
//printf("Length: %d",yyleng);
flag=1;
for(i=2;i<yyleng-2;i++)
{
if(yytext[i]=='*'&&yytext[i-1]!='"')
if(yytext[i+1]=='/')
flag=0;
}
if(flag==1) printf("Comment: %s",yytext);
else printf("Vulnerable Comment: %s",yytext);
}
. {}
%%
int main()
{
 yylex();
 return 0;
}
