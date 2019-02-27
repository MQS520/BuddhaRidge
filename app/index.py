#!/usr/bin/env python
#-*- coding:utf-8 -*-
# author: MQS
# datetime:2019/2/23 12:38
# software: PyCharm
# desc: 主页
from app import app
from flask import render_template, request
from app.model import *



# 跳转首页
@app.route('/', methods=['GET'])
@app.route('/index', methods=['GET'])
def index():
    try:
        page = request.args.get('page', 1, type=int)
        pagination = Article.query.filter().order_by(Article.pushtime.desc()).paginate(page, per_page=5, error_out=False)
        print(dir(pagination.items[0]))
        return render_template('index.html', articles=pagination.items, pagination=pagination)
    except Exception as err:
        print(err)
        return render_template('common/error.html')


@app.route('/article', methods=['GET'])
def article():
    try:
        id = request.args.get('id', 0, type=int)
        if id == 0:
            return render_template('index.html')
        article = Article.query.filter(Article.id == id).first()
        return render_template('article.html', article = article)
    except Exception:
        return render_template('common/error.html')