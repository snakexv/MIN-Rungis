# -*- coding: utf-8 -*-
"""
Created on Thu May 23 12:02:27 2019

@author: MELKI
"""

import numpy as np
import pandas as pd

imma = pd.read_csv('C:/Users/MELKI/Desktop/python/imma.csv')

imma.head()
df=imma['matricule']

mat=pd.Series(df)
mat.Name='mat'

type(mat)
mat.head()
dmt=mat.str[-2:]
dmtd=dmt.str.isnumeric()
dmtd.Name='dmtd'
df.index

dataimma=pd.concat([mat,dmtd],axis=1)
dataimma.columns=['mat','dmtd']
dataimma.columns
dataimma.head()

index2=dataimma.index[dataimma['dmtd']==True]

Trumat=dataimma.loc[index2]
Trumat
Trumat.tail()
dataimma.tail()
Trumat['redmat']=Trumat['mat'].str[0]

index3=Trumat.index[Trumat['redmat'].str.isnumeric()==True]
Doublemat=Trumat.loc[index3]
Doublemat
Doublemat['blackmat']=Doublemat['mat'].str[-3]

index4=Doublemat.index[Doublemat['blackmat'].str.isnumeric()==False]
Triplemat=Doublemat.loc[index4]

TripleC = pd.Series(Triplemat['mat'],index=Triplemat.index,name='TRC')

two_groups = '(?P<letter>[A-Z])(?P<digit>[0-9])'
TripleC.str.extract(two_groups, expand=True)

ListA=list(TripleC)

ListC=ListA

#ListCCC=list(ListC[0])
#"".join(ListCCC)
#ListCCC[-2:].isdigit()

for x in range(0,len(ListC)):
    ListE=list(ListC[x])
    del ListE[-2:]
    ListC[x]="".join(ListE)

#if isinstance(ListCCC[0],str):
 #   ListCCC[1]='S'
#else:
#    ListCCC[1]='N'

    
for x in range(0,len(ListC)):    
    for j in range(0,len(ListC[x])):
        ListD=list(ListC[x])        
        if ListD[j].isdigit():
            ListD[j]='D'
        else:
            ListD[j]='S'   
        ListC[x]="".join(ListD)
print(ListC)



TA=list(range(0,len(ListC)))
TB=list(range(0,len(ListC)))
VA=list(range(0,len(ListC)))
VB=list(range(0,len(ListC)))
len(TA)

for x in range(0,len(ListC)):
    LD=list(ListC[x])
    k=-1
    m=0
    l=len(LD)
    for i in range(0,l):
        while LD[i]=='D'and (i-k)<2:
            k=i
            m+=1
            break
        pp="".join(LD[:m])
        qq="".join(LD[m-l:])
        f=abs(m-l)
        TA[x]=pp
        TB[x]=qq
        VA[x]=m
        VB[x]=f

print(TA)
print(TB)
print(VA)
print(VB)


"""
ListC[29]='DDSS'

len(ListC[29])
LD=list(ListC[29])
k=-1
m=0
l=len(LD)
for i in range(0,l):
    while LD[i]=='D'and (i-k)<2:
        k=i
        m+=1
        print(i , LD[i])
        break
    pp="".join(LD[:m])
    qq="".join(LD[m-l:])
    f=abs(m-l)
    TA[29]=pp
    TB[29]=qq
    VA[29]=m
    VB[29]=f
 """  
mTA = pd.Series(TA,index=Triplemat.index,name='mTA')
mTB = pd.Series(TB,index=Triplemat.index,name='mTB')
mVA = pd.Series(VA,index=Triplemat.index,name='mVA')
mVB = pd.Series(VB,index=Triplemat.index,name='mVB')

"""
mTA = pd.Series(TA,name='mTA')
mTB = pd.Series(TB,name='mTB')
mVA = pd.Series(VA,name='mVA')
mVB = pd.Series(VB,name='mVB')
"""

quatromat = pd.concat([TripleC,mTA,mTB,mVA,mVB],axis=1)
quatromat.columns=['A','B','C','D','E']

mVA>5

indexT=quatromat.index[(quatromat['E']>3)==False]
cinqomat=quatromat.loc[indexT]

indexV=cinqomat.index[(cinqomat['D']>4)==False]
finalmat=cinqomat.loc[indexV]

final=pd.merge(imma,finalmat,left_index=True,right_index=True,how='left')

final.describe()

export_excel = final.to_excel (r'C:\Users\MELKI\Desktop\python\export_dataframe.xlsx', index = None, header=True) #Don't forget to add '.xlsx' at the end of the path


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    