%{
#include<stdio.h>
char a,b; int i,flag=0;
%}
%%
"case "[a-zA-Z0-9]": " {
flag=0;
a=yytext[5];
printf("else if(%c==%c) {",b,a);
}
"switch("[a-zA-Z]: {
b=yytext[7];
}
.* printf("%s }",yytext);
%%
int main()
{
 yylex();
 return 0;
}  
