9000 rem sub print array
9010 rem ** init variables
9020 l1 = len(str$(ns(n)))+1: rem get len of last element in index
9030 l2 = int(39/l1):         rem get num of elements in output line
9040 l3 = int(n/l2)+1:        rem num of records in output array
9050 dim pa$(l3):             rem dim output array
9060 pc=0:                    rem init output array counter
9070 rem
9080 rem ** loop all elements and create strings for output in pa$
9090 for i=0 to n-1:                                  rem loop all elements
9100   l1$ = str$(ns(i)):                             rem get length of element
9110   if(len(l1$)<l1) then l1$=l1$+" " : goto 9110:  rem add spaces
9120   pa$(pc) = pa$(pc) + l1$:                       rem all element to output
9130   if(i+1-int((i+1)/l2)*l2)=0 then pc=pc+1:       rem if mod num of elements, add array counter
9140 next i
9150 rem
9160 rem ** output pa$() to screen
9170 rem ** print to lines 10-20
9180 rem ** line 22 can contain instructions to user
9190 px=22: py=3 : pt$ = "press any key to continue" : gosub 8000
9200 px=10: py=1:      rem setup where to print text
9210 for i=0 to pc
9220   pt$ = pa$(i) : gosub 8000
9230   px = px + 1
9240   if px>20 then px=10:gosub 10000
9250 next i
9260 pt$ = "-                                     "
9270 for px=px to 20
9280   gosub 8000
9290 next px
9300 gosub 10000: rem wait for keypress
9310 px=22: py=3 : pt$ = "-                        " : gosub 8000
9320 end
