%{
#include<stdio.h>
int a0=0,a1=0,a2=0,a3=0,a4=0,a5=0,a6=0,a7=0,a8=0,a9=0,i,flag;
%}
%%

0 a0++;
1 a1++;
2 a2++;
3 a3++;
4 a4++;
5 a5++;
6 a6++;
7 a7++;
8 a8++;
9 a9++;

%%
int main()
{
 yylex();
 if(a0<=1&&a1<=1&&a2<=1&&a3<=1&&a4<=1&&a5<=1&&a6<=1&&a7<=1&&a8<=1&&a9<=1) printf("No Rep");
 return 0;
}
