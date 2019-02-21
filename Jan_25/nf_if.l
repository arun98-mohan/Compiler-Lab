%{
#include<bits/stdc++.h>
#include<iostream>
using namespace std;
string i="";
string j="";
%}
%%

("if")(" ")?("(").*(")") {
i=i+(yytext+;
}
"else" { }
.*  {j=j+yytext;}

%%
int main()
{
 //cout<<"if( ";
 yylex();
 cout<<i<<j;
 return 0;
}

