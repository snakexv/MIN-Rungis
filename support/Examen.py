
""" 
Algorithme A1
"""

note_option = float(input("saisir la note d'option :"))


if note_option < 10:
    points_gagnes=0
else:
    points_gagnes=note_option - 10

points_gagnes=points_gagnes*2

print("note d'options :", note_option)
print("points gagnés :", points_gagnes)


"""
Algorithme A2
"""

francais = float(input("merci de saisir votre note de francais :"))
math = float(input("merci de saisir votre note de math :"))
histgeo = float(input("merci de saisir votre note d'histoire-geo :"))
lv1 = float(input("merci de saisir votre note lv1 :"))
lv2 = float(input("merci de saisir votre note  lv2 :"))
physique = float(input("merci de saisir votre note de physique :"))
tech = float(input("merci de saisir votre note en technologie :"))


notes=[francais,math,histgeo,lv1,lv2,physique,tech]


"""
Algorithme A3
"""
def note_moyenne(note, points_gagnes):
    coeffs=[3,3,2,2,1,2,1]
    note_coeff=0
    for j in range(0,6):
        note_coeff = note_coeff + note[j]*coeffs[j]
    note_coeff=note_coeff + points_gagnes
    note_moyenne=note_coeff/12
    return note_moyenne


candidat=int(input("merci de saisir le nombre de candidats :"))
candidat = candidat + 1

for i in range(1,candidat):
    
    print("nous allons rentrer les notes pour le candidat ", i)
    francais = float(input("merci de saisir votre note de francais pour le candidat :"))
    math = float(input("merci de saisir votre note de math :"))
    histgeo = float(input("merci de saisir votre note d'histoire-geo :"))
    lv1 = float(input("merci de saisir votre note lv1 :"))
    lv2 = float(input("merci de saisir votre note  lv2 :"))
    physique = float(input("merci de saisir votre note de physique :"))
    tech = float(input("merci de saisir votre note en technologie :"))
    
    reponse=input("Le candidat a-t-il participé à une épreuve facultative:" + ' [y/n]:')
    if reponse =='y':   
        note_option = float(input("saisir la note d'option :"))
        if note_option < 10:
            points_gagnes=0
        else:
            points_gagnes=note_option - 10
        points_gagnes=points_gagnes*2
        print("points gagnés :", points_gagnes)
    elif reponse=='n':
        print("aucune note d'option ne sera prise en compte dans la moyenne")
        points_gagnes=0
    else:
        print("vous n'avez répondu ni par y pour oui ni par n pour non, par défault nous considérons qu'il n'a pas participé à aucune épreuve facultative")
        points_gagnes=0


    notes=[francais,math,histgeo,lv1,lv2,physique,tech]
    moyenne=note_moyenne(notes, points_gagnes)
    print("le candidat",i,"a obtenu une moyenne de", round(moyenne,2))
    

"""
Algorithme A4
"""
def note_moyenne(note, points_gagnes):
    coeffs=[3,3,2,2,1,2,1]
    note_coeff=0
    for j in range(0,6):
        note_coeff = note_coeff + note[j]*coeffs[j]
    note_coeff=note_coeff + points_gagnes
    note_moyenne=note_coeff/12
    return note_moyenne


candidat=int(input("merci de saisir le nombre de candidats :"))
candidat = candidat + 1
notes_candidat=[]
for i in range(1,candidat):
    
    print("nous allons rentrer les notes pour le candidat ", i)
    francais = float(input("merci de saisir votre note de francais pour le candidat :"))
    math = float(input("merci de saisir votre note de math :"))
    histgeo = float(input("merci de saisir votre note d'histoire-geo :"))
    lv1 = float(input("merci de saisir votre note lv1 :"))
    lv2 = float(input("merci de saisir votre note  lv2 :"))
    physique = float(input("merci de saisir votre note de physique :"))
    tech = float(input("merci de saisir votre note en technologie :"))
    
    reponse=input("Le candidat a-t-il participé à une épreuve facultative:" + ' [y/n]:')
    if reponse =='y':   
        note_option = float(input("saisir la note d'option :"))
        if note_option < 10:
            points_gagnes=0
        else:
            points_gagnes=note_option - 10
        points_gagnes=points_gagnes*2
        print("points gagnés :", points_gagnes)
    elif reponse=='n':
        print("aucune note d'option ne sera prise en compte dans la moyenne")
        points_gagnes=0
    else:
        print("vous n'avez répondu ni par y pour oui ni par n pour non, par défault nous considérons qu'il n'a pas participé à aucune épreuve facultative")
        points_gagnes=0


    notes=[francais,math,histgeo,lv1,lv2,physique,tech]
    moyenne=note_moyenne(notes, points_gagnes)
    moyenne = round(moyenne,2)
#    print("le candidat",i,"a obtenu une moyenne de", round(moyenne,2))
    notes_candidat.append(moyenne)
    nb_notes=len(notes_candidat)
    
    
if nb_notes==1:
    if notes_candidat[0]<10:
        print("Le candidat",1,"est refusé à l'examen")
    elif notes_candidat[0]>=10 and notes_candidat[0]<12:
        print("Le candidat",1,"est reçu à l'examen mention Passable")
    elif notes_candidat[0]>=12 and notes_candidat[0]<14:
        print("Le candidat",1,"est reçu à l'examen mention Assez Bien")
    elif notes_candidat[0]>=14 and notes_candidat[0]<16:
        print("Le candidat",1,"est reçu à l'examen mention Bien")
    else: 
        print("Le candidat",k,"est reçu à l'examen mention Très Bien")
else:
   for k in range(0, nb_notes):
    if notes_candidat[k]<10:
        print("Le candidat",k + 1,"est refusé à l'examen")
    elif notes_candidat[k]>=10 and notes_candidat[k]<12:
        print("Le candidat",k + 1,"est reçu à l'examen mention Passable")
    elif notes_candidat[k]>=12 and notes_candidat[k]<14:
        print("Le candidat",k + 1,"est reçu à l'examen mention Assez Bien")
    elif notes_candidat[k]>=14 and notes_candidat[k]<16:
        print("Le candidat",k + 1,"est reçu à l'examen mention Bien")
    else: 
        print("Le candidat",k + 1,"est reçu à l'examen mention Très Bien")






















