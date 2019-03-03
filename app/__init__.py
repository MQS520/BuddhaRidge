#!/usr/bin/env python
#-*- coding:utf-8 -*-
# author: MQS
# datetime:2019/2/24 10:04
# software: PyCharm
# desc:

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from config import Config

app = Flask(__name__)

# 导入数据库配置文件
app.config.from_object(Config)

# 建立数据库连接
db =SQLAlchemy(app)

from app import model
from app import index
from app import admin