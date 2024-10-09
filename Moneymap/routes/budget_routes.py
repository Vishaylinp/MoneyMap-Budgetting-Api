from flask import Blueprint, request, jsonify
from Moneymap.models import db, Transaction
from Moneymap.utils import wealth_budget_split

budget_bp = Blueprint('budget', __name__)

@budget_bp.route('/transactions', methods=['POST'])
def insert_transaction():
    data = request.json
    print(data)
    new_transaction = Transaction(
        user_id = data['user_id'],
        amount = data['amount'],
        category = data['category']
    )

    try:
        db.session.add(new_transaction)
        db.session.commit()
        return jsonify(message="Transaction inserted successfully", id=new_transaction.id), 201

    except Exception as e:
        db.session.rollback()
        return jsonify(message="An error occurred while inserting transaction: " + str(e)), 500

@budget_bp.route('/transactions/<int:id>', methods=['DELETE'])
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

@budget_bp.route('/wealth-budget', methods=['POST'])
def create_wealth_budget():
    data = request.json
    income = data.get('income')

    if income is None or income <= 0:
        return jsonify(message="Please enter a valid income"), 400

    budget = wealth_budget_split(income)

    return jsonify(budget=budget), 200

        
