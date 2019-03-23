#!/usr/bin/env python
#-*- coding:utf-8 -*-
# author: MQS
# datetime:2019/2/23 15:19
# software: PyCharm
# desc: 公共包
from flask import Response
import json

'''返回json结果'''
def Result(status, msg, data):
    result = {
        'status': status,
        'msg': msg,
        'data': data
    }
    return Response(json.dumps(result), mimetype='application/json')