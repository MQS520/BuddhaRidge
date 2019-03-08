#!/usr/bin/env python
#-*- coding:utf-8 -*-
# author: MQS
# datetime:2019/3/7 21:43
# software: PyCharm
# desc:

from flask_wtf import FlaskForm
from wtforms import StringField,PasswordField
from wtforms.validators import DataRequired

class LoginForm(FlaskForm):
    account = StringField('account', validators=[DataRequired('账号不能为空')])
    password = PasswordField('password', validators=[DataRequired('密码不能为空')])