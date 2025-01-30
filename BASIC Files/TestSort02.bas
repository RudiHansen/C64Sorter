10 rem ===================================
20 rem    Test Sorting algoritms on c64
30 rem 
40 rem    By Rudi Hansen 2025-01-23
50 rem ===================================

100 print chr$(147)
110 px=1: py=5: pr=0: pl=30 : pt$ = "test sorting algorims on c64" : gosub 8000
120 se=150:                  rem set seed for random
130 n=200:                    rem the number of numbers to sort
140 n2=(n*1.2):              rem array size for the sk array, 
150                          rem needs to be bigger than n
160 dim ns(n):               rem the array of numbers
165 nl = 4:                  rem length of numbers used in array
170 dim sk(n2):              rem the array used in qsort
180 dim r1$(20):             rem array for results
185 ri = 0:                  rem index for r1
190 dim pa$(n):              rem array used in sub print array

191 a1=0:             rem pivot method for qsort(0=last/1=middle)
192 a2=0:             rem set output method for array (0=skip/1=userkey/2=sleep)
193                   rem set array generation options.
194 a3=0:             rem (0=random/1=seq/2=rseq/3=mix/4=10%swapped)

200 gosub 8500:              rem print main screen
210 gosub 1000:              rem generate numbers to sort
220 gosub 2000:              rem sort using bubble sort
230 gosub 9000:              rem print sorted array
240 gosub 8900:              rem sub clean main screen.

250 gosub 1000:              rem generate numbers to sort
260 gosub 3000:              rem sort using bubble sort2
270 gosub 9000:              rem print sorted array
280 gosub 8900:              rem sub clean main screen.

290 gosub 1000:              rem generate numbers to sort
300 gosub 4000:              rem sort using quick sort
310 px=6:py=12:pr=1:pl=15:pt$=str$((timer-s1)/100)+"sec.":gosub 8000
320 r1$(ri) = "qsort"+str$(s2)+" steps"+str$((timer-s1)/100)+" sec."
325 ri=ri+1
340 gosub 9000:              rem print sorted array
350 gosub 8900:              rem sub clean main screen.

360 gosub 8500:              rem print main screen
370 gosub 1000:              rem generate numbers to sort
380 gosub 5000:              rem sort using metzner sort
390 gosub 9000:              rem print sorted array
400 gosub 8900:              rem sub clean main screen.

500 print chr$(147)
510 for i = 0 to ri-1
520   print r1$(i)
530 next i

999 end:                     rem end program

1000 rem sub generate numbers to sort
1010 px=3: py=12:pr=0:pl=13 : pt$ = "gen num      " : gosub 8000
1020 r = rnd(-se):           rem set seed for random
1030 if a3=0 then gosub 1100
1040 if a3=1 then gosub 1200
1050 if a3=2 then gosub 1300
1060 if a3=3 then gosub 1400
1070 if a3=4 then gosub 1500
1080 px=3: py=12: pr=0: pl=13 : pt$ = "done         " : gosub 8000
1090 return

1100 rem generate totally random data
1110 for i = 1 to n
1120   ns(i)=int(rnd(1)*1000)
1130 next i
1140 return

1200 rem generates a nearly sorted list with small random variations
1210 for i = 1 to n
1220   ns(i) = i * 5 + int(rnd(1)*20)
1230 next i
1240 return

1300 rem generates a reversed, fully sorted list
1310 for i = 1 to n
1320   ns(i) = (n-i) * 10
1330 next i
1340 return

1400 rem generates a mix of structured and random numbers
1410 for i = 1 to n
1420 t = rnd(1)
1430 if t < 0.5 then  ns(i) = i * 5 
1440 if t >= 0.5 then ns(i) = int(rnd(1)*1000)
1450 next i
1460 return

1500 rem generate list with 10% swapped data
1510 for i = 1 to n
1520   ns(i) = i * 5 : rem start with sorted data
1530 next i
1540 for i = 1 to n/10 : rem swap arround 10% of the data
1550   a = int(rnd(1)*n)+1 : b = int(rnd(1)*n)+1
1560   te = ns(a) : ns(a) = ns(b) : ns(b) = te
1570 next i
1580 return


2000 rem bubble sort
2010 px=3: py=12: pr=0: pl=13 : pt$ = "bubble sort" : gosub 8000
2020 s1=timer:               rem init timer
2030 s2=0:                   rem init step counter
2040 te=0:                   rem temp variable for swap
2060 for x1=0 to n-1
2080   for x2=0 to (n-x1-1)
2090     if ns(x2) > ns(x2+1) then gosub 2500 : rem goto swap
2110   next x2
2111   px=4: py=12: pr=1: pl=13 : pt$ = str$(s2):     gosub 8000
2112   px=4: py=26:: pr=1: pl=12: pt$ = str$(fre(0)): gosub 8000
2130 next x1
2140 px=6: py=12: pr=1: pl=15: pt$ = str$((timer-s1)/100)+"sec." : gosub 8000
2150 r1$(ri) = "bubble sort"+str$(s2)+" steps"+str$((timer-s1)/100)+" sec."
2160 ri=ri+1
2170 return

