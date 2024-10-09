from flask import Flask
"""from flask_migrate import Migrate"""
from Moneymap.models import db
from Moneymap.routes.authen_routes import authen_bp
from Moneymap.routes.budget_routes import budget_bp
from Moneymap.routes.report_routes import report_bp

app = Flask(__name__)


app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///money_map.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False


db.init_app(app)

"""migrate = Migrate(app, db)"""

app.register_blueprint(authen_bp)
app.register_blueprint(budget_bp)
app.register_blueprint(report_bp)

with app.app_context():
    db.create_all()
