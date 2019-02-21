%{
int k_count=0,rop_count=0,upper_count=0,lower_count=0,s_count=0,char_count=0,word_count=0,line_count=0, i;
%}
%%
return|if|then|else|for|while|int|float|real {printf("Keyword: %s\n",yytext); k_count++; word_count++; char_count+=yyleng; for(i=0;i<yyleng;i++) if(yytext[i]>=65 && yytext[i]<97) upper_count++; else lower_count++; }
"<"|"<="|">"|">="|"!="|"=" {printf("Relational operator: %s\n",yytext); rop_count++; char_count++; }
[A-Z] {upper_count++; char_count++; printf("Upper case Letter: %s\n",yytext); word_count++; }
[a-z] {lower_count++; char_count++; printf("Lower Case Letter: %s\n",yytext); word_count++;}
"!"|"@"|"#"|"$"|"%"|"^"|"&"|"*"|"("|")" {printf("Special character: %s\n",yytext); s_count++; char_count++; }
\n {line_count++; char_count++; }
[A-Za-z0-9]+ {word_count++; char_count+=yyleng; printf("String: %s\n",yytext); for(i=0;i<yyleng;i++) if(yytext[i]>=65 && yytext[i]<97) upper_count++; else lower_count++;}
. {char_count++;}
%%
int main()
{
 yylex();
 printf("Key Word Count: %d\nRelational Operator: %d\nUpperCase Characters: %d\nLowerCase Count: %d\nSpecialChar: %d\nCharacter_Count: %d\nWord_Count: %d\nLine_Count: %d\n",k_count,rop_count,upper_count,lower_count,s_count,char_count,word_count,line_count);
 return 0;
}



