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
4240 t=ns(i):ns(i)=ns(j):ns(j)=t
4250 i=i+1:j=j-1
4260 if i<=j then 4200: :                rem continue partitioning

4270 rem *** push new partitions onto stack if needed ***
4280 if f<j then p=p+1:sk(p)=f:p=p+1:sk(p)=j: rem left partition
4290 f=i:if f<l then 4180:               rem continue with right partition
4300 if p<>0 then 4150:                  rem continue if there are more partitions
