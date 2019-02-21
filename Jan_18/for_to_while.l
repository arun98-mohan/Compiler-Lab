iden [a-zA-Z][a-zA-Z0-9_]*
%{
#include<bits/stdc++.h>
#include<iostream>
using namespace std;
string sent="";
int id=0,id1=0,rem=0;
%}
%%
"for("({iden}"="[0-9]","?)*";"({iden}["<"">""=="][0-9]","?)*";"({iden}("++"|\-\-)","?)*")""{"? {
sent=yytext;
id=sent.find("(");
id1=sent.find(";");
sent=sent.substr(id+1,id1-(id+1));
cout<<sent<<";";

sent=yytext+(id1+1);
id=sent.find(";");
sent=sent.substr(0,id);
//printf("while(%s)",sent);
cout<<"\nwhile("<<sent<<")\n{";

sent=yytext;
rem=sent.find(";");
sent=yytext+(rem+1);
id=sent.find(";");
sent=yytext+(id+rem+2);
id1=sent.find(")");
sent=sent.substr(0,id1);
//cout<<sent;
}
"}" { }
.* printf("%s",yytext);
%%
int main()
{
yylex();
cout<<sent<<";\n}\n";
return 0;
}
