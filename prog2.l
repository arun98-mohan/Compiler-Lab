%{
char ident1;
char ident2;
char ident3;
%}
ident [a-z|A-Z] 
nested_if if[(]{ident}>{ident}[)][{][\n]if[(]{ident}>{ident}[)][\n].*;[\n]else[\n].*;[\n][}][\n]else[\n].*;
%%
{nested_if} {
ident1=yytext[3];
ident2=yytext[5];
ident3=yytext[14];
printf("\nif(%c>%c&&%c>%c)\nprintf(\"%c is greater\");\nelse\nprintf(\"%c is not greater\")",ident1,ident2,ident1,ident3,ident1,ident1);
}
%%
int main()
{
yylex();
}
