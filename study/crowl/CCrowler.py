import requests
from bs4 import BeautifulSoup

def crowl(url):
    req = requests.get(url)
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

    print ""
    print ""

req = requests.get('http://mlbpark.donga.com/mp/b.php?p=100')
html = req.text
soup = BeautifulSoup(html, 'html.parser')

list = soup.find('table',class_="tbl_type01")

for i in list.find_all('a'):
    if i['href'] is not '#':
        try:
            crowl(i['href'])
        except:
            a = 1

        



