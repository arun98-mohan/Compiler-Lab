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
 if(a0<=2&&a1<=2&&a2<=2&&a3<=2&&a4<=2&&a5<=2&&a6<=2&&a7<=2&&a8<=2&&a9<=2) printf("ACCEPTED \n");
else printf("\nNOT ACCEPTED\n");
 return 0;
}
