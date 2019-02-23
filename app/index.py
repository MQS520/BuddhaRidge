#!/usr/bin/env python
#-*- coding:utf-8 -*-
# author: MQS
# datetime:2019/2/23 12:38
# software: PyCharm
# desc: 主页
from run import app
from flask import render_template, request
from app.model import *
from app.common import *

# 跳转首页
@app.route('/', methods=['GET'])
@app.route('/index', methods=['GET'])
def index():
    page = request.args.get('page', 1 , type=int)
    print(page)
    try:
        pagination = Article.query.filter().order_by(Article.puthtime.desc()).paginate(page, per_page=5, error_out=False)
        return render_template('index.html', articles=pagination.items, pagination=pagination)
    except Exception:
        return render_template('common/error.html')
