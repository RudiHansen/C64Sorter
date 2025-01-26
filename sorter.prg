+
 � *********************************** U � ** TEST SORTING ALGORITMS ON C64 **  � **                               ** �( � ** BY RUDI HANSEN 2025-01-23     ** �- � ** VERSION 02                    ** �2 � *********************************** B	< � HTTPS://BUILTIN.COM/MACHINE-LEARNING/FASTEST-SORTING-ALGORITHM �	= � N=100 BUBBLE 92 STEPS , 104 SEC, QSORT 129 STEPS, 24 SEC �	> � N=200 BUBBLE 178 STEPS , 417 SEC, QSORT 265 STEPS, 48 SEC �	? � N=400 BUBBLE 393, 1709 SEC, QSORT 86 SEC 2
@ � N=600 BUBBLE 567 STEPS , 3785 SEC, QSORT 831 STEPS, 165 SEC �
F � ************************************************************************* �
G � ** CHANGES V02 ** �
H � ** CHANGED THE SUB PRINT TEXT AT POS ON SCREEN RUTINE I � **     DID NOT WORK ON C128, SO MADE IT DIFFERENT. ]J � **     NOT REALLY HAPPY ABOUT THE SOLUTION, ITS SLOWER THAN THE OLD ONE �c � ************************************************************************* �d � �(147) �n PX�1: PY�5 : PT$ � "TEST SORTING ALGORIMS ON C64" : � 8000 ,x SE�150:                  � SET SEED FOR RANDOM i� N�100:                   � THE NUMBER OF NUMBERS TO SORT �� N2�(N�1.1):              � ARRAY SIZE FOR THE SK ARRAY, �� � NEEDS TO BE BIGGER THAN N �� � NS(N):               � THE ARRAY OF NUMBERS ,� � SK(N2):              � THE ARRAY USED IN QSORT ;� � GOTO 230 o� � 1000:              � GENERATE NUMBERS TO SORT �� � 2000:              � SORT USING BUBBLE SORT �� � 9000:              � PRINT SORTED ARRAY � � 1000:              � GENERATE NUMBERS TO SORT /� PX�9: PY�1: PT$ � "START QSORT": � 8000 <� W1�TIMER m� 4000:              � SORT USING QUICK SORT �PX�11: PY�1: PT$�"QSORT IN      "��((TIMER�W1)�100)�"SEC." : � 8000 �� 9000:              � PRINT SORTED ARRAY ��:                     � END PROGRAM /�� SUB GENERATE NUMBERS TO SORT l�PX�3: PY�1 : PT$ � "GENERATING NUMBERS TO SORT" : � 8000 ��R � �(�SE):           � SET SEED FOR RANDOM �� I � 1 � N �NS(I)��(�(1)�1000) �� I �$PX�4: PY�1 : PT$ � "GENERATION DONE" : � 8000 8� �� SUB BUBBLE SORT Z�PX�5: PY�1 : PT$ � "SORT NUMBERS USING BUBBLE SORT" : � 8000 ��PX�6: PY�1 : PT$ � "START SORT" : � 8000 ��S1�TIMER:               � INIT TIMER ��S2�0:                   � INIT STEP COUNTER �� ELSE : � SW=WHETHER THIS PASS HAS HAD ANY SWAPS 0: � START OF PASS @ :   S2�S2�1 q*:   PX�7: PY�1 : PT$ � "STEP"��(S2) : � 8000 �4:   PX�7: PY�20: PT$ � "FREE MEM"��(�(0)): � 8000 �H:   SW�0 �R:   � X�0 � N�2 �\:     � NS(X)��NS(X�1) � � 2220 �f:     � ELSE p:       � S=PLACEHOLDER VALUE 5z:       S�NS(X�1) O�:       NS(X�1)�NS(X) c�:       NS(X)�S u�:       SW��1 ��:     � ENDIF ��:   � ��: � SW � � 2070 ��PX�8: PY�1: PT$ � "BUBBLE SORT IN"��((TIMER�S1)�100)�"SEC." : � 8000 ��� �� QUICK SORT P�� COMMODORE BASIC DOES NOT REALLY SUPPORT RECURSION BECAUSE EVERYTHING ��� IS A GLOBAL VARIABLE. HOWEVER, RECURSION CAN BE SIMULATED WITH ��� A "STACK". THIS "STACK" IS JUST AN ARRAY, SK, AND A STACK INDEX, SP. ��� SOURCE: ��� �� INPUTS: $�� - NS CONTAINS ARRAY TO SORT E�� - N CONTAINS SIZE OF ARRAY m�� OUTPUTS: NS CONTAINS SORTED ARRAY xLO � 0 �HI � N � 1 �S3�0 �"� RECURSIVE PORTION OF ALGORITHM �,� INPUTS: �6� - A CONTAINS ARRAY TO SORT @� - LO CONTAINS LOW INDEX !J� - HI CONTAINS HIGH INDEX RT� OUTPUTS: A CONTAINS PARTIALLY SORTED ARRAY �^S3�S3�1: � SETUP STEP COUNTER AND PRINTS STATUS �hPX�10: PY�1 : PT$ � "STEP"��(S3) : � 8000 �rPX�10: PY�20: PT$ � "FREE MEM"��(�(0))�"     ": � 8000 |� LO �� HI � LO � 0 � � @�� 4370: � PARITION ARRAY AND GET PIVOT INDEX (P) h�SP � SP � 1: SK(SP) � LO: � PUSH LO ��SP � SP � 1: SK(SP) � HI: � PUSH HI ��SP � SP � 1: SK(SP) � P: � PUSH P ��HI � P � 1: � 4130: � SORT LEFT SIDE OF PARTITION �P � SK(SP): SP � SP � 1: � POP P 8�HI � SK(SP): SP � SP � 1: � POP HI `�SP � SP � 1: SK(SP) � HI: � PUSH HI ��SP � SP � 1: SK(SP) � P: � PUSH P ��LO � P � 1: � 4130: � SORT RIGHT SIDE OF PARTITION ��SP � SP � 1: � POP P (DON'T STORE) �HI � SK(SP): SP � SP � 1: � POP HI 2�LO � SK(SP): SP � SP � 1: � POP LO 8� N� PARTITION ARRAY \� INPUTS: �&� - NS CONTAINS ARRAY TO PARTITION �0� - LO CONTAINS LOW INDEX �:� - HI CONTAINS HIGH INDEX �D� OUTPUTS: �N� - A CONTAINS PARTITIONED ARRAY X� - P CONTAINS PIVOT INDEX AbPV � NS(HI): � CHOOSE LAST VALUE AS PIVOT hlP � LO � 1: � SET TEMP PIVOT INDEX �v� SWAP ELEMENTS LESS THAN OR EQUAL TO PIVOT, AND INCREMENT TEMP INDEX ��� J � LO � HI � 1 ��� NS(J) � PV � � 4540 ��P � P � 1 ��T � NS(J) �NS(J) � NS(P) �NS(P) � T &�� J K�� MOVE PIVOT TO CORRECT POSITION Y�P � P � 1 h�T � NS(HI) {�NS(HI) � NS(P) ��NS(P) � T ��� �@� SUB PRINT TEXT AT POS ON SCREEN, USES PX,PY,PT$ J� PX = X POS ON SCREEN, PY= POS ON SCREEN, PT$ = TEXT TO PRINT 9T�781,PX : �782,PY : � 65520 : � PT$; : � C64 {^� POKE214,PX : POKE215,PY : SYS 58684 : PRINT PT$; : REM C128 �h� �4!� SUB PRINTS MAIN SCREEN �>!� �(147) �H!� "�cccccccccccccccccccccccccccccccccccccc�"; R!� "}    TEST SORTING ALGORITMS ON C65     }"; B\!� "}                                      }"; tf!� "}  PROCESS:               FREE MEM:    }"; �p!� "}  STEPS  :                            }"; �z!� "}                                      }"; 
�!� "}  RESULT :                            }"; <�!� "}                                      }"; n�!� "�cccccccccccccccccccccccccccccccccccccc�"; ��!� "}                                      }"; ��!� "}                                      }"; �!� "}                                      }"; 6�!� "}                                      }"; h�!� "}                                      }"; ��!� "}                                      }"; ��!� "}                                      }"; ��!� "}                                      }"; 0�!� "}                                      }"; b�!� "}                                      }"; �"� "}                                      }"; �"� "}                                      }"; �"� "}                                      }"; * $"� "}                                      }"; \ ."� "}                                      }"; � 8"� "�cccccccccccccccccccccccccccccccccccccc"; � B"� 2023,125 � L"� PROCESS AT 3,12 � V"� STEPS AS 4,12 � `"� RESULT AT 6,12 � j"� MEM AT 4,26 !t"� FREE LINES FOR OTHER FROM 9-23 (!(#� SUB PRINT ARRAY .!-#� >!2#� I�0 � N�1 K!<#� NS(I); �!F#� (I � 1 � �((I � 1) � 7) � 7) � 0 � �: � PRINT A NEW LINE IF I MOD 7 �!P#� �!Z#� �!d#�   