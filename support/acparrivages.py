import pandas


X = pandas.read_csv("arrivage.csv", sep=";", header=0, index_col=0)

print(X)
X.shape

#X = X.dropna().copy()
#X.shape

#nombre d'observations
n = X.shape[0]
#nombre de variables
p = X.shape[1]



import sklearn
import matplotlib.pyplot as plt


#classe pour standardisation
from sklearn.preprocessing import StandardScaler
#instanciation
sc = StandardScaler()
#transformation – centrage-réduction
Z = sc.fit_transform(X)
print(Z)

#vérification - librairie numpy
import numpy
#moyenne
print(numpy.nanmean(Z,axis=0))

#écart-type
print(numpy.nanstd(Z,axis=0,ddof=0))

#classe pour l'ACP
from sklearn.decomposition import PCA
#instanciation
acp = PCA(svd_solver='full')

print(acp)

#calculs
coord = acp.fit_transform(Z)
#nombre de composantes calculées
print(acp.n_components_) 


#variance expliquée
print(acp.explained_variance_)


eigval = (n-1)/n*acp.explained_variance_
print(eigval)

#ou bien en passant par les valeurs singulières
print(acp.singular_values_**2/n)

#proportion de variance expliquée
print(acp.explained_variance_ratio_)

#scree plot
plt.plot(numpy.arange(1,p+1),eigval)
plt.title("Scree plot")
plt.ylabel("Eigen values")
plt.xlabel("Factor number")
plt.show()

#cumul de variance expliquée
plt.plot(numpy.arange(1,p+1),numpy.cumsum(acp.explained_variance_ratio_))
plt.title("Explained variance vs. # of factors")
plt.ylabel("Cumsum explained variance ratio")
plt.xlabel("Factor number")
plt.show()

#seuils pour test des bâtons brisés
bs = 1/numpy.arange(p,0,-1)
bs = numpy.cumsum(bs)
bs = bs[::-1]


print(pandas.DataFrame({'Val.Propre':eigval,'Seuils':bs}))

#positionnement des individus dans le premier plan
fig, axes = plt.subplots(figsize=(12,12))
axes.set_xlim(-6,6) #même limites en abscisse
axes.set_ylim(-6,6) #et en ordonnée
#placement des étiquettes des observations
for i in range(n):
 plt.annotate(X.index[i],(coord[i,0],coord[i,1]))
#ajouter les axes
plt.plot([-6,6],[0,0],color='silver',linestyle='-',linewidth=1)
plt.plot([0,0],[-6,6],color='silver',linestyle='-',linewidth=1)
#affichage
plt.show()


#contribution des individus dans l'inertie totale
di = numpy.sum(Z**2,axis=1)
print(pandas.DataFrame({'ID':X.index,'d_i':di}))

Y = pandas.DataFrame({'ID':X.index,'d_i':di})
Y[Y['d_i']>10]


#qualité de représentation des individus - COS2
cos2 = coord**2
for j in range(p):
 cos2[:,j] = cos2[:,j]/di
print(pandas.DataFrame({'id':X.index,'COS2_1':cos2[:,0],'COS2_2':cos2[:,1]}))

#vérifions la théorie - somme en ligne des cos2 = 1
print(numpy.sum(cos2,axis=1))


#contributions aux axes
ctr = coord**2
for j in range(p):
 ctr[:,j] = ctr[:,j]/(n*eigval[j])

print(pandas.DataFrame({'id':X.index,'CTR_1':ctr[:,0],'CTR_2':ctr[:,1]}))

#vérifions la théorie
print(numpy.sum(ctr,axis=0))

#le champ components_ de l'objet ACP
print(acp.components_)
sqrt_eigval = numpy.sqrt(eigval)

#corrélation des variables avec les axes
corvar = numpy.zeros((p,p))
for k in range(p):
 corvar[:,k] = acp.components_[k,:] * sqrt_eigval[k]

#afficher la matrice des corrélations variables x facteurs
print(corvar)

#on affiche pour les deux premiers axes
print(pandas.DataFrame({'id':X.columns,'COR_1':corvar[:,0],'COR_2':corvar[:,1]}))


