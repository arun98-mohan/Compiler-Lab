iden [a-zA-Z][a-zA-Z0-9_]*
alnum [a-zA-Z0-9]
%{
#include<bits/stdc++.h>
#include<iostream>
using namespace std;
int flag=0;
string sent="";
int id=0,id1=0,i=0;
%}
%%
"switch("{iden}"){" {
sent=yytext;
id=sent.find('(');
id1=sent.find(')');
sent=sent.substr(id+1,id1-(id+1));
//cout<<sent;
}
"case "{alnum} {
if(flag==0){
cout<<"if("<<sent<<"=="<<yytext[yyleng-1]<<"){";
flag=1;
}
else{
cout<<"else if("<<sent<<"=="<<yytext[yyleng-1]<<"){";
}
}
"break;" {cout<<"}";}
"default" {cout<<"else{";}
\: {}
. {cout<<yytext;}
%%
int main(){
yylex();
return 0;
}

