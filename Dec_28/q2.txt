while (c ! = eof) {
s = move(s,c);
c := ;
If (c = = ‘<’ )
state = 1;
else if (c = = ‘ =’ )
state = 5;
else if (c = = ‘ > ‘)
state = 6;
}
If (s = F )
return “yes”;
else
return “no”;
