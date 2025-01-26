0 rem this program displays the pixels of the current characterset
10 dim bytes(7) : px$ = "{reverse on}{black}{207}" : sp$="{reverse on}{light blue}{207}"
20 print"{clear}{white}enter screen code: ";
22 rem 
25 rem the following poke turns off the ? after input: 
30 poke 19,32 : input c : print chr$(13)
32 rem  
35 rem source address for character data
40 addr=53248+c*8
45 rem
48 rem turn off keyboard and IO temporarily
50 poke 56334,peek(56334)and254 
60 poke1,peek(1)and251 
65 rem
68 rem grab the character data for the chosen char (c)
70 for row = 0 to 7 : bytes(row) = peek ( addr+row) : next row
75 rem
78 rem turn keyboard and IO back on
80 poke1, peek(1) or 4 
90 poke 56334, peek(56334) or 1
92 rem
94 rem now lets print out the data
95 print : print tab(15); 
98 rem
99 rem 8 rows of 8 pixel bits ...
100 for row = 0 to 7 : for p = 7 to 0 step-1 
105 rem
108 rem if row and 2 to the power of pixel is a 1 
110 if (bytes(row) and 2^p) then print px$; : goto 130 
120 print sp$; 
130 next p : print : print tab(15); : next row 
140 print chr$(13)tab(7)"{reverse on}{light blue} press a key to continue {reverse off}{light blue}"
150 poke 198,0
160 wait 198,1
170 get a$
180 goto20