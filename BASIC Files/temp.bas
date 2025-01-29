100 print chr$(147)
120 px=1: py=1: pl=0:  pr=1: pt$=" test text" : gosub 8000
130 px=2: py=1: pl=20: pr=1: pt$=" test text" : gosub 8000
140 px=5: py=1: pl=15: pr=1: pt$=" 123456789012345678901234567890" : gosub 8000
999 end

8000 rem sub print text at pos on screen, uses px,py,pl,pr,pt$
8010 rem px  = x pos on screen  py = pos on screen
8020 rem pl  = length of text   pr = remove leading spaces
8025 rem pt$ = text to print

8100 if pr = 0 goto 8200 : rem check if pr=0 then skip remove leading spaces
8110 for jx = 1 to len(pt$) : rem loop to find space
8120     if mid$(pt$, jx, 1) <> " " then goto 8140
8130 next jx
8140 pt$ = mid$(pt$, jx): rem remove spaces

8200 rem set length of text by appending spaces
8210 if pl = 0 goto 8500 :        rem check if pl=0 then skip 
8220 if pl > len(pt$) goto 8300:  rem goto add make pt$ longer
8230 if pl < len(pt$) goto 8400:  rem goto add make pt$ shorter
8240 goto 8500:                   rem goto print pt$

8300 for jx = len(pt$) to pl-1
8310 pt$ = pt$ + " "
8320 next jx
8330 goto 8500

8400 pt$ = mid$(pt$, 1, pl)
8410 goto 8500

8500 poke781,px : poke782,py : sys 65520 : print pt$; : rem c64
8510 rem 65520, 0, px, py: print pt$ : rem c128
8520 return