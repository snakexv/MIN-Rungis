import pandas as pd


# Vérifier sur quel répertoire on se trouve
import os
path = os.getcwd()

os.listdir(path)


df = pd.read_csv('texte_produit.csv', sep=';')

type(df["TEXTE_PRODUIT"][0])

df["txt_pdt"]=df["TEXTE_PRODUIT"]

liste1=df["txt_pdt"][608]
type(liste1.split(','))
type(', '.join(liste1))

sorted(df["txt_pdt"][48])

for p in df["txt_pdt"][49]:
    print(p.capitalize())


for p in range(610):
    df["txt_pdt"][p]=df["txt_pdt"][p].split(', ')
    
for p in range(610):
    df["txt_pdt"][p]=sorted(df["txt_pdt"][p])
    
for p in range(610):
    d = len(df["txt_pdt"][p])
    for k in range(d):
        (df["txt_pdt"][p])[k]=(df["txt_pdt"][p])[k].capitalize()
        print(df["txt_pdt"][p][k])







print(df["txt_pdt"])

for p in range(610):
    df["txt_pdt"][p]=', '.join(df["txt_pdt"][p])


df.head()
df.to_excel("output.xlsx")