2500 rem sub swap
2510 te       = ns(x2)
2520 ns(x2)   = ns(x2+1)
2530 ns(x2+1) = te
2570 s2=s2+1
2580 return


3000 rem bubble sort 2
3010 px=3: py=12: pr=0: pl=13 : pt$ = "bubble sort2" : gosub 8000
3020 s1=timer:               rem init timer
3030 s2=0:                   rem init step counter
3040 te=0:                   rem temp variable for swap
3050 sw=0:                   rem varaible to hold if anything has been swapped
3060 for x1=0 to n-1
3070   sw=0
3080   for x2=0 to (n-x1-1)
3090     if ns(x2) > ns(x2+1) then gosub 3500 : rem goto swap
3110   next x2
3111   px=4: py=12: pr=1: pl=13: pt$ = str$(s2)     :     gosub 8000
3112   px=4: py=26: pr=1: pl=12: pt$ = str$(fre(0)) : gosub 8000
3120 if(sw=0) goto 3140: rem end sorting
3130 next x1
3140 px=6: py=12: pr=1: pl=15: pt$ = str$((timer-s1)/100)+"sec." : gosub 8000
3150 r1$(ri) = "bubble sort2"+str$(s2)+" steps"+str$((timer-s1)/100)+" sec."
3160 ri=ri+1
3170 return

3500 rem sub swap
3510 te       = ns(x2)
3520 ns(x2)   = ns(x2+1)
3530 ns(x2+1) = te
3570 s2=s2+1
3575 sw       = 1
3580 return

4000 rem *** quick sort
4010 rem *** variables used in rutine
4020 rem ns() array of numbers to be sorted
4030 rem sk() array for stack
4040 rem n    number of items to sort
4050 rem p    pointer to stack
4060 rem l    temp storage of item
4070 rem f    temp storage of item
4080 rem i    counter
4090 rem j    counter
4100 rem d    pivot
4110 rem t    temp storage of item

4114 rem *** print start message, setup timer and s2 (step counter)
4115 px=3: py=12: pr=0: pl=13: pt$ = "qsort": gosub 8000
4116 s1=timer
4118 s2=0

4120 rem *** initialize stack for iterative quicksort ***
4130 sk(1)=0:sk(2)=n:p=2:               rem start with full range on stack

4140 rem *** sorting loop ***
4150 l=sk(p):p=p-1:                     rem pop high index (l)
4160 f=sk(p):p=p-1:                     rem pop low index (f)
4170 i=f
4180 j=l:d=ns((f+l)/2):                 rem choose pivot (middle value)

4190 rem *** partitioning step ***
4200 if ns(i)<d then i=i+1:goto 4200 :   rem find left-side value > pivot
4210 if ns(j)>d then j=j-1:goto 4210 :   rem find right-side value < pivot
4220 if i>j then 4260:                   rem if indices cross, partitioning is done

4230 rem swap ns(i) and ns(j)
4235 px=4: py=12: pr=1: pl=13 : pt$ = str$(s2):    gosub 8000
4238 px=4: py=26: pr=1: pl=12: pt$ = str$(fre(0)): gosub 8000
4239 s2=s2+1:                            rem inc step counter
4240 t=ns(i):ns(i)=ns(j):ns(j)=t
4250 i=i+1:j=j-1
4260 if i<=j then 4200: :                rem continue partitioning

4270 rem *** push new partitions onto stack if needed ***
4280 if f<j then p=p+1:sk(p)=f:p=p+1:sk(p)=j: rem left partition
4290 f=i:if f<l then 4180:               rem continue with right partition
4300 if p<>0 then 4150:                  rem continue if there are more partitions
4310 return


5000 rem sub metzner sort
5010 rem n  = number of items to sort
5020 rem ns = array of numbers
5030 rem i = some counter
5040 rem j1 = counter
5050 rem js = counter
5060 rem t = temp
5070 px=3: py=12: pr=0: pl=13 : pt$ = "metzner sort" : gosub 8000
5080 s1=timer:               rem init timer
5090 s2=0:                   rem init step counter
5100 i=2 
5110 i=2*i
5120 if i<n/2 then 5110
5130 for jl=0 to n-i 
5140 for j2=jl to 1 step -i 
5150 if ns(j2)>ns(j2+i)then 5190
5160 next jl:i=int(i/2)
5162 px=4: py=12: pr=1: pl=13 : pt$ = str$(s2):     gosub 8000
5164 px=4: py=26: pr=1: pl=12: pt$ = str$(fre(0)):  gosub 8000 
5170 if i>0 then 5130
5172 px=6: py=12: pr=1: pl=15: pt$ = str$((timer-s1)/100)+"sec." : gosub 8000
5174 r1$(ri) = "metzner sort"+str$(s2)+" steps"+str$((timer-s1)/100)+" sec."
5177 ri=ri+1
5180 return 
5190 t=ns(j2)
5200 ns(j2)=ns(j2+i)
5210 ns(j2+i)=t
5215 s2 = s2 + 1
5220 next j2
5230 goto 5160


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

