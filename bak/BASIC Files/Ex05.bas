10 rem colour poke all the colours demo
15 b=53280 : p=53281 : v=53265 : t=646 : r=128
20 print "{clear}"
30 c = c+1: if c>15 then c=0
35 forw=1to15:waitv,r:nextw
40 poke b,c : poke p, peek (b)
50 poke t, c
60 print " poke all the colours ";
70 goto 30