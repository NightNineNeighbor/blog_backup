## parser.py
import requests
from bs4 import BeautifulSoup

req = requests.get('http://mlbpark.donga.com/mp/b.php?p=1&b=bullpen&id=201805210017631485&select=&query=&user=&site=&reply=&source=&sig=h6jjGg2g6h6RKfX@hlj9Sg-Ajhlq')
html = req.text
soup = BeautifulSoup(html, 'html.parser')

date = soup.find('span',class_='date')
print date.text

nick = soup.find('span',class_='nick')
print nick.text

title = soup.find('div',class_='titles')
print title.text

content = soup.find('div',id='contentDetail')
print content.text




                     




'''




for tmp in text:
    try:
        print tmp['id'] + ':::' + tmp.container
    except KeyError as e:
        a =1
        '''
'''
    try:
        if tmp['id']=='contentDetail':
            print tmp.text
    except KeyError as e:
        a = 1
    try:
        if tmp['id']=='titles':
            print tmp.text
    except KeyError as e:
        a = 1
        '''







'''
text = soup.find('table').find_all('a')

                     #,{"class":"tbl_type01"}).find_all('a')


for href in text:
    print href["href"]
'''    


'''
text = soup.find('div').find_all("div",{"id":"contentDetail"})



## my_titles는 list 객체
for title in text:
    ## Tag안의 텍스트
    print(title.text)
    
'''
