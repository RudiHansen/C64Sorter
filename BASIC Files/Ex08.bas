0 gosub 10010
5 rem this program loads an entire font and customises it
10 print "{clear}{white}custom font demo{light blue}"
20 rem
30 rem :-------------------------------------------------------
40 rem : first section copies default c64 characterset from rom
50 rem :-------------------------------------------------------
100 rem turn off keyboard
110 poke 56334,peek(56334)and254
115 rem turn off i/o and screen
120 poke 1,peek(1)and251
122 rem goto 250
125 rem counter to increment character
130 for ch=0to255
135 rem if printable character:
140 if (ch > 32 and ch < 128) or (ch > 160 and ch < 191) then poke1064,ch
145 rem copy 8 bytes each
150 for byte=0to7
160 rem copy current byte
170 poke 12288+ch*8+byte,peek(53248+ch*8+byte)
180 rem get next byte from rom
190 next byte
200 rem get next character
210 next ch
220 goto 260
240 rem alternate way to copy the data all in one line
250 for i = 0 to 4095: poke 12288 + i, peek (53248+i) :nexti
260 rem turn i/o and keyboard back on
270 poke 1,peek(1)or4:poke 56334,peek(56334)or1
280 rem
1000 rem
1010 rem :-------------------------------------------------------
1020 rem : this is where we redefine our custom characters
1030 rem : each character has a data row consisting of 8 bytes
1040 rem :-------------------------------------------------------
1050 rem
1070 rem set characterset pointer to address 12288
1080 poke 53272,(peek(53272)and240)+12
1090 rem
1100 rem first we do our player character, char 0
1110 ch = 0
1120 for byte = 0 to 7  
1130 read cd
1140 poke 12288+byte,cd
1150 next byte
1500 rem
1510 rem iterate over characters 60-64
1520 for ch=60to64: 
1525 if ch=63 then next
1530 for byte=0to7: rem 8 bytes per chacter
1540 rem
1550 rem read next byte of character data (cd)
1560 rem then save the data to the character memory
1570 read cd 
1580 poke 12288+(8*ch)+byte,cd
1590 rem
1600 rem iterate to next byte
1610 next byte
1620 rem do next character
1630 next ch
1640 rem

2000 rem
2010 rem :-------------------------------------------------------
2020 rem : now we have our custom characters re-defined
2030 rem : we get to use them as if they were the standard ones
2040 rem :-------------------------------------------------------
2060 rem
2070 rem 
2080 dim row$( 12)
2085 row$(0) = "                    "
2090 row$(1) = "          {dark gray}======="
2100 row$(2) = "          =========="
2110 row$(3) = "          =       <="
2120 row$(4) = "          {brown}{192}      {dark gray}  {brown}{192}"
2130 row$(5) = "          {dark gray}=        ="
2140 row$(6) = "          =   {white}@    {dark gray}="
2150 row$(7) = "          =        ="
2160 row$(8) = "          =     =  ="
2170 row$(9) = "          =     =  ="
2180 row$(10) = "          = >   =  ="
2190 row$(11) = "          ========{brown}{192}{dark gray}="
2195 rem
2200 rem print the test map
2210 for r=0 to 11:?row$(r):next
3000 rem
3010 rem :-------------------------------------------------------
3020 rem : finally we need to put things back to normal
3030 rem : either that or the user will have to reboot
3040 rem :-------------------------------------------------------
3050 print "{cyan}{down}{down}{down}{down}{down}press a key to quit"
3060 rem wait for a keypress
3070 get a$: if a$=""then 3070
3080 print "{clear}{light blue}"
3090 poke 53272,21: rem restore default characterset
3100 rem
4000 rem
4010 rem :-------------------------------------------------------
4020 rem : this is where we store our character data
4030 rem : each character has a data row consisting of 8 bytes
4040 rem :-------------------------------------------------------
5000 data 092,087,233,089,057,030,020,054 : rem character 0
5010 data 000,126,000,060,000,024,000,000 : rem character 60
5020 data 239,138,012,000,254,170,128,000 : rem character 61
5030 data 000,000,024,000,060,000,126,000 : rem character 62
5040 data 000,060,126,254,122,126,254,126 : rem character 64
6000 rem
6010 rem :-------------------------------------------------------
6020 end
6030
10000 rem :
10010 rem :-------------------------------------------------------
10020 rem : set background colours 
10030 poke 53280,0 : poke 53281, 0
10040 return
10050 rem