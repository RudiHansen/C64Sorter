10 a=49152:for b=0 to 24: read c:poke a+b,c
20 data 165,45,141,00,193,165,46,141,01,193,96

110 rem run machin code
120 sys 49152
130 rem print the result
140 print "free memory:"
150 print peek(49408) + peek(49409) * 256
160 end