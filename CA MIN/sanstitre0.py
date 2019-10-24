# -*- coding: utf-8 -*-
"""
Created on Wed Jun  5 17:35:21 2019

@author: MELKI
"""

import pandas as pd
import numpy as np

datacsv=pd.read_csv('C:/Users/MELKI/Desktop/pomona/pomona.csv',delimiter=';')

data2=datacsv.dropna()

data2.shape
data3=data2.iloc[:,[1,2,3]].astype(float)

type(data3)
type(data3.iloc[1,1])

data3['f']=data3['a'] + data3['b'] + data3['c']

sum(data3['f'])