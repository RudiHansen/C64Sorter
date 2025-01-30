100 rem quicksort routine
110 n=255:dim a(n),s(30)
120 s(1)=0:s(2)=n:p=2
130 l=s(p):p=p-1:f=s(p):p=p-1:i=f
140 j=l:d=a((f+l)/2)
150 if a(i)<d then i=i+1:goto 150
160 if a(j)>d then j=j-1:goto 160
170 if i>j then 200
180 t=a(i):a(i)=a(j):a(j)=t
190 i=i+1:j=j-1
200 if i<=j then 150
210 if f<j then p=p+1:s(p)=f:p=p+1:s(p)=j
220 f=i:if f<l then 140
230 if p<>0 then 130
240 end
