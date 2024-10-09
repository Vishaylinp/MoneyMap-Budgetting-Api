from flask import Blueprint, request, jsonify
from Moneymap.models import db, User
from flask_bcrypt import Bcrypt

authen_bp = Blueprint('authen', __name__)
bcrypt = Bcrypt()

@authen_bp.route('/register', methods=['POST'])
def register():
    data = request.json
    existing_user = User.query.filter_by(username=data['username']).first()

    if existing_user:
        return jsonify(message="Username already exists."), 400

    hashed_password = bcrypt.generate_password_hash(data['password']).decode('utf-8')
    new_user = User(username=data['username'], password=hashed_password)

    try:
        db.session.add(new_user)
        db.session.commit()
        return jsonify(message="User is registered successfully"), 201

    except Exception as e:
        db.session.rollback()
        return jsonify(message="An error occured during registration: " + str(e)), 500

@authen_bp.route('/login', methods=['POST'])
def login():
    data = request.json
    user = User.query.filter_by(username=data['username']).first()

    if user and bcrypt.check_password_hash(user.password, data['password']):
        return jsonify(message="Login successful"), 200

    else:
        return jsonify(message="Incorrect username or password"), 401
