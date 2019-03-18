#!/usr/bin/env python
#-*- coding:utf-8 -*-
# author: MQS
# datetime:2019/2/24 10:56
# software: PyCharm
# desc: 管理层
from run import login_manager
from flask import render_template, request, Blueprint,url_for,redirect
from flask_login import login_user, login_required,logout_user
from app.model.model import *
from . import userRoute


# 后台管理页面
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
        if not account:
            return render_template('admin/login.html', error='请输入用户名!', account=account)
        if not password:
            return render_template('admin/login.html', error='请输入密码!', account=account)
        user = User.query.filter(User.account == account).first()
        if user:
            if user.password == password:
                login_user(user)
                return redirect(url_for('userRoute.adminIndex'))
            else:
                return render_template('admin/login.html', error='密码错误!', account = account)
        else:
            return render_template('admin/login.html',error = '该用户不存在!')

    return render_template('admin/login.html')

# 登出
@userRoute.route('/logout', methods=['GET'])
@login_required
def logout():
    logout_user()
    return render_template('admin/login.html')


# 文章列表管理
@userRoute.route('/article_list', methods=['GET'])
@login_required
def article_list():
    page = request.args.get('page', 1, type=int)
    pagination = Article.query.filter().order_by(Article.pushtime.desc()).paginate(page, per_page=10,error_out=False)
    return render_template('admin/article_list.html', articles=pagination.items, pagination=pagination)

# 文章新增或编辑,页面跳转
@userRoute.route('/article_modify', methods=['GET'])
@login_required
def article_modify():
    article_id = request.args.get('article_id', 0, type=int)
    article = Article.query.filter(Article.id == article_id).first()
    return render_template('admin/article_modify.html', article = article)
