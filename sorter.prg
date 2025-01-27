+
 � *********************************** U � ** TEST SORTING ALGORITMS ON C64 **  � **                               ** �( � ** BY RUDI HANSEN 2025-01-23     ** �- � ** VERSION 02                    ** �2 � *********************************** B	< � HTTPS://BUILTIN.COM/MACHINE-LEARNING/FASTEST-SORTING-ALGORITHM �	= � N=100 BUBBLE 92 STEPS , 104 SEC, QSORT 129 STEPS, 24 SEC �	> � N=200 BUBBLE 178 STEPS , 417 SEC, QSORT 265 STEPS, 48 SEC �	? � N=400 BUBBLE 393, 1709 SEC, QSORT 86 SEC 2
@ � N=600 BUBBLE 567 STEPS , 3785 SEC, QSORT 831 STEPS, 165 SEC �
F � ************************************************************************* �
G � ** CHANGES V02 ** �
H � ** CHANGED THE SUB PRINT TEXT AT POS ON SCREEN I � **     ADDED A NEW LINE FOR THE SYS CALLS ON C128 EJ � **     SO REMEMBER TO REM OUT THE RIGHT LINE BEFORE USE �c � ************************************************************************* �d � �(147) �n PX�1: PY�5 : PT$ � "TEST SORTING ALGORIMS ON C64" : � 8000 x SE�150:                  � SET SEED FOR RANDOM Q� N�100:                   � THE NUMBER OF NUMBERS TO SORT �� N2�(N�1.2):              � ARRAY SIZE FOR THE SK ARRAY, �� � NEEDS TO BE BIGGER THAN N �� � NS(N):               � THE ARRAY OF NUMBERS � � SK(N2):              � THE ARRAY USED IN QSORT C� � R1$(3) :             � ARRAY FOR RESULTS ~� � PA$(N):              � ARRAY USED IN SUB PRINT ARRAY �� � 8500:              � PRINT MAIN SCREEN �� � 1000:              � GENERATE NUMBERS TO SORT � � 2000:              � SORT USING BUBBLE SORT ?� � 9000:              � PRINT SORTED ARRAY q� � 8900:              � SUB CLEAN MAIN SCREEN. �� � 1000:              � GENERATE NUMBERS TO SORT �� 4000:              � SORT USING QUICK SORT PX�6:PY�12:PT$��((TIMER�S1)�100)�"SEC.      ":� 8000 FR1$(1) � "QSORT IN"��((TIMER�S1)�100)�"SEC.      " Z � 8400: � SLEEP �"� 9000:              � PRINT SORTED ARRAY �$� 8900:              � SUB CLEAN MAIN SCREEN. �'� �(147) �,� R1$(0) �6� R1$(1) 
��:                     � END PROGRAM -�� SUB GENERATE NUMBERS TO SORT ^�PX�3: PY�12 : PT$ � "GEN NUM      " : � 8000 ��R � �(�SE):           � SET SEED FOR RANDOM �� I � 1 � N �NS(I)��(�(1)�1000) �� I �$PX�3: PY�12 : PT$ � "DONE         " : � 8000 �8� 
�� SUB BUBBLE SORT 9�PX�3: PY�12 : PT$ � "BUBBLE SORT" : � 8000 b�S1�TIMER:               � INIT TIMER ��S2�0:                   � INIT STEP COUNTER �� ELSE �: � SW=WHETHER THIS PASS HAS HAD ANY SWAPS �: � START OF PASS � :   S2�S2�1 #*:   PX�4: PY�12 : PT$ � �(S2)�"   " : � 8000 V4:   PX�4: PY�26: PT$ � �(�(0))�"     ": � 8000 cH:   SW�0 wR:   � X�0 � N�2 �\:     � NS(X)��NS(X�1) � � 2220 �f:     � ELSE �p:       � S=PLACEHOLDER VALUE �z:       S�NS(X�1) ��:       NS(X�1)�NS(X) �:       NS(X)�S $�:       SW��1 6�:     � ENDIF @�:   � T�: � SW � � 2070 ��PX�6: PY�12: PT$ � �((TIMER�S1)�100)�"SEC.    " : � 8000 ��R1$(0) � "BUBBLE SORT IN"��((TIMER�S1)�100)�"SEC." ��� 8400: � SLEEP ��� ��� QUICK SORT >�� COMMODORE BASIC DOES NOT REALLY SUPPORT RECURSION BECAUSE EVERYTHING ��� IS A GLOBAL VARIABLE. HOWEVER, RECURSION CAN BE SIMULATED WITH ��� A "STACK". THIS "STACK" IS JUST AN ARRAY, SK, AND A STACK INDEX, SP. ��� SOURCE: ��� ��� INPUTS: �� - NS CONTAINS ARRAY TO SORT 3�� - N CONTAINS SIZE OF ARRAY [�� OUTPUTS: NS CONTAINS SORTED ARRAY fLO � 0 uHI � N � 1 ~S3�0 �PX�3: PY�12: PT$ � "QSORT         ": � 8000 � S1�TIMER �"� RECURSIVE PORTION OF ALGORITHM �,� INPUTS: 6� - A CONTAINS ARRAY TO SORT -@� - LO CONTAINS LOW INDEX LJ� - HI CONTAINS HIGH INDEX }T� OUTPUTS: A CONTAINS PARTIALLY SORTED ARRAY �^S3�S3�1: � SETUP STEP COUNTER AND PRINTS STATUS �hPX�4: PY�12 : PT$ � �(S3)�"     " : � 8000 rPX�4: PY�26: PT$ � �(�(0))�"     ": � 8000 +|� LO �� HI � LO � 0 � � `�� 4370: � PARITION ARRAY AND GET PIVOT INDEX (P) ��SP � SP � 1: SK(SP) � LO: � PUSH LO ��SP � SP � 1: SK(SP) � HI: � PUSH HI ��SP � SP � 1: SK(SP) � P: � PUSH P �HI � P � 1: � 4130: � SORT LEFT SIDE OF PARTITION 1�P � SK(SP): SP � SP � 1: � POP P X�HI � SK(SP): SP � SP � 1: � POP HI ��SP � SP � 1: SK(SP) � HI: � PUSH HI ��SP � SP � 1: SK(SP) � P: � PUSH P ��LO � P � 1: � 4130: � SORT RIGHT SIDE OF PARTITION �SP � SP � 1: � POP P (DON'T STORE) +�HI � SK(SP): SP � SP � 1: � POP HI R�LO � SK(SP): SP � SP � 1: � POP LO X� n� PARTITION ARRAY |� INPUTS: �&� - NS CONTAINS ARRAY TO PARTITION �0� - LO CONTAINS LOW INDEX �:� - HI CONTAINS HIGH INDEX �D� OUTPUTS: N� - A CONTAINS PARTITIONED ARRAY 3X� - P CONTAINS PIVOT INDEX abPV � NS(HI): � CHOOSE LAST VALUE AS PIVOT �lP � LO � 1: � SET TEMP PIVOT INDEX �v� SWAP ELEMENTS LESS THAN OR EQUAL TO PIVOT, AND INCREMENT TEMP INDEX ��� J � LO � HI � 1 �� NS(J) � PV � � 4540 �P � P � 1 �T � NS(J) 0�NS(J) � NS(P) >�NS(P) � T F�� J k�� MOVE PIVOT TO CORRECT POSITION y�P � P � 1 ��T � NS(HI) ��NS(HI) � NS(P) ��NS(P) � T � � �@� SUB PRINT TEXT AT POS ON SCREEN, USES PX,PY,PT$ (J� PX = X POS ON SCREEN, PY= POS ON SCREEN, PT$ = TEXT TO PRINT �L� �(PT$,1,1)�"-" � PT$ � " " � �(PT$, 2) : � 8021: � IF FIRST CHAR IS - REPLACE WITH SPACE AND DO NOT REMOVE SPACE FROM STRING �O� J � 1 � �(PT$) : � LOOP TO FIND SPACE �R� �(PT$, J, 1) �� " " � � 8020 S� J 'TPT$ � �(PT$, J): � REMOVE SPACES XU�781,PX : �782,PY : � 65520 : � PT$; : � C64 �^� 65520, 0, PX, PY: PRINT PT$ : REM C128 �h� �� � SUB SLEEP �� � T � 1 � 1000: � T : � SLEEP �� � �4!� SUB PRINTS MAIN SCREEN �>!� �(147)  H!� "�cccccccccccccccccccccccccccccccccccccc�"; RR!� "}    TEST SORTING ALGORITMS ON C65     }"; �\!� "}                                      }"; �f!� "}  PROCESS:               FREE MEM:    }"; �p!� "}  STEPS  :                            }"; z!� "}                                      }"; L�!� "}  RESULT :                            }"; ~�!� "}                                      }"; ��!� "�cccccccccccccccccccccccccccccccccccccc�"; ��!� "}                                      }";  �!� "}                                      }"; F �!� "}                                      }"; x �!� "}                                      }"; � �!� "}                                      }"; � �!� "}                                      }"; !�!� "}                                      }"; @!�!� "}                                      }"; r!�!� "}                                      }"; �!�!� "}                                      }"; �!"� "}                                      }"; ""� "}                                      }"; :""� "}                                      }"; l"$"� "}                                      }"; �"."� "}                                      }"; �"8"� "�cccccccccccccccccccccccccccccccccccccc"; �"B"� 2023,125 �"L"� PROCESS AT 3,12 #V"� STEPS AS 4,12 #`"� RESULT AT 6,12 /#j"� MEM AT 4,26 T#t"� FREE LINES FOR OTHER FROM 9-23 Z#~"� w#�"� SUB CLEAN MAIN SCREEN. �#�"PX�3: PY�12: PT$ � "-             ":                        � 8000 $�"PX�4: PY�12: PT$ � "-             ":                        � 8000 L$�"PX�6: PY�12: PT$ � "-             ":                        � 8000 �$�"PX�4: PY�26: PT$ � "-           ":                          � 8000 �$�"� PX�9 � 23 �$�"PY�1:      PT$ � "-                                    ": � 8000 �$ #� PX �$
#� %(#� SUB PRINT ARRAY %%2#� ** INIT VARIABLES `%<#L1 � �(�(NS(N)))�1: � GET LEN OF LAST ELEMENT IN INDEX �%F#L2 � �(39�L1):         � GET NUM OF ELEMENTS IN OUTPUT LINE �%P#L3 � �(N�L2)�1:        � NUM OF RECORDS IN OUTPUT ARRAY &d#PC�0:                    � INIT OUTPUT ARRAY COUNTER D&i#PX�3: PY�12: PT$ � "PRINT        ": � 8000 J&n#� �&x#� ** LOOP ALL ELEMENTS AND CREATE STRINGS FOR OUTPUT IN PA$ �&}#PA$(PC) � "" �&�#� I�0 � N�1:                                  � LOOP ALL ELEMENTS )'�#L1$ � �(NS(I)):                             � GET LENGTH OF ELEMENT `'�#�(�(L1$)�L1) � L1$�L1$�" " : � 9110:  � ADD SPACES �'�#PA$(PC) � PA$(PC) � L1$:                       � ALL ELEMENT TO OUTPUT 
(�#�(I�1��((I�1)�L2)�L2)�0 � PC�PC�1:PA$(PC) � "":� IF MOD NUM OF ELEMENTS, ADD ARRAY COUNTER (�#� I (�#� 8(�#� ** OUTPUT PA$() TO SCREEN V(�#� ** PRINT TO LINES 10-20 �(�#� ** LINE 22 CAN CONTAIN INSTRUCTIONS TO USER �(�#PX�22: PY�3 : PT$ � "PRESS ANY KEY TO CONTINUE" : � 8000 �(�#PX�10: PY�1:      � SETUP WHERE TO PRINT TEXT )�#� I�0 � PC  )$PT$ � PA$(I) : � 8000 0)$PX � PX � 1 L)$� PX�20 � PX�10:� 10000 T)"$� I e)6$� PX�PX � 20 �);$PT$ � "-                                     " �)@$� 8000 �)J$� PX �)T$� 10000: � WAIT FOR KEYPRESS 
*^$PX�22: PY�3 : PT$ � "-                        " : � 8000 *h$� /*'� SIMPLE GET-INPUT-ROUTINE S*'A$�"": : � INITIALIZE VARIABLES m*$'� A$: � A$�"" � 10020 s*.'�   