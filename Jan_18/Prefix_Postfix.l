%{
#include<string.h>
int i;
int a=-1;
int s=-1;
int j=0;
int p=-1;
%}
%%
.* { char stack[yyleng],answer[yyleng+1];
	for(i=0;i<yyleng;i++)
	{
		if((yytext[i]!='(')&&(yytext[i]!=')')&&(yytext[i]!='+')&&(yytext[i]!='-')&&(yytext[i]!='*')&&(yytext[i]!='/'))
	{
		answer[++a]=yytext[i];	
	}
	else if(yytext[i]=='(')
	{
		stack[++s]=yytext[i];
	}
	else if(yytext[i]==')')
	{
		for(j=s;stack[j]!='(';j--)
		{
			if(j>-1){			
			answer[++a]=stack[j];
			s--;}
			else
				break;
		}
		s--;	
	}
	else if(yytext[i]=='+' || yytext[i]=='-')
	{
		for(j=s;j>-1;j--){
		if(stack[j]=='*' || stack[j]=='/')
		{
			answer[++a]=stack[j];
			s--;
		}
		else
			break;		
		}
		stack[++s]=yytext[i];
	}
	else
	{
		stack[++s]=yytext[i];
	}

	
	}
	for(s;s>-1;s--)
	{
		answer[++a]=stack[s];
	}
	printf("Postfix: %s",answer);
	char pre[yyleng][yyleng];
	char t1[yyleng];
	char t2[yyleng];
	char b[yyleng];
	char z[yyleng];
	for(i=0;i<=a;i++)
	{
		if((answer[i]!='+')&&(answer[i]!='-')&&(answer[i]!='*')&&(answer[i]!='/'))
		{
			pre[++p][0]=answer[i];
			pre[p][1]='\0';
		}
		else
		{
			strcpy(t1,"\0");			
			strcpy(t1,pre[p]);
			p--;
			strcpy(t2,"\0");
			strcpy(t2,pre[p]);
			strcpy(z,"\0");			
			strcpy(b,"\0");
			b[0]=answer[i];
			b[1]='\0';
			strcat(z,b);
			strcat(z,t2);
			strcat(z,t1);
			strcpy(pre[p],z);
			
		}	
	} 
	printf("\nPrefix: \n%s",pre[0]);
	}
%%

int main()
{
yylex();
return 0;
}
