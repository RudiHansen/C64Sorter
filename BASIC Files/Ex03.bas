100 print "{clear}{white}"
110 print "d&d character generator"
120 print ""
130 rem randomize
140 r = rnd(-ti)
150 dim stats$(5)
160 stats$(0)="strength"
170 stats$(1)="dexterity"
180 stats$(2)="constitution"
190 stats$(3)="intelligence"
200 stats$(4)="wisdom"
210 stats$(5)="charisma"
220 for s = 0 to 5
230 print chr$(13)stats$(s);
240 gosub 280
250 next s
260 end
270 :
280 rem dice rolls
290 d1 = int(rnd(1)*20)+1
300 d2 = int(rnd(1)*20)+1
310 d3 = int(rnd(1)*20)+1
320 d4 = int(rnd(1)*20)+1
330 av = int((d1+d2+d3+d4)/4)
335 print d1;d2;d3;d4
340 print "{cyan}"av"{white}"
350 return