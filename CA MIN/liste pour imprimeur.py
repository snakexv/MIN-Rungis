import pandas as pd
import numpy as np

liste2=pd.read_csv('C:/Users/MELKI/Desktop/python/liste pour imprimeur - V2.csv',delimiter=';',index_col='Code Client')
liste3=pd.read_csv('C:/Users/MELKI/Desktop/python/liste pour imprimeur - V3.csv',delimiter=';',index_col='Code Client')

index_liste2=liste2.index
index_liste3=liste3.index
type(index_liste2)



ser1=pd.Series(list(index_liste2))
ser2=pd.Series(list(index_liste3))

ser3=ser1[~ser1.isin(ser2)]


print(ser3)
len(ser3.values)

index_fin =ser3.values

liste4=liste2.loc[index_fin]

export_liste = liste4.to_excel (r'C:\Users\MELKI\Desktop\python\liste4.xlsx', header=True)
