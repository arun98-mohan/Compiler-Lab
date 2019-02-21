%{
#include<bits/stdc++.h>
#include<iostream>
using namespace std;
string sent="",condition="",increment="";
int id=0,id1=0,rem=0;
%}
%%

"for ( init; condition; increment ) {"	{ 

//finding init
sent=yytext;
id=sent.find("(");
id1=sent.find(";");
sent=sent.substr(id+1,id1-(id+1));

//finding the condition part
condition=yytext;
id=condition.find(";");
condition=yytext+id+1;
id1=condition.find(";");
condition=condition.substr(0,id1);

//finding the increment part
increment=yytext;
rem=increment.find(";");
increment=yytext+(rem+1);
id=increment.find(";");
increment=yytext+rem+1+id+1;
id1=increment.find(")");
increment=increment.substr(0,id1);

cout<<sent<<";\ndo{\n"<<increment<<";"<<endl;
}


[a-zA-Z\(\)\;]* { 

cout<<yytext<<"\n}\nwhile("<<condition<<");"<<endl;
} 

.* { }
%%
int main()
{
 yylex();
 return 0;
}
