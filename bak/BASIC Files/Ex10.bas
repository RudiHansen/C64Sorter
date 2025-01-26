10 poke 53280,0:poke 53281,0:poke 646,1
20 print chr$(147)
30 print "press any key or run/q to quit"
40 get a$:if a$="" goto 40
50 if a$="q" then goto 200
60 print chr$(147)
70 b=asc(a$)-64
80 for n=1024 to 2023 step 3:poke n,b:next
90 goto 40

200 poke 53280,254:poke 53281,246:poke 646,14
210 print chr$(147)
