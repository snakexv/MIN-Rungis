# -*- coding: utf-8 -*-
"""
Created on Thu Oct 17 14:44:23 2019

@author: MELKI
"""

import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

#←n = int(input())
ListeTemp=[]# the number of temperatures to analyse
for i in "1 3 6 -8 +12 -1 -17".split(" "):
    # t: a temperature expressed as an integer ranging from -273 to 5526
    t = int(i)
    ListeTemp.append(t)
    ListAbs=[abs(j) for j in ListeTemp]
    IndexMini = ListAbs.index(min(ListAbs))
    result = ListeTemp[IndexMini]
    
if result <0:
    for p in ListeTemp:
        if (ListeTemp[IndexMini]==-p):
            MaxMin=ListeTemp.index(p)
            result = ListeTemp[MaxMin]



print(result)

