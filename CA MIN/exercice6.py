# -*- coding: utf-8 -*-
"""
Created on Wed May 22 10:44:00 2019

@author: MELKI
"""

import pandas as pd
import numpy as np

ser1 = pd.Series([1, 2, 3, 4, 5]) 

ser2 = pd.Series([4, 5, 6, 7, 8, 9, 11])

#ser3=np.setdiff1d(ser1,ser2)

ser3=ser1[~ser1.isin(ser2)]


print(ser3)