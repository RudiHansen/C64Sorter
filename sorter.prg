>4!N�100:                   � THE NUMBER OF NUMBERS TO SORT o�!� NS(N):              � THE ARRAY OF NUMBERS ��!R � �(�SE):           � SET SEED FOR RANDOM ��!� I � 1 � N ��!NS(I)��(�(1)�1000) ��!� I �H&� SUB PRINT ARRAY 	�&L1 � �(�(NS(N)))�1: � GET LEN OF LAST ELEMENT IN INDEX _	'L2 � �(39�L1):         � GET NUM OF ELEMENTS IN OUTPUT LINE �	t'L3 � �(N�L2)�1:        � NUM OF RECORDS IN OUTPUT ARRAY �	�'� PA$(L3):             � DIM OUTPUT ARRAY 
<(PC�0:                    � INIT OUTPUT ARRAY COUNTER 
�(� L1 
)� L2 
)� L3 c
h)� I�0 � N�1:                                  � LOOP ALL ELEMENTS �
�)L1$ � �(NS(I)):                             � GET LENGTH OF ELEMENT �
0*�(�(L1$)�L1) � L1$�L1$�" " : � 10800:  � ADD SPACES .�*PA$(PC) � PA$(PC) � L1$:                       � ALL ELEMENT TO OUTPUT ��*�(I�1��((I�1)�L2)�L2)�0 � PC�PC�1:       � IF MOD NUM OF ELEMENTS, ADD ARRAY COUNTER �\+� I ��+� I�0 � PC �$,� PA$(I) ��,� I   