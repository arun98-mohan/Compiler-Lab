key int|float
some_key printf
alnum [a-zA-Z][a-zA-Z0-9_]*
%{
#include<bits/stdc++.h>
#include<iostream>
using namespace std;
string dec1="",snr,dec11="";
string sent;
int id=0,id1=0;
%}
%%
{some_key} {snr+=yytext;}
{key}.* {
dec1+=yytext;
}
"while(".*"){" {
sent=yytext;
id=sent.find('(');
id1=sent.find(')');
sent=sent.substr(id+1,id1-(id+1));
dec1+=sent+';';
}
\n {snr+="\n";}
({alnum}(\+\+|\-\-|\+=|\-=)";")*$ {
//cout<<"tada "<<yytext<<" "<<dec1<<endl;
dec1+=yytext;
//dec1=dec1.substr(0,yyleng-1);
}
. {
snr+=yytext;
}
(\.\.) {
dec1=dec1.substr(0,dec1.length()-1);
cout<<"for("<<dec1<<"){\n"<<snr;}
%%
int main(){
yylex();
return 0;
}
