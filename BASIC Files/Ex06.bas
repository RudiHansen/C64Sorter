10 rem cursor position text using poke
20 sys 65517
30 print "this display has "peek(781)"columns"chr$(13)"press a key" 
40 get a$ : if a$= "" then 40
50 gosub 100
60 end
100 rem plot the cursor with poke
110 row = 10 : column = 10
120 print "{clear}"
130 gosub 1000
140 print "this should be at 10,10"
150 row = 8 : column = 8
160 gosub 1000
170 print "this is at 8,8{down}{down}{down}{down}{down}{down}{down}"chr$(13)
180 return
1000 rem set the cursor 
1010 poke 214, row
1020 poke 211, column
1030 sys 58732
1040 return
1050 rem end of plot routine
1060 rem ..................................