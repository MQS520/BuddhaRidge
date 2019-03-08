from flask import Flask
from flask_login import LoginManager
from flask_sqlalchemy import SQLAlchemy

from config import Config

app = Flask(__name__)
app.config.from_object(Config)

db = SQLAlchemy(app)

login_manager = LoginManager()
login_manager.session_protection='strong'
login_manager.login_view='userRoute.login'
login_manager.login_message='请登录'
login_manager.init_app(app)

from app.controller.admin import userRoute
from app.controller.index import articleRoute

app.register_blueprint(userRoute,url_prefix='')
app.register_blueprint(articleRoute,url_prefix='')


if __name__ == '__main__':
    app.run(host='0.0.0.0',port=5000,debug=True)