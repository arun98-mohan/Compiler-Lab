%option noyywrap
%{
	int kc=0,oc= 0,ic = 0,bc = 0,wc = 0,nc = 0;
%}
%%
[a-z]+\+\+   {printf("%s is a post increment\n",yytext);}
\+\++[a-z]   {printf("%s is a pre increment\n",yytext);}
return|float 		{printf("%s is a keyword\n",yytext); kc++;}
\+\+|--|==|<=|>=	{printf("%s is a operation token\n",yytext); oc++;}
=|\+|\-|\*|\/|\;|\?|\: 	{printf("%s is a operation token\n",yytext); oc++;}
[a-zA-Z][a-zA-Z0-9]* 	{ic++; printf("%s is a identifier token\n",yytext);}
\(|\{|\)|\} 		{printf("%s is a brackets token\n",yytext); bc++;}
"\t"|" "|"\n" 		{printf("whitespace\n"); wc++;}
(\+|-)?[0-9]+(\.[0-9]+)?(e(\+|-)?[0-9]+)? {printf("<%s> number token",yytext); nc++;}
%%
int main()
{
	yylex();
	printf("%d keywords\n%d operations\n%d identifiers\n%d whitespaces\n%d brackets\n%d numbers\n",kc,oc,ic,wc,bc,nc);
	return 0;
}
