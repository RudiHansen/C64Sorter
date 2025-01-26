10 print chr$(147)
20 x=5 : y=10 : a$ = "rudi"
30 gosub 1000
40 x=6 : y=10 : a$ = "hansen"
50 gosub 1000
60 rem for t = 1 to 1000: next t : rem laver en lille pause
70 rem gosub 2000
80 rem for t = 1 to 1000: next t : rem laver en lille pause
90 rem gosub 3000
100 for t = 1 to 1000: next t : rem laver en lille pause
110 px=10 : py=5: pt$="test text"
120 gosub 8000

200 end

1000 rem ** print a$ at x,y
1010 rem poke781,x : poke782,y : sys 65520 : print a$; : rem c64
1020 sys 65520, 0, x, y: print a$ : rem c128
1050 return

2000 rem ** print lines on screen
2010 print chr$(147)
2020 for i = 0 to 24
2030 x=i : y=1 : a$ = "Line"+str$(i)
2035 gosub 1000
2040 next i
2050 return

3000 rem ** print one line to check screen width **
3010 print chr$(147)
3020 print "01234567890123456789012345678901234567890"
3030 print "          1         2         3         4"
3040 return

8000 rem sub print text at pos on screen, uses px,py,pt$
8010 rem px = x pos on screen (0-39), py = y pos on screen (0-24), pt$ = text to print
8015 print chr$(147) : rem clear screen
8020 p1 = py * 40 + px      : rem calculate screen position
8030 for i = 1 to len(pt$)   : rem loop through characters in the text
8040 c = asc(mid$(pt$, i, 1)) : rem get ASCII value of the character
8050 if c >= 65 and c <= 90 then c = c - 64 : rem uppercase letters A-Z
8060 if c >= 97 and c <= 122 then c = c - 96 : rem lowercase letters a-z
8070 poke 1024 + p1, c : rem poke character to screen memory
8080 p1 = p1 + 1           : rem go to next position
8090 next i
8100 return