#!/usr/bin/env python
#-*- coding:utf-8 -*-
# author: MQS
# datetime:2019/2/24 10:56
# software: PyCharm
# desc: 管理层
from run import login_manager
from flask import render_template, request, Blueprint,url_for,redirect
from flask_login import login_user, login_required
from app.model.model import *

# 创建蓝图
userRoute = Blueprint('userRoute', __name__)

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))


@userRoute.route('/admin',methods=['GET'])
@login_required
def adminIndex():
    return render_template('admin/index.html')

# 登录
@userRoute.route('/login', methods=['POST','GET'])
def login():
    if request.method == 'POST':
        account = request.form.get('account')
        password = request.form.get('password')
        print(account)
        print(password)
        user = User.query.filter(User.account == account).first()
        print(user.password)
        if user:
            if user.password == password:
                login_user(user)
                return redirect(url_for('userRoute.adminIndex'))
            else:
                return render_template('/admin/login.html', error='密码错误!', account = account)
        else:
            return render_template('/admin/login.html',error = '该用户不存在!')

    return render_template('/admin/login.html')