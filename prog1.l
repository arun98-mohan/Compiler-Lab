%{
char init[10];
char cond[10];
char incr[10];
char id[50];
char init1[10];
char cond1[10];
char incr1[10];
char id1[50];
int len;
%}
for_case for[(].*;.*;.*[)][{][\n]for[(].*;.*;.*[)][{][\n].*;[\n][}][\n].*;[\n][}]
%%
{for_case} {
int i=0;
int j;
i=4;
j=0;
while(yytext[i]!=';')
{
init[j]=yytext[i];
j++;
i++;
}
init[j]='\0';
i++;
j=0;
while(yytext[i]!=';')
{
cond[j]=yytext[i];
i++;
j++;
}
cond[j]='\0';
i++;
j=0;
while(yytext[i]!=')')
{
incr[j]=yytext[i];
i++;
j++;
}
incr[j]='\0';
i=i+7;
j=0;
while(yytext[i]!=';')
{
init1[j]=yytext[i];
j++;
i++;
}
init1[j]='\0';
i++;
j=0;
while(yytext[i]!=';')
{
cond1[j]=yytext[i];
i++;
j++;
}
cond1[j]='\0';
i++;
j=0;
while(yytext[i]!=')')
{
incr1[j]=yytext[i];
i++;
j++;
}
incr1[j]='\0';
i=i+3;
j=0;
while(yytext[i]!=';')
{
id[j]=yytext[i];
j++;
i++;
}
id[j]='\0';
i=i+4;
j=0;
while(yytext[i]!=';')
{
id1[j]=yytext[i];
j++;
i++;
}
id1[j]='\0';
printf("\n%s;\n%s;\ndo{\ndo{\n%s;\n%s;\n}while(%s);\n%s;\n%s;\n}while(%s);\n",init,init1,id,incr1,cond1,id1,incr,cond);
}
.* {printf("%s",yytext);}
%%
int main()
{
yylex();
}
