#!/usr/bin/env python
#-*- coding:utf-8 -*-
# author: MQS
# datetime:2019/2/23 12:38
# software: PyCharm
# desc: 主页
from run import app
from flask import render_template
from app.model import *


@app.route('/', methods=['GET'])
def index():
    articles = Article.query.filter().order_by(Article.puthtime.desc()).paginate(1, 5, False)
    print(type(articles))
    print(articles.items)
    for i in articles.items:
        print(i.title)
    return render_template('index.html')