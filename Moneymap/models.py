from flask_sqlalchemy import SQLAlchemy
from datetime import datetime


db = SQLAlchemy()

class User(db.Model):
    """Represents a User in the database"""

    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    password = db.Column(db.String(120), nullable=False)

    transactions = db.relationship('Transaction', backref='user', lazy=True)

    def to_dict(self):
        return {
            'id': self.id,
            'username': self.username
        }


class Transaction(db.Model):
    """Represents a transaction of the User"""

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    amount = db.Column(db.Float, nullable=False)
    date = db.Column(db.DateTime, default=datetime.utcnow)

    category_id = db.Column(db.Integer, db.ForeignKey('category.id'), nullable=False)
    category = db.relationship('Category', backref='transactions', lazy=True)

    def to_dict(self):
        return {
            'id': self.id,
            'amount': self.amount,
            'date': self.date.strftime('%Y-%m-%d %H:%M:%S'),
            'category': self.category.to_dict()
        }

class Category(db.Model):
    """Represents a categories of a transaction"""
    __tablename__ = 'category' 
    id = db.Column(db.Integer, primary_key=True)
    category_name = db.Column(db.String(50), unique=True, nullable=False)

    def to_dict(self):
        return {
            'id': self.id,
            'category_name': self.category_name
        }

    def __repr__(self):
        return f'<Category {self.category_name}>'     
