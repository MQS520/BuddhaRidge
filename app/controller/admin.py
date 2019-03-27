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
from app.common import Result,md5


'''后台管理页面'''
@userRoute.route('/admin',methods=['GET'])
@login_required
def adminIndex():
    return render_template('admin/index.html')

'''登录'''
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
            if user.status == 0:
                if user.password == md5(password):
                    login_user(user)
                    return redirect(url_for('userRoute.adminIndex'))
                else:
                    return render_template('admin/login.html', error='密码错误!', account = account)
            else:
                return render_template('admin/login.html', error='用户已冻结，请联系管理员！')
        else:
            return render_template('admin/login.html',error = '该用户不存在!')

    return render_template('admin/login.html')

'''登出'''
@userRoute.route('/logout', methods=['GET'])
@login_required
def logot():
    logout_user()
    return render_template('admin/login.html')


'''文章列表管理'''
@userRoute.route('/article_list', methods=['GET'])
@login_required
def article_list():
    page = request.args.get('page', 1, type=int)
    pagination = Article.query.filter().order_by(Article.pushtime.desc()).paginate(page, per_page=10,error_out=False)
    types = Type.query.filter(Type.status == 0).all()
    return render_template('admin/article_list.html', articles=pagination.items, pagination=pagination, types=types)

'''文章新增或编辑,页面跳转'''
@userRoute.route('/article_modify', methods=['GET'])
@login_required
def article_modify():
    # 若编辑，查询文章信息
    article_id = request.args.get('article_id', 0, type=int)
    article = Article.query.filter(Article.id == article_id).first()
    # 获取用户列表
    users = User.query.filter().all()
    # 获取文章类型
    types = Type.query.filter().all()
    return render_template('admin/article_modify.html', article = article, users = users, types = types)

'''文章新增或编辑，提交'''
@userRoute.route('/article_modify', methods=['POST'])
@login_required
def article_modify_submit():
    try:
        # 获取参数
        article_id = request.form.get('id') 
        title = request.form.get('title')
        content = request.form.get('content')
        userStr = request.form.get('users')
        typeStr = request.form.get('types')
        users = userStr.split(',')
        types = typeStr.split(',')
        article = None
        # 判断是新增或编辑
        if article_id != '' and article_id != None:
            # 编辑
            article = Article.query.filter(Article.id == article_id).first()
            article.title = title
            article.content = content
            # 先移除文章与作者以及类型的关系
            for user in article.users:
                article.users.remove(user)
            for type in article.types:
                article.types.remove(type)
        else:
            # 新增
            article = Article()
            article.title = title
            article.content = content
        # 重新添加关系
        for user_id in users:
            user = User.query.filter(User.id == user_id).first()
            article.users.append(user)
        for type_id in types:
            a_type = Type.query.filter(Type.id == type_id).first()
            article.types.append(a_type)
        return Result("true", "成功", None)
    except Exception as err:
        return Result("false", err, None)

'''' 文章审核 '''
@userRoute.route('/article_auditing', methods=['POST'])
@login_required
def article_auditing():
    try:
        # 获取参数
        article_id = request.form.get('article_id')
        status = request.form.get('status')
        i = Article.query.filter(Article.id == article_id).update({'status':status})
        if i > 0:
            return Result("true", "审核完成！", None)
        else:
            return Result("false", "审核失败！", None)
    except Exception as err:
        return Result("false", err, None)



''' 用户列表管理页面 '''
@userRoute.route('/user_list', methods=['GET'])
@login_required
def user_list():
    page = request.args.get('page', 1, type=int)
    pagination = User.query.filter().order_by(User.id.desc()).paginate(page, per_page =10, error_out = False)
    return render_template('admin/user_list.html', users = pagination.items, pagination = pagination)

''' 用户新增或编辑，页面 '''
@userRoute.route('/user_modify', methods=['GET'])
@login_required
def user_modify():
    try:
        user_id = request.args.get('user_id', 0, type=int)
        user = User.query.filter(User.id == user_id).first()
        return render_template('admin/user_modify.html', user = user)
    except Exception as err:
        return render_template('error.html', err = err)

''' 用户新增或编辑，提交 '''
@userRoute.route('/user_modify', methods=['POST'])
@login_required
def user_modify_submit():
    try:
        user_id = request.form.get('id')
        account = request.form.get('account')
        nickname = request.form.get('nickname')
        password = request.form.get('password')
        role = request.form.get('role')
        status = request.form.get('status')
        if user_id != '' and user_id != None:
            # 编辑
            i = User.query.filter(User.id == user_id).update({'account': account, 'nickname': nickname, 'password': md5(password), 'role': role, 'status': status})
            if i > 0:
                return Result('true', '用户修改成功！', None)
            else:
                return Result('false', '用户修改失败！', None)
        else:
            # 新增
            user = User(account, nickname, password, role, status)
            db.session.add(user)
            db.session.commit()
            return Result('true', 'hahhaha', None)
    except Exception as err:
        return Result('false', err, None)

''' 用户状态编辑 '''
@userRoute.route('/user_status', methods=['POST'])
@login_required 
def user_status():
    try:
        user_id = request.form.get('id')
        status = request.form.get('status')
        i = User.query.filter(User.id == user_id).update({'status': status})
        if i > 0:
            return Result('true', '修改成功！', None)
        else:
            return Result('false', '修改失败！', None)
    except Exception as err:
        return Result('false', err, None)