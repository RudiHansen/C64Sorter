8500 n=100:                   rem the number of numbers to sort
8600 dim ns(n):              rem the array of numbers

8610 r = rnd(-se):           rem set seed for random
8620 for i = 1 to n
8630 ns(i)=int(rnd(1)*1000)
8640 next i



9800 rem sub print array
9900 l1 = len(str$(ns(n)))+1: rem get len of last element in index
10000 l2 = int(39/l1):         rem get num of elements in output line
10100 l3 = int(n/l2)+1:        rem num of records in output array
10200 dim pa$(l3):             rem dim output array
10300 pc=0:                    rem init output array counter

10400 print l1
10500 print l2
10510 print l3

10600 for i=0 to n-1:                                  rem loop all elements
10700   l1$ = str$(ns(i)):                             rem get length of element
10800   if(len(l1$)<l1) then l1$=l1$+" " : goto 10800:  rem add spaces
10900   pa$(pc) = pa$(pc) + l1$:                       rem all element to output
11000   if(i+1-int((i+1)/l2)*l2)=0 then pc=pc+1:       rem if mod num of elements, add array counter
11100 next i

11200 for i=0 to pc
11300   print pa$(i)
11400 next i
