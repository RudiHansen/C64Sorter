30000 rem simple get-input-routine
30010 a$="": b$="": a=0: rem initialize variables
30020 get a$: if a$="" then 30020
30030 a=asc(a$): if (a<32 or a>127) and a<>13 then 30020
30040 b$=b$+a$: print a$;: if len(b$)<20 and a$<>chr$(13) then 30020
30050 return