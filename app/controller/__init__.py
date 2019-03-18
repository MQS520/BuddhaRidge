#!/usr/bin/env python
#-*- coding:utf-8 -*-
# author: MQS
# datetime:2019/3/9 19:07
# software: PyCharm
# desc:
from flask import Blueprint


userRoute = Blueprint('userRoute', __name__)
articleRoute = Blueprint('articleRoute', __name__)



from . import admin,article