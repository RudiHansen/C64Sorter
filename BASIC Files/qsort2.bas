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

240 rem *** quick sort
250 rem *** variables used in rutine
260 rem ns() array of numbers to be sorted
270 rem sk() array for stack
280 rem n    number of items to sort
290 rem p    pointer to stack
300 rem l    temp storage of item
310 rem f    temp storage of item
320 rem i    counter
330 rem j    counter
340 rem d    pivot
350 rem t    temp storage of item

360 rem *** initialize stack for iterative quicksort ***
370 sk(1)=0:sk(2)=n:p=2:               rem start with full range on stack

380 rem *** sorting loop ***
390 l=sk(p):p=p-1:                     rem pop high index (l)
400 f=sk(p):p=p-1:                     rem pop low index (f)
410 i=f
420 j=l:d=ns((f+l)/2):                 rem choose pivot (middle value)

430 rem *** partitioning step ***
440 if ns(i)<d then i=i+1:goto 440 :   rem find left-side value > pivot
450 if ns(j)>d then j=j-1:goto 450 :   rem find right-side value < pivot
460 if i>j then 500:                   rem if indices cross, partitioning is done

470 rem swap ns(i) and ns(j)
480 t=ns(i):ns(i)=ns(j):ns(j)=t
490 i=i+1:j=j-1
500 if i<=j then 440: :                rem continue partitioning

510 rem *** push new partitions onto stack if needed ***
520 if f<j then p=p+1:sk(p)=f:p=p+1:sk(p)=j: rem left partition
530 f=i:if f<l then 420:               rem continue with right partition
540 if p<>0 then 390:                  rem continue if there are more partitions

550 rem print array
560 print "" : print ""
570 for i=0 to n
580   print ns(i);
590 next i
