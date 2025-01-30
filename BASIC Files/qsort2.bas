100 rem quicksort routine
110 n=255:              rem number of items to use
120 dim ns(n):          rem define array ns(size n)
130 dim sk(n/8):        rem Define stack sk(size n/8)

140 rem generate random array
150 r = rnd(-150): rem setup seed for rnd
160 for i=0 to n
170   ns(i)= int(rnd(1)*1000)
180 next i
190 rem print array
200 for i=0 to n
210   print ns(i);
220 next i
230 print ""

240 rem *** variables used in rutine
250 rem a()  array of numbers to be sorted     change to ns
260 rem s()  array for stack                   change to sk
270 rem n    number of items to sort
280 rem p    pointer to stack
290 rem l    temp storage of item
300 rem f    temp storage of item
310 rem i    counter
320 rem j    counter
330 rem d    pivot
340 rem t    temp storage of item

350 rem *** initialize stack for iterative quicksort ***
360 sk(1)=0:sk(2)=n:p=2:                rem start with full range on stack

370 rem *** sorting loop ***
380 l=sk(p):p=p-1:                     rem pop high index (l)
390 f=sk(p):p=p-1:                     rem pop low index (f)
400 i=f
410 j=l:d=ns((f+l)/2):                 rem choose pivot (middle value)

420 rem *** partitioning step ***
430 if ns(i)<d then i=i+1:goto 430 :   rem find left-side value > pivot
440 if ns(j)>d then j=j-1:goto 440 :   rem find right-side value < pivot
450 if i>j then 490:                  rem if indices cross, partitioning is done

460 rem swap ns(i) and ns(j)
470 t=ns(i):ns(i)=ns(j):ns(j)=t
480 i=i+1:j=j-1
490 if i<=j then 430: :               rem continue partitioning

500 rem *** push new partitions onto stack if needed ***
510 if f<j then p=p+1:sk(p)=f:p=p+1:sk(p)=j: rem left partition
520 f=i:if f<l then 410:              rem continue with right partition
530 if p<>0 then 380:                 rem continue if there are more partitions

540 rem print array
550 print "" : print ""
560 for i=0 to n
570   print ns(i);
580 next i
