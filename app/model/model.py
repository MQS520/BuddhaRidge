#!/usr/bin/env python
#-*- coding:utf-8 -*-
# author: MQS
# datetime:2019/2/23 13:43
# software: PyCharm
# desc: 实体类
from run import db
from flask_login import UserMixin
import datetime


# article_user 关联表
article_user = db.Table('article_user',
            db.Column('id',db.Integer,primary_key=True),
            db.Column('article_id',db.Integer,db.ForeignKey('article.id')),
            db.Column('user_id',db.Integer,db.ForeignKey('user.id'))
         )

# article_type 关联表
article_type = db.Table('article_type',
            db.Column('id',db.Integer,primary_key=True),
            db.Column('article_id',db.Integer,db.ForeignKey('article.id')),
            db.Column('type_id',db.Integer,db.ForeignKey('type.id'))
         )
# article表
class Article(db.Model):
    __tablename__ = 'article'
    id = db.Column(db.Integer,primary_key=True)
    title = db.Column(db.String(255))
    content = db.Column(db.Text)
    pushtime = db.Column(db.DateTime, default=datetime.datetime.now)
    users = db.relationship('User', secondary= article_user, backref= db.backref('article'))
    types = db.relationship('Type', secondary=article_type, backref=db.backref('article'))

    # 构造函数
    def __init__(self, title, content):
        self.title = title
        self.content = content

# user 表
class User(db.Model, UserMixin):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key=True)
    nickname = db.Column(db.String(255))
    account = db.Column(db.String(255))
    password = db.Column(db.String(255))
    role = db.Column(db.Integer, default=1)
    status = db.Column(db.Integer, default=1)
    createtime = db.Column(db.DateTime, default=datetime.datetime.now)



# type表
class Type(db.Model):
    __tablename__ = 'type'
    id = db.Column(db.Integer, primary_key=True)
    article_type = db.Column(db.String(255))
    status = db.Column(db.Integer)
    createtime = db.Column(db.DateTime, default=datetime.datetime.now)

