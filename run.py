from flask import Flask
from flask_login import LoginManager
from flask_sqlalchemy import SQLAlchemy
from config import Config
from app.controller import userRoute,articleRoute


app = Flask(__name__)
app.config.from_object(Config)
db = SQLAlchemy(app)

app.register_blueprint(userRoute,url_prefix='')
app.register_blueprint(articleRoute,url_prefix='')

login_manager = LoginManager()
login_manager.session_protection = 'strong'
login_manager.login_view = 'userRoute.login'
login_manager.login_message = '请登录'
login_manager.init_app(app)

from app.model.model import User

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

if __name__ == '__main__':
    app.run(debug=True)