class Personne():
   
    def __init__(self, lePoids, laTaille): 
        self.lePoids = lePoids
        self.laTaille = laTaille        
    def calculIMC(self):
        taillecarre = self.laTaille*self.laTaille
        return (self.lePoids/taillecarre)
    def afficheIMC(self):
        if self.calculIMC() > 25:
            print("vous êtes en surpoids")
        else:
            print("vous êtes bien")
    

bernard = Personne(110,1.92)
roger = Personne(50,1.70)

bernard.lePoids
roger.laTaille


roger.calculIMC()

roger.afficheIMC()

bernard.calculIMC()

bernard.afficheIMC()





class Impot():
   
    def __init__(self, surface, nom): 
        self.surface = surface
        self.surface = surface        
    def calculIMC(self):
        taillecarre = self.laTaille*self.laTaille
        return (self.lePoids/taillecarre)
    def afficheIMC(self):
        if self.calculIMC() > 25:
            print("vous êtes en surpoids")
        else:
            print("vous êtes bien")

