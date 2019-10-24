# -*- coding: utf-8 -*-
"""
Created on Fri May 24 11:27:56 2019

@author: MELKI
"""

import numpy as np
import pandas as pd

produits = pd.read_csv('C:/Users/MELKI/Desktop/python/produits.csv')

produits['espaces']=produits['Libelle_final'].str.count(' ')
indexpdt1=produits.index[produits['espaces']==0]

produitseul=produits.loc[indexpdt1]

produitunique=produitseul.drop_duplicates()


#[ PARTIE DES PLURIELS EN X]


produitunique['find_pluriel']=produitunique['Libelle_final'].str[-1]
indexpdtu1=produitunique.index[produitunique['Libelle_final'].str[-1]=='s']

pdtens = produitunique.loc[indexpdtu1]

ejecter = ['Cactus','Boutis','Légumes','Physalis','Pallis','Œufs','Œillets','Mais','Lysanthius','Lys','Lis','Lilas','Jus','Iris','Hibiscus','Helianthus','Gambas','Eucalyptus','Engrais','Divers','Cyclamens','Buis','Baies']
leject=[56,18,10,1971,1864,758,1668,1516,1463,1497,1462,1449,1306,1281,1209,1197,1045,727,657,576,485,43,1375]

list(pdtens['Libelle_final'])

sejecter=pd.Series(ejecter,index=leject)
sejecter.columns='Dej'
sejecter.name='Tej'

pdtss=pd.merge(pdtens,sejecter,left_index=True,right_index=True,how='left')
indexss=pdtss.index[pdtss['Tej'].isna()==True]

pdtz=pdtss.loc[indexss]
pdtz['sing']=pdtz['Libelle_final']
pdtz['sing']=pdtz['sing'].str[:-1]


#[ PARTIE DES PLURIELS EN X]


indexpdtx1=produitunique.index[produitunique['Libelle_final'].str[-1]=='x']

pdtenx = produitunique.loc[indexpdtx1]

xejecter = ['Spiritueux','Houx','Végétaux','Noix']
xleject=[231,1232,1645,1761]


xsejecter=pd.Series(xejecter,index=xleject)
xsejecter.columns='Dej'
xsejecter.name='Tej'

pdtxx=pd.merge(pdtenx,xsejecter,left_index=True,right_index=True,how='left')
indexxx=pdtxx.index[pdtxx['Tej'].isna()==True]

pdty=pdtxx.loc[indexxx]
pdty['sing']=pdty['Libelle_final']
pdty['sing']=pdty['sing'].str[:-1]


# PARTIE DES PLURIELS POURS LES COMPOSEES en 2

indexpdt2=produits.index[produits['espaces']==1]

produitseul2=produits.loc[indexpdt2]

produitunique2=produitseul2.drop_duplicates()

find_pluriel=pd.Series(produitunique2['Libelle_final'],index=produitunique2.index)
find_pluriel.name="find_pluriel"

s2=find_pluriel.str.split(n=1,expand=True)
s2.columns=['part1','part2']
s2s=pd.merge(s2,produitunique2,left_index=True,right_index=True,how='left')

s2s['find_pluriel1']=s2s['part1'].str[-1]
s2s['find_pluriel2']=s2s['part2'].str[-1]
inds21=s2s.index[s2s['part1'].str[-1]=='s']

pds = s2s.loc[inds21]
inds22=pds.index[pds['part2'].str[-1]=='s']
pds2= pds.loc[inds22]

pds2['sing1']=pds2['part1']
pds2['sing1']=pds2['sing1'].str[:-1]

pds2['sing2']=pds2['part2']
pds2['sing2']=pds2['sing2'].str[:-1]

inds23=pds.index[pds['part2'].str[-1]!='s']
pds3=pds = pds.loc[inds23]

pds3['sing1']=pds3['part1']
pds3['sing1']=pds3['sing1'].str[:-1]

pds3['sing2']=pds3['part2']

# PARTIE DES PLURIELS POURS LES COMPOSEES +++

indexpdt3=produits.index[produits['espaces']>1]
produitseul3=produits.loc[indexpdt3]
produitunique3=produitseul3.drop_duplicates()

# Concaténation et fusion

pdt=pd.concat([pdtz,pdty],axis=0)
pds4=pd.concat([pds2,pds3],axis=0)

final=pd.merge(produitunique,produitunique3,left_index=True,right_index=True,how='left')
final2=pd.merge(pdt,pds4,left_index=True,right_index=True,how='left')
final3=pd.merge(final,final2,left_index=True,right_index=True,how='left')

export_excel = produitunique3.to_excel (r'C:\Users\MELKI\Desktop\python\finalp1.xlsx', index = None, header=True) #Don't forget to add '.xlsx' at the end of the path
export_excel = pdt.to_excel (r'C:\Users\MELKI\Desktop\python\finalp2.xlsx', index = None, header=True) #Don't forget to add '.xlsx' at the end of the path
export_excel = pds4.to_excel (r'C:\Users\MELKI\Desktop\python\finalp3.xlsx', index = None, header=True) #Don't forget to add '.xlsx' at the end of the path



