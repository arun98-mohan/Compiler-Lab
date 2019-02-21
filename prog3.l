%{
char id1[50];
char id2[50];
char cond1[50];
char cond2[50];
%}
do_while do[{][\n].*;[\n]do[{][\n].*;[\n][}]while[(].*[)];[\n][}]while[(].*[)];
%%
{do_while} {
int i=4;
int j=0;
while(yytext[i]!=';')
{
id1[j]=yytext[i];
j++;
i++;
}
id1[j]='\0';
i=i+6;
j=0;
while(yytext[i]!=';')
{
id2[j]=yytext[i];
j++;
i++;
}
id2[j]='\0';
i=i+9;
j=0;
while(yytext[i]!=')')
{
cond1[j]=yytext[i];
i++;
j++;
}
cond1[j]='\0';
i=i+10;
j=0;
while(yytext[i]!=')')
{
cond2[j]=yytext[i];
i++;
j++;
}
cond2[j]='\0';
printf("for(;%s;){\n%s;\nfor(;%s;){\n%s;\n}\n}",cond2,id1,cond1,id2);

}
%%
int main()
{
yylex();
}
