5 print "generate array"
10 dim n$(200):mx=200:forx=ltomx 
20 l=int(rnd(1)*5+2) 
30 for p=l to l:cd=64+int(rnd(1)*26+1) 
40 n$(x)=n$(x)+chr$(cd) 
50 next p: next x 
55 print "done creating array"
56 t1=timer
58 print "start sort"
60 gosub 60000

100 print "sorted in"+str$((timer-t1)/100)+"sec."
105 for x=l to mx:printn$(x);" ";:next 
200 stop 

60000 nt=2 
60005 nt=2*nt 
60010 if nt<mx/2 then 60005 
60020 for jl=l to mx-nt 
60030 for j2=jl to 1 step -nt 
60040 if n$(j2)>n$(j2+nt)then 60080 
60050 next jl:nt=int(nt/2) 
60060 if nt>0 then 60020 
60070 return 
60080 t$=n$(j2):n$(j2)=n$(j2+nt):n$(j2+nt)=t$ 
60090 next j2:goto 60050
