# os for file management

import selenium
from selenium import webdriver
import time

driver = webdriver.Chrome(r"C:/Program Files (x86)/webdrivers/chromedriver.exe")

driver.get('https://strada.rungisinternational.com/connexion')

# Select the id box
id_box = driver.find_element_by_name('login')
id_box.send_keys('MELKI')

pwd_box = driver.find_element_by_name('mdp')
pwd_box.send_keys('Melki2019')


"""
se logger
"""

log=driver.find_elements_by_xpath('//*[@id="corps"]/div/form/div[3]/div/button')[0]
log.click()

time.sleep(4)

"""
fixer les données
"""

log1=driver.find_element_by_xpath('/html/body/div/div[1]/div/div/ul[2]/li/a')
log1.click()

log2=driver.find_element_by_xpath('/html/body/div/div[1]/div/div/ul[2]/li/ul/li[3]/a')
log2.click()

time.sleep(4)

# choisir l'année 2018

log3=driver.find_elements_by_xpath('//*[@id="periodes"]/option[20]')[0]
log3.click()

liste=[181,411,816,857,1037,2020,3626,4422,5240,5546,5790,5800,5826,5946,6668,6770,6872,7432,8348,8453,9297,9302,9600,9706,9789,9890]
last=len(liste)
notfind=[]
done=[]

startTime = time.time()
for j in range(0,last):
    log3=driver.find_elements_by_xpath('//*[@id="periodes"]/option[20]')[0]
    log3.click()
    code_box = driver.find_element_by_name('code')
    code_box.clear()
    code_box.send_keys(liste[j])

    relog=driver.find_elements_by_xpath('//*[@id="corps"]/div/form/table/tbody/tr[3]/td[1]/div/div/button')[0]
    relog.click()
    
    centre_box = driver.find_element_by_css_selector('td.center')
    if centre_box.text=='Aucune entreprise trouvée sur la période choisie.':
        notfind.append(liste[j])
        continue

    time.sleep(3)
    done.append(liste[j])
    relog1=driver.find_elements_by_xpath('//*[@id="corps"]/div/table/tbody/tr/td[5]/a[1]/img')[0]
    relog1.click()


    time.sleep(3)

    
    for i in range(0,35):
        da = driver.find_elements_by_class_name('div_qte')[i]
        valeur=da.text.replace(" ","")
        valeur1=valeur.replace(",",".")
        if float(valeur1)!=0:
            print(valeur1)
            time.sleep(2.5)
            da1=driver.find_elements_by_class_name('fleche_droite')[i]
            da1.click()

    fixe_box = driver.find_element_by_xpath('//*[@id="fixation"]/div/button')
    fixe_box.click()
    time.sleep(2)



endTime = time.time()
elapsedTime = endTime - startTime
print("Elapsed Time = %s" % elapsedTime)
print("fixés :", done)
print("Non trouvés :", notfind)



