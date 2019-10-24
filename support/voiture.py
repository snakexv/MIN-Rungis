"""
Exercice: Classe Voiture
Classe Voiture: Écrire un programme Python qui permet de définir une classe Voiture qui permette d’instancier des objets reproduisant le comportement de voitures automobiles. Le constructeur de cette classe initialisera les
attributs d’instance suivants, avec les valeurs par défaut indiquées :

marque = ‘Ford’, couleur = ‘rouge’, pilote = ‘personne’, vitesse = 0.

Lorsque l’on instanciera un nouvel objet Voiture, on pourra choisir sa marque et sa couleur, mais pas sa vitesse, ni le nom de son conducteur.

Les méthodes suivantes seront définies :

choix_conducteur(nom) permettra de désigner (ou changer) le nom du conducteur.
accelerer(taux, duree) permettra de faire varier la vitesse de la voiture. La variation de vitesse obtenue sera égale au produit : taux × duree. Par exemple, si la voiture accélère au taux de 1,3 m/s pendant 20 secondes, son gain de vitesse doit être égal à 26 m/s. Des taux négatifs seront acceptés (ce qui permettra de décélérer). La variation de vitesse ne sera pas autorisée si le conducteur est ’personne’.
affiche_tout() permettra de faire apparaître les propriétés présentes de la voiture, c’est-à-dire sa marque, sa couleur, le nom de son conducteur, sa vitesse.
Exemples d’exécution:

>>> a1 = Voiture(‘Peugeot’, ‘bleue’)
>>> a2 = Voiture(couleur = ‘verte’)
>>> a3 = Voiture(‘Mercedes’)
>>> a1.choix_conducteur(‘Roméo’)
>>> a2.choix_conducteur(‘Juliette’)
>>> a2.accelerer(1.8, 12)
>>> a3.accelerer(1.9, 11)
Cette voiture n’a pas de conducteur !
>>> a2.affiche_tout()
Ford verte pilotée par Juliette, vitesse = 21.6 m/s.
>>> a3.affiche_tout()
Mercedes rouge pilotée par personne, vitesse = 0 m/s.

"""


class Voiture:
    def __init__(self,marque='Ford',couleur='rouge'):
        """Constructeur avec les valeurs par défaut: marque = 'Ford', couleur = 'rouge', pilote = 'personne', vitesse = 0.
        on ne peut pas choisir sa vitesse, ni le nom de son conducteur Lorsque l’on instanciera un nouvel objet.
"""
        self.marque=marque
        self.couleur=couleur
        self.pilote = 'personne'
        self.vitesse = 0
     
    def choix_conducteur(self,nom):
        """Changement du conducteur"""
        self.pilote=nom
     
    def accelerer(self,taux, duree):
        """
        changement de la vitesse (taux * duree) si la voiture a un conducteur différent que 'personne'
        """
         
        if self.pilote!='personne':
            self.vitesse=taux*duree
        else:
            print("Cette voiture n'a pas de conducteur !")
     
    def affiche_tout(self):
        """
        Affichage des propriétés présentes de la voiture
        """
        print("%s %s piloté(e) par %s, vitesse = %0.2f m/s."%(self.marque,self.couleur,self.pilote,self.vitesse))
         
 
######## Programme principal #########
 
v1 = Voiture('Peugeot', 'bleue') # instanciation de la voiture v1 de marque 'Peugeot' et de couleur 'bleue'
 
v2 = Voiture(couleur = 'verte')  # instanciation de la voiture v2 de marque 'Ford' (marque par défaut) et de couleur 'verte'
 
v3 = Voiture('Mercedes')  # instanciation de la voiture v3 de marque 'Mercedes' et de couleur 'rouge' (couleur par défaut) 
 
v1.choix_conducteur('Roméo') # affecter le conducteur 'Roméo' à la voiture v1
v2.choix_conducteur('Juliette') # affecter la conductrice 'Juliette' à la voiture v2
 
v2.accelerer(1.8, 12) # affecter la vitesse 21.6(=1.8 * 12 ) à la voiture v2 de la conductrice 'Juliette'
 
v3.accelerer(1.9, 11) # affecter la vitesse 20.9(=1.9 * 11 ) à la voiture v3 qui n'a pas de conducteur
 
v2.affiche_tout() # Affichage des propriétés présentes de la voiture v2
 
v3.affiche_tout() # # Affichage des propriétés présentes de la voiture v3
