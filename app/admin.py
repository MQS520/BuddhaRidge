#!/usr/bin/env python
#-*- coding:utf-8 -*-
# author: MQS
# datetime:2019/2/24 10:56
# software: PyCharm
# desc: 管理层
from app import app
from flask import render_template, request
from app.model import *
from app.common import Result

# 跳转admin登录页
@app.route('/admin',methods=['GET'])
def admin():
    return render_template('admin/login.html')

# 跳转index主页(后台管理主页)
@app.route('/admin/index', methods=['GET'])
def adminIndex():
    return render_template('admin/index.html')

# 登录
@app.route('/admin/login', methods=['POST'])
def login():
    account = request.form.get('account')
    password = request.form.get('password')
    user = User.query.filter(User.account == account).first()
    if user == None :
        return Result(False, '用户不存在', account)
    if user.password != password:
        return Result(False, '密码错误', account)
    return Result(True,'成功',account)