100 gosub 150:rem set up array
110 gosub 230:rem sort array
120 gosub 420:rem print array
130 end
140 :
150 rem set up array
155 print "set up array"
158 s1 = timer
160 rem l=length of array
170 l=100
180 dim ar(l)
190 for i=0 to l-1:read ar(i):next
200 data 34, 116, 987, 828, 250, 571, 675, 354, 627, 416, 801, 289, 582, 201, 400, 608, 338
201 data 816, 518, 646, 724, 989, 176, 341, 415, 282, 18, 156, 183, 643, 288, 28, 56, 703
202 data 614, 90, 665, 168, 681, 160, 46, 102, 409, 711, 449, 670, 121, 468, 93, 765, 749
203 data 834, 500, 439, 833, 96, 510, 170, 52, 928, 837, 423, 594, 797, 623, 211, 218, 932
204 data 75, 274, 178, 547, 939, 728, 233, 984, 640, 309, 27, 969, 941, 565, 123, 812, 115
205 data 756, 308, 402, 871, 767, 326, 321, 129, 172, 240, 741, 676, 977, 181, 105
208 print "done in ";timer-s1
210 return
220 :
230 rem sort array
235 print "sort array - start ";timer
238 s1=timer
240 if l<2 then return
250 rem else
260 : rem sw=whether this pass has had any swaps
270 : rem start of pass
275 :   print "step at "timer;"took ";(timer-s1)/100
280 :   sw=0
290 :   for x=0 to l-2
300 :     if ar(x)<=ar(x+1) then goto 380
310 :     rem else
320 :       rem s=placeholder value
330 :       s=ar(x+1)
340 :       ar(x+1)=ar(x)
350 :       ar(x)=s
360 :       sw=-1
370 :     rem endif
380 :   next
390 : if sw then goto 270
395 print "done at "timer;"took ";(timer-s1)/100
400 return
410 :
420 rem print array
430 if l=0 then print "(empty array)":return
440 rem else
450 : for i=0 to l-1:print ar(i);:next
460 : print
470 return