# os for file management

import selenium
from selenium import webdriver


driver = webdriver.Chrome(r"C:/Program Files (x86)/webdrivers/chromedriver.exe")

driver.get('https://canvas.case.edu')

# Select the id box
id_box = driver.find_element_by_name('username')
# Equivalent Outcome! 
id_box = driver.find_element_by_id('username')

id_box.clear()

login_button = driver.find_element_by_name('submit')
login_button.click()

