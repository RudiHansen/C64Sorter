8000 rem sub print text at pos on screen, uses px,py,pl,pr,pt$
8010 rem px  = x pos on screen  py = pos on screen
8020 rem pl  = length of text   pr = remove leading spaces
8030 rem pt$ = text to print
8040 if pr = 0 goto 8090 : rem check if pr=0 then skip remove leading spaces
8050 for jx = 1 to len(pt$) : rem loop to find space
8060     if mid$(pt$, jx, 1) <> " " then goto 8080
8070 next jx
8080 pt$ = mid$(pt$, jx): rem remove spaces
8090 rem set length of text by appending spaces
8100 if pl = 0 goto 8200 :        rem check if pl=0 then skip
8110 if pl > len(pt$) goto 8140:  rem goto add make pt$ longer
8120 if pl < len(pt$) goto 8180:  rem goto add make pt$ shorter
8130 goto 8200:                   rem goto print pt$
8140 for jx = len(pt$) to pl-1
8150 pt$ = pt$ + " "
8160 next jx
8170 goto 8200
8180 pt$ = mid$(pt$, 1, pl)
8190 goto 8200
8200 poke781,px : poke782,py : sys 65520 : print pt$; : rem c64
8210 rem 65520, 0, px, py: print pt$ : rem c128
8220 return