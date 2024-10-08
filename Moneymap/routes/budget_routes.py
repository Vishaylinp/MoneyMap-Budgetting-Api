from flask import Blueprint, request, jsonify
from Moneymap.models import db, Transaction, Category
from Moneymap.utils import wealth_budget_split
from flask_jwt_extended import jwt_required, get_jwt_identity

budget_bp = Blueprint('budget', __name__)

@budget_bp.route('/transactions', methods=['POST'])
@jwt_required()
def insert_transaction():
    user_id = get_jwt_identity()
    data = request.json

    if 'category' not in data:
        return jsonify(message="Category is required"), 400

    category = Category.query.filter_by(category_name=data['category']).first()

    if not category:
        return jsonify(message="Category not found"), 404

    new_transaction = Transaction(
        user_id = user_id,
        amount = data['amount'],
        category_id = category.id
    )

    try:
        db.session.add(new_transaction)
        db.session.commit()
        return jsonify(message="Transaction inserted successfully", id=new_transaction.id), 201

    except Exception as e:
        db.session.rollback()
        return jsonify(message="An error occurred while inserting transaction: " + str(e)), 500

@budget_bp.route('/transactions/<int:id>', methods=['DELETE'])
@jwt_required()
def delete_transaction(id):
    transaction = db.session.query(Transaction).filter_by(id=id).first()
    if transaction:
        try:    
            db.session.delete(transaction)
            db.session.commit()
            return jsonify(message="Transaction successfully deleted"), 200

        except Exception as e:
            db.session.rollback()
            return jsonify(message="An error occured while deleting transaction: " + str(e)), 500

    return jsonify(message="Transaction not found"), 404

@budget_bp.route('/transactions/<int:user_id>', methods=['GET'])
@jwt_required()
def fetch_transactions(user_id):
    transactions = Transaction.query.filter_by(user_id=user_id).all()

    if transactions:
        transact_list = [
            {
                'id': t.id,
                'user_id': t.user_id,
                'amount': t.amount,
                'category': t.category,
                'date': t.date.strftime("%Y-%m-%d %H:%M:%S")
            } for t in transactions
        ]
        return jsonify(transactions=transact_list), 200
    else:
        return jsonify(message="No transaction found for this user id"), 404


@budget_bp.route('/wealth-budget', methods=['POST'])
def create_wealth_budget():
    data = request.json
    income = data.get('income')

    if income is None or income <= 0:
        return jsonify(message="Please enter a valid income"), 400

    budget = wealth_budget_split(income)

    return jsonify(budget=budget), 200

        