#cercle des corrélations
fig, axes = plt.subplots(figsize=(8,8))
axes.set_xlim(-1,1)
axes.set_ylim(-1,1)
#affichage des étiquettes (noms des variables)
for j in range(p):
 plt.annotate(X.columns[j],(corvar[j,0],corvar[j,1]))

#ajouter les axes
plt.plot([-1,1],[0,0],color='silver',linestyle='-',linewidth=1)
plt.plot([0,0],[-1,1],color='silver',linestyle='-',linewidth=1)

#ajouter un cercle
cercle = plt.Circle((0,0),1,color='blue',fill=False)
axes.add_artist(cercle)
#affichage
plt.show()


#cosinus carré des variables
cos2var = corvar**2
print(pandas.DataFrame({'id':X.columns,'COS2_1':cos2var[:,0],'COS2_2':cos2var[:,1]}))

#contributions
ctrvar = cos2var
for k in range(p):
 ctrvar[:,k] = ctrvar[:,k]/eigval[k]
#on n'affiche que pour les deux premiers axes
print(pandas.DataFrame({'id':X.columns,'CTR_1':ctrvar[:,0],'CTR_2':ctrvar[:,1]}))

indSupp = pandas.read_csv("arrivage2.csv", sep=";", header=0, index_col=0)
print(indSupp)

#centrage-réduction avec les paramètres des individus actifs
ZIndSupp = sc.transform(indSupp)
print(ZIndSupp)

#projection dans l'espace factoriel
coordSupp = acp.transform(ZIndSupp)
print(coordSupp)



#positionnement des individus supplémentaires dans le premier plan
fig, axes = plt.subplots(figsize=(12,12))
axes.set_xlim(-2,7)
axes.set_ylim(-1,1)
#étiquette des points actifs
for i in range(n):
 plt.annotate(X.index[i],(coord[i,0],coord[i,1]))

#étiquette des points supplémentaires (illustratifs) en bleu ‘b’
for i in range(coordSupp.shape[0]):
 plt.annotate(indSupp.index[i],(coordSupp[i,0],coordSupp[i,1]),color='b')

#ajouter les axes
plt.plot([-2,7],[0,0],color='silver',linestyle='-',linewidth=1)
plt.plot([0,0],[-3,2],color='silver',linestyle='-',linewidth=1)
#affichage
plt.show()

varSupp = pandas.read_csv("varSupp.csv", sep=";", header=0, index_col=0)
print(varSupp)

#traitement de var. quali supplémentaire
vsQuali = varSupp.iloc[:,0]
print(vsQuali)

#modalités de la variable qualitative
modalites = numpy.unique(vsQuali)
print(modalites)

#['Fruits et légumes' 'Horticulture et Décoration' 'Marée et Entrepôts'
# 'Produits carnés' 'Produits laitiers et avicoles, produits traiteurs' 'SEDAP']
#liste des couleurs
couleurs = ['red','gray','blue','yellow','black','purple']
#faire un graphique en coloriant les points
fig, axes = plt.subplots(figsize=(12,13))
axes.set_xlim(-2,2)
axes.set_ylim(-2,2)
#pour chaque modalité de la var. illustrative
for c in range(len(modalites)):
 #numéro des individus concernés
 numero = numpy.where(vsQuali == modalites[c])
 #les passer en revue pour affichage
 for i in numero[0]:
     plt.annotate(X.index[i],(coord[i,0],coord[i,1]),color=couleurs[c])

#ajouter les axes
plt.plot([-1,1],[0,0],color='silver',linestyle='-',linewidth=1)
plt.plot([0,0],[-1,1],color='silver',linestyle='-',linewidth=1)
#affichage
plt.show()

#structure intermédiaire
df = pandas.DataFrame({'Finition':vsQuali,'F1':coord[:,0],'F2':coord[:,1]})
#puis calculer les moyennes conditionnelles
print(df.pivot_table(index='Finition',values=['F1','F2'],aggfunc=pandas.Series.mean))























