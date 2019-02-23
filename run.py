from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from config import Config


app = Flask(__name__)


# 导入数据库配置文件
app.config.from_object(Config)

# 建立数据库连接
db =SQLAlchemy(app)


from app import index

if __name__ == '__main__':
    app.run()
