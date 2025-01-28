10 n = 1000:    rem iterations to run
20 print "start testing"

100 s1 = timer:  rem init timer
110 for i = 0 to n
120 gosub 10000
130 next i
140 print "fre(0)";str$(n);" times took";str$((timer-s1)/100);" sec."
150 print fr

200 s1 = timer:  rem reset timer
210 for i = 0 to n
220 gosub 20000
230 next i
240 print "peek";str$(n);" times took";str$((timer-s1)/100);" sec."
250 print fr

300 s1 = timer:  rem reset timer
310 for i = 0 to n
320 gosub 30000
330 next i
340 print "nothing";str$(n);" times took";str$((timer-s1)/100);" sec."
350 print fr

999 end


10000 rem sub get free mem using fre(0)
10010 fr = fre(0)
10020 return

20000 rem sub get free mem using peek
20010 m1 = peek(52)+peek(53)*256
20020 m2 = peek(55)+peek(56)*256
20030 fr = m1-m2
20040 return

30000 rem sub that does nothing
30010 return