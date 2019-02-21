%{
char cond1[10000];
char cond2[10000];
char stat1[10000];
char stat2[10000];
int z=0;
char d[1]="d";
%}
%option noyywrap
alph [a-z]
rel [<|<=|>|>=]
equ [=]
digit [0-9]
%%
"while("{alph}{rel}{digit}")" { 
if (z==0)
{
z=1;
int i=0,j=0;
for(i=6,j=0;i<yyleng-1;i++,j++)
{
cond1[j]=yytext[i];
}
//printf("cond1:%s",cond1);
}
else
{
int l=0,k=0;
for(k=6,l=0;k<yyleng-1;k++,l++)
{cond2[l]=yytext[k];
}
//printf("\ncond2:%s",cond2);
}
}
"do"(.|\n)*"do" { 
int i=0,k=0;
for(i=2,k=0;i<yyleng-1;i++,k++)
{if(yytext[i]=='d')
{break;}
stat1[k]=yytext[i];
}
//printf("\nstat1:%s",stat1);
}
"{"(.|\n)*";}" { 
int i=0,k=0;
for(i=0,k=0;i<yyleng-1;i++,k++)
{stat2[k]=yytext[i];
}
//printf("\nstat2:%s",stat2);
}
//.* ;
%%
int main()
{
yylex();
printf("\nfor(p=0;%s;p++)%sfor(i=0;%s;i++)%s}",cond2,stat1,cond1,stat2);
}

