from flask import Blueprint, request, jsonify
from Moneymap.models import db, User, Category
from flask_bcrypt import Bcrypt
from flask_jwt_extended import create_access_token, jwt_required

authen_bp = Blueprint('authen', __name__)
bcrypt = Bcrypt()

@authen_bp.route('/register', methods=['POST'])
def register():
    """
    Register a new user to Moneymap.

    :param username: username chosen by user
    :param password: password chosen by user
    :return: a json response with a message, and a status code of 201, 400, or 500
    """
    data = request.json
    existing_user = User.query.filter_by(username=data['username']).first()

    if existing_user:
        return jsonify(message="Username already exists."), 400

    hashed_password = bcrypt.generate_password_hash(data['password']).decode('utf-8')
    new_user = User(username=data['username'], password=hashed_password)

    default_categories = [
        "income",
        "food",
        "entertainment",
        "bills",
        "rent",
        "clothing"
    ]

    try:
        db.session.add(new_user)

        for category_name in default_categories:
            new_category = Category(category_name=category_name)
            db.session.add(new_category)

        db.session.commit()

        return jsonify(message="User is registered successfully"), 201

    except Exception as e:
        db.session.rollback()
        return jsonify(message="An error occurred during registration: " + str(e)), 500

@authen_bp.route('/login', methods=['POST'])
def login():
    """
    Login to Moneymap.

    :param username: username of existing user
    :param password: password of existing user
    :return: a json response with a message, a JWT access token, and a status code of 200, 400, or 401
    """
    data = request.json
    user = User.query.filter_by(username=data['username']).first()

    if user and bcrypt.check_password_hash(user.password, data['password']):
        access_token = create_access_token(identity=user.id)
        return jsonify(message="Login successful", access_token=access_token), 200

    else:
        return jsonify(message="Incorrect username or password"), 401

@authen_bp.route('/logout', methods=['POST'])
@jwt_required()
def logout():
    """
    Logout of Moneymap.

    :return: a json response with a message and a status code of 200
    """
    return jsonify(message="Logout successful"), 200
