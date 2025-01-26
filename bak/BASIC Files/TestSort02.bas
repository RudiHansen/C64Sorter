10 rem ***********************************
20 rem ** Test Sorting algoritms on c64 **
30 rem **                               **
40 rem ** By Rudi Hansen 2025-01-23     **
45 rem ** Version 02                    **
50 rem ***********************************
60 rem https://builtin.com/machine-learning/fastest-sorting-algorithm
61 rem n=100 Bubble 92 steps , 104 sec, qsort 129 steps, 24 sec
62 rem n=200 Bubble 178 steps , 417 sec, qsort 265 steps, 48 sec
63 rem n=400 Bubble 393, 1709 sec, qsort 86 sec
64 rem n=600 Bubble 567 steps , 3785 sec, qsort 831 steps, 165 sec
70 rem *************************************************************************
71 rem ** changes v02 **
72 rem ** changed the sub print text at pos on screen
73 rem **     added a new line for the sys calls on c128
74 rem **     so remember to rem out the right line before use
99 rem *************************************************************************

100 print chr$(147)
110 px=1: py=5 : pt$ = "test sorting algorims on c64" : gosub 8000
120 se=150:                  rem set seed for random
130 n=100:                   rem the number of numbers to sort
135 n2=(n*1.1):              rem array size for the sk array, 
137                          rem needs to be bigger than n
140 dim ns(n):               rem the array of numbers
150 dim sk(n2):              rem the array used in qsort
160 REM goto 230

200 gosub 1000:              rem generate numbers to sort
210 gosub 2000:              rem sort using bubble sort
220 gosub 9000:              rem print sorted array
230 gosub 1000:              rem generate numbers to sort
240 px=9: py=1: pt$ = "start qsort": gosub 8000
250 w1=timer
260 gosub 4000:              rem sort using quick sort
270 px=11: py=1: pt$="qsort in      "+str$((timer-w1)/100)+"sec." : gosub 8000
280 gosub 9000:              rem print sorted array

999 end:                     rem end program

1000 rem sub generate numbers to sort
1010 px=3: py=1 : pt$ = "generating numbers to sort" : gosub 8000
1020 r = rnd(-se):           rem set seed for random
1030 for i = 1 to n
1040 ns(i)=int(rnd(1)*1000)
1050 next i
1060 px=4: py=1 : pt$ = "generation done" : gosub 8000
1080 return

2000 rem sub bubble sort
2010 px=5: py=1 : pt$ = "sort numbers using bubble sort" : gosub 8000
2020 px=6: py=1 : pt$ = "start sort" : gosub 8000
2030 s1=timer:               rem init timer
2040 s2=0:                   rem init step counter
2050 rem else
2060 : rem sw=whether this pass has had any swaps
2070 : rem start of pass
2080 :   s2=s2+1
2090 :   px=7: py=1 : pt$ = "step"+str$(s2) : gosub 8000
2100 :   px=7: py=20: pt$ = "Free mem"+str$(fre(0)): gosub 8000
2120 :   sw=0
2130 :   for x=0 to n-2
2140 :     if ns(x)<=ns(x+1) then goto 2220
2150 :     rem else
2160 :       rem s=placeholder value
2170 :       s=ns(x+1)
2180 :       ns(x+1)=ns(x)
2190 :       ns(x)=s
2200 :       sw=-1
2210 :     rem endif
2220 :   next
2230 : if sw then goto 2070
2240 px=8: py=1: pt$ = "bubble sort in"+str$((timer-s1)/100)+"sec." : gosub 8000
2260 return

4000 rem quick sort
4010 rem commodore basic does not really support recursion because everything
4020 rem is a global variable. however, recursion can be simulated with
4030 rem a "stack". this "stack" is just an array, sk, and a stack index, sp.
4040 rem source:
4050 rem
4060 rem inputs:
4070 rem - ns contains array to sort
4080 rem - n contains size of array
4090 rem outputs: ns contains sorted array
4100 lo = 0
4110 hi = n - 1
4120 s3=0
4130 rem recursive portion of algorithm
4140 rem inputs:
4150 rem - a contains array to sort
4160 rem - lo contains low index
4170 rem - hi contains high index
4180 rem outputs: a contains partially sorted array
4190 s3=s3+1: rem setup step counter and prints status
4200 px=10: py=1 : pt$ = "step"+str$(s3) : gosub 8000
4210 px=10: py=20: pt$ = "Free mem"+str$(fre(0))+"     ": gosub 8000
4220 if lo >= hi or lo < 0 then return
4230 gosub 4370: rem parition array and get pivot index (p)
4240 sp = sp + 1: sk(sp) = lo: rem push lo
4250 sp = sp + 1: sk(sp) = hi: rem push hi
4260 sp = sp + 1: sk(sp) = p: rem push p
4270 hi = p - 1: gosub 4130: rem sort left side of partition
4280 p = sk(sp): sp = sp - 1: rem pop p
4290 hi = sk(sp): sp = sp - 1: rem pop hi
4300 sp = sp + 1: sk(sp) = hi: rem push hi
4310 sp = sp + 1: sk(sp) = p: rem push p
4320 lo = p + 1: gosub 4130: rem sort right side of partition
4330 sp = sp - 1: rem pop p (don't store)
4340 hi = sk(sp): sp = sp - 1: rem pop hi
4350 lo = sk(sp): sp = sp - 1: rem pop lo
4360 return
4370 rem partition array
4380 rem inputs:
4390 rem - ns contains array to partition
4400 rem - lo contains low index
4410 rem - hi contains high index
4420 rem outputs:
4430 rem - a contains partitioned array
4440 rem - p contains pivot index
4450 pv = ns(hi): rem choose last value as pivot
4460 p = lo - 1: rem set temp pivot index
4470 rem swap elements less than or equal to pivot, and increment temp index
4480 for j = lo to hi - 1
4490     if ns(j) > pv then goto 4540
4500     p = p + 1
4510     t = ns(j)
4520     ns(j) = ns(p)
4530     ns(p) = t
4540 next j
4550 rem move pivot to correct position
4560 p = p + 1
4570 t = ns(hi)
4580 ns(hi) = ns(p)
4590 ns(p) = t
4600 return

8000 rem sub print text at pos on screen, uses px,py,pt$
8010 rem px = x pos on screen, py= pos on screen, pt$ = text to print
8020 rem poke781,px : poke782,py : sys 65520 : print pt$; : rem c64
8030 sys 65520, 0, px, py: print pt$ : rem c128
8040 return

8500 rem sub prints main screen
8510 print chr$(147)
8520 print "{white}{cm a}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{99}{cm s}";
8530 print "{125}    test sorting algoritms on c65     {125}";
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

9000 rem sub print array
9005 return
9010 for i=0 to n-1
9020 print ns(i);
9030 if (i + 1 - int((i + 1) / 7) * 7) = 0 then print: rem print a new line if i mod 7
9040 next
9050 print
9060 return