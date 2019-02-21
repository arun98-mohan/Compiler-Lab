%option noyywrap
%{
	char txt[10001],stack[100001];
	int in = 0,i,stop = 0,err = 0;
	int prec(char a,char b)
	{
		if(b=='(')
			return 0;
		if(a==b)
			return 1;
		if(a=='+')
			return 1;
		if(a=='-')
			return 1;
		if(a=='*' && b=='/')
			return 1;
		if(a=='/' && b=='*')
			return 1;
		return 0;
	}
%}
%%
[a-zA-Z]([0-9a-zA-Z])*	if(err == 0){
				for(i=0;i<yyleng;i++)
					txt[in++] = yytext[i];
				//txt[in++] = ' ';
			}  
\(  			stack[stop++] = yytext[0];
\)			if(err == 0){
				while(stop>0 && stack[stop-1]!='(')
				{
					txt[in++] = stack[--stop];
					//txt[in++] = ' ';
				}
				if(stop == 0)
					err= 1;
				--stop;
			}   	
\+|-|\*|\/		if(err == 0){
				while(stop>0 && prec(yytext[0],stack[stop-1]) == 1)
					txt[in++] = stack[--stop];
				stack[stop++] = yytext[0]; 
			}		

" "		
"\n"			{
			if(err == 0){
				while(stop>0 && stack[stop-1] != '(')
					txt[in++] = stack[--stop];
				txt[in] = '\0';
				if(stack[stop-1] == '(')
				{
					printf("invalid\n");
				}
				else
				printf("%s is the Postfix.\n",txt);
				in = 0;
				stop = 0;
			}			
			else {printf("invalid\n");err = 0;in = 0;stop = 0;}
			}	
%%
int main()
{

	yylex();
	return 0;
}
