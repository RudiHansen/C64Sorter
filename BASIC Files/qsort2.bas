100 rem quicksort routine
110 n=255:dim a(n),s(30):          rem Define array (a) and stack (s)

120 rem generate random array
130 r = rnd(-150): rem setup seed for rnd
140 for i=0 to n
150   a(i)= int(rnd(1)*1000)
160 next i
170 rem print array
180 for i=0 to n
190   print a(i);
200 next i
205 print ""

210 rem *** initialize stack for iterative quicksort ***
220 s(1)=0:s(2)=n:p=2:                rem start with full range on stack

230 rem *** sorting loop ***
240 l=s(p):p=p-1:                     rem pop high index (l)
250 f=s(p):p=p-1:                     rem pop low index (f)
260 i=f
270 j=l:d=a((f+l)/2):                 rem choose pivot (middle value)  

275 rem *** partitioning step ***  
280 if a(i)<d then i=i+1:goto 280 :   rem find left-side value > pivot  
290 if a(j)>d then j=j-1:goto 290 :   rem find right-side value < pivot  
300 if i>j then 330:                  rem if indices cross, partitioning is done  

305 rem swap a(i) and a(j)  
310 t=a(i):a(i)=a(j):a(j)=t
320 i=i+1:j=j-1
330 if i<=j then 280: :               rem continue partitioning 

335 rem *** push new partitions onto stack if needed ***   
340 if f<j then p=p+1:s(p)=f:p=p+1:s(p)=j: rem left partition
350 f=i:if f<l then 270:              rem continue with right partition  
360 if p<>0 then 240:                 rem continue if there are more partitions  

370 rem print array
380 print "" : print ""
390 for i=0 to n
400   print a(i);
410 next i