
import pandas as pd


datacsv=pd.read_csv('C:/Users/MELKI/Desktop/pomona/pomona.csv',delimiter=';')

datacsv2 = datacsv[datacsv.isna().any(axis=1)]

data2=datacsv.dropna()

data2.shape
data3=data2.iloc[:,[1,2,3]].astype(float)

type(data3)
type(data3.iloc[1,1])

data3['f']=data3['a'] + data3['b'] + data3['c']

sum(data3['f'])

list(data3['f'])
