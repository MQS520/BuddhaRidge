#!/usr/bin/env python
#-*- coding:utf-8 -*-
# author: MQS
# datetime:2019/2/23 13:43
# software: PyCharm
# desc: 实体类
from app import db
import datetime

# article表
class Article(db.Model):
    __tablename__ = 'article'
    id = db.Column(db.Integer,primary_key=True)
    title = db.Column(db.String(255))
    author = db.Column(db.String(255))
    content = db.Column(db.Text)
    puthtime = db.Column(db.DateTime, default=datetime.datetime.now)

    # 构造函数
    def __init__(self, title, author, content):
        self.title = title
        self.author = author
        self.content = content


