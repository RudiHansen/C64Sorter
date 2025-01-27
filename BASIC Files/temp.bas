8500 n=50:                   rem the number of numbers to sort
8600 dim ns(n):              rem the array of numbers

8610 r = rnd(-se):           rem set seed for random
8620 for i = 1 to n
8630 ns(i)=int(rnd(1)*1000)
8640 next i



9800 rem sub print array
9810 rem ** init variables
9900 l1 = len(str$(ns(n)))+1: rem get len of last element in index
10000 l2 = int(39/l1):         rem get num of elements in output line
10100 l3 = int(n/l2)+1:        rem num of records in output array
10200 dim pa$(l3):             rem dim output array
10300 pc=0:                    rem init output array counter

10310 rem
10400 rem ** loop all elements and create strings for output in pa$
10600 for i=0 to n-1:                                  rem loop all elements
10700   l1$ = str$(ns(i)):                             rem get length of element
10800   if(len(l1$)<l1) then l1$=l1$+" " : goto 10800:  rem add spaces
10900   pa$(pc) = pa$(pc) + l1$:                       rem all element to output
11000   if(i+1-int((i+1)/l2)*l2)=0 then pc=pc+1:       rem if mod num of elements, add array counter
11100 next i

11110 rem
11120 rem ** output pa$() to screen
11130 rem ** print to lines 10-20
11140 rem ** line 22 can contain instructions to user
11145 print chr$(147)
11148 print pc
11150 if pc <= 10 then gosub 11200 : rem print with no user interaction
11160 if pc > 10  then gosub 13000 : rem print with scrolling
11170 end

11200 rem
11210 rem ** sub print with no user interaction
11215 print "sub 1";pc
11220 px=22: py=3 : pt$ = "press any key to continue" : gosub 20000
11230 px=10: py=1:      rem setup where to print text
11300 for i=0 to pc
11305   pt$ = pa$(i) : gosub 20000 
11310   px = px + 1
11320   if px>10 then px=10:gosub 30000
11400 next i
11405 gosub 30000: rem wait for keypress
11410 return

13000 rem
13010 rem ** print with scrolling
13015 print "sub 2"
13020 return

20000 rem sub print text at pos on screen, uses px,py,pt$
20010 rem px = x pos on screen, py= pos on screen, pt$ = text to print
20020 for j = 1 to len(pt$) : rem loop to find space
20030     if mid$(pt$, j, 1) <> " " then goto 20050
20040 next j
20050 pt$ = mid$(pt$, j): rem remove spaces
20060 poke781,px : poke782,py : sys 65520 : print pt$; : rem c64
20070 rem 65520, 0, px, py: print pt$ : rem c128
20080 return

30000 rem simple get-input-routine
30010 a$="": : rem initialize variables
30020 get a$: if a$="" then 30020
30050 return

