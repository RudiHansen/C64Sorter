2000 rem sub bubble sort
2010 px=3: py=12 : pt$ = "bubble sort" : gosub 8000
2030 s1=timer:               rem init timer
2040 s2=0:                   rem init step counter
2050 rem else
2060 : rem sw=whether this pass has had any swaps
2070 : rem start of pass
2080 :   s2=s2+1
2090 :   px=4: py=12 : pt$ = str$(s2)+"   " : gosub 8000
2100 :   px=4: py=26: pt$ = str$(fre(0))+"     ": gosub 8000
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
2240 px=6: py=12: pt$ = str$((timer-s1)/100)+"sec.    " : gosub 8000
2245 r1$(0) = "bubble sort in"+str$((timer-s1)/100)+"sec."
2250 gosub 8400: rem sleep 
2260 return

3000 rem bubble sort 2
3010 px=3: py=12 : pt$ = "bubble sort2" : gosub 8000
3020 s1=timer:               rem init timer
3030 s2=0:                   rem init step counter
3040 te=0:                   rem temp variable for swap
3050 sw=0:                   rem varaible to hold if anything has been swapped
3060 for x1=0 to n-1
3070   sw=0
3080   for x2=0 to (n-x1-1)
3090     if ns(x2) > ns(x2+1) goto 3500 : goto swap
3100   next x2
3105   if(sw=0) return:
3110 next x1
3120 px=6: py=12: pt$ = str$((timer-s1)/100)+"sec.    " : gosub 8000
3130 r1$(1) = "bubble sort2 in"+str$((timer-s1)/100)+"sec."
3140 gosub 8400: rem sleep 
3150 return

3500 rem sub swap
3510 te       = ns(x2)
3520 ns(x2)   = ns(x2+1)
3530 ns(x2+1) = temp
3540 sw       = 1
3550 px=4: py=12 : pt$ = str$(s2)+"   " : gosub 8000
3560 px=4: py=26: pt$ = str$(fre(0))+"     ": gosub 8000
3570 return
