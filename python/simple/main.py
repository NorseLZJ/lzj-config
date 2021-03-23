#!/usr/bin/env python3
# -*- coding: UTF-8 -*-

from bs4 import BeautifulSoup
from urllib import request
import re

findLink = re.compile(r'<a href="(.*?)">')


def get_data():
    datalist = []
    cur_url = 'https://movie.douban.com/top250?start=0'
    for i in range(0, 1):
        html = ask_url(cur_url + str(i * 25))
        # print(html)
        soup = BeautifulSoup(html, "html.parser")
        for item in soup.find_all('div', class_="item"):
            item = str(item)
            link = re.findall(findLink, item)[0]
            print(link)


def ask_url(url):
    header = {
        "User-Agent": "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Mobile Safari/537.36"
    }

    req = request.Request(url, headers=header)
    html = ''
    try:
        resp = request.urlopen(req)
        html = resp.read().decode('utf-8')
        # print(html)
    except Exception as e:
        print(e)

    return html


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    get_data()

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