8400 rem sub sleep
8410 for t = 1 to 1000: next t : rem sleep
8420 return

8500 rem sub prints main screen
8510 print chr$(147)
8520 print "{white}{cm a}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{cm s}";
8530 print "{125}    test sorting algoritms on c64     {125}";
8540 print "{125}                                      {125}";
8550 print "{125}  process:               free mem:    {125}";
8560 print "{125}  steps  :                            {125}";
8570 print "{125}                                      {125}";
8580 print "{125}  result :                            {125}";
8590 print "{125}                                      {125}";
8600 print "{cm q}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{cm w}";
8610 print "{125}                                      {125}";
8620 print "{125}                                      {125}";
8630 print "{125}                                      {125}";
8640 print "{125}                                      {125}";
8650 print "{125}                                      {125}";
8660 print "{125}                                      {125}";
8670 print "{125}                                      {125}";
8680 print "{125}                                      {125}";
8690 print "{125}                                      {125}";
8700 print "{125}                                      {125}";
8710 print "{125}                                      {125}";
8720 print "{125}                                      {125}";
8730 print "{125}                                      {125}";
8740 print "{125}                                      {125}";
8750 print "{125}                                      {125}";
8760 print "{cm z}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}";
8770 poke 2023,125
8780 rem process at 3,12
8790 rem steps as 4,12
8800 rem result at 6,12
8810 rem mem at 4,26
8820 rem free lines for other from 9-23
8830 return

8900 rem sub clean main screen.
8910 px=3: py=12:pr=0: pl=13: pt$ = " ": gosub 8000
8920 px=4: py=12:pr=0: pl=13: pt$ = " ": gosub 8000
8930 px=6: py=12:pr=0: pl=15: pt$ = " ": gosub 8000
8940 px=4: py=26:pr=0: pl=12: pt$ = " ": gosub 8000
8942 py=1: pr=0:pl=37
8945 for px=9 to 23
8950   pt$ = " ": gosub 8000
8960 next px
8970 return

9000 rem sub print array
9010 rem ** init variables
9015 if a2=0 then return:     rem if a2=0 skip output
9020 l1 = nl:                 rem set max str len of elements in index
9030 l2 = int(39/l1):         rem get num of elements in output line
9040 l3 = int(n/l2)+1:        rem num of records in output array
9060 pc=0:                    rem init output array counter
9065 px=3: py=12: pr=0: pl=13: pt$ = "print        ": gosub 8000
9070 rem
9080 rem ** loop all elements and create strings for output in pa$
9085 pa$(pc) = ""
9090 for i=0 to n-1:                                  rem loop all elements
9100   l1$ = str$(ns(i)):                             rem get length of element
9110   if(len(l1$)<l1) then l1$=l1$+" " : goto 9110:  rem add spaces
9120   pa$(pc) = pa$(pc) + l1$:                       rem all element to output
9130   if(i+1-int((i+1)/l2)*l2)=0 then pc=pc+1:pa$(pc) = "":rem add array counte
9140 next i
9150 rem
9160 rem ** output pa$() to screen
9170 rem ** print to lines 10-20
9180 rem ** line 22 can contain instructions to user
9190 px=22: py=5: pr=0: pl=25 : pt$ = "press any key to continue" : gosub 8000
9200 px=10: py=1: pr=0: pl=37 : rem setup where to print text
9210 for i=0 to pc
9220   pt$ = pa$(i) : gosub 8000
9230   px = px + 1
9240   if px>20 then px=10: if a2=1 then gosub 10000 : if a2=2 then gosub 8400
9250 next i
9270 for px=px to 20
9275   pt$ = " "
9280   gosub 8000
9290 next px
9300 if a2=1 then gosub 10000: rem if a2=1 wait for keypress
9305 if a2=2 then gosub 8400 : rem if a2=2 sleep
9310 px=22: py=5: pr=0: pl=25 : pt$ = " " : gosub 8000
9320 return

10000 rem simple get-input-routine
10010 a$="": : rem initialize variables
10020 get a$: if a$="" then 10020
10030 return

