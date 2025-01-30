100 rem quicksort routine
110 n=255:dim a(n),s(30)
120 rem generate random array
130 r = rnd(-150): rem setup seed for rnd
140 for i=0 to n
150   a(i)= int(rnd(1)*1000)
160 next i
170 rem print array
180 for i=0 to n
190   print a(i);
200 next i
210 s(1)=0:s(2)=n:p=2
220 l=s(p):p=p-1:f=s(p):p=p-1:i=f
230 j=l:d=a((f+l)/2)
240 if a(i)<d then i=i+1:goto 240
250 if a(j)>d then j=j-1:goto 250
260 if i>j then 290
270 t=a(i):a(i)=a(j):a(j)=t
280 i=i+1:j=j-1
290 if i<=j then 240
300 if f<j then p=p+1:s(p)=f:p=p+1:s(p)=j
310 f=i:if f<l then 230
320 if p<>0 then 220
330 rem print array
340 print "" : print ""
350 for i=0 to n
360   print a(i);
370 next i