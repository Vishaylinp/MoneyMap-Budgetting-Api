from flask import Blueprint, request, jsonify
from Moneymap.models import db, Transaction


budget_bp = Blueprint('budget', __name__)

@budget_bp.route('/transactions', methods=['POST'])
def insert_transaction():
    data = request.json
    new_transaction = Transaction(
        user_id = data['user_id'],
        amount = data['amount'],
        category = data['category']
    )

    try:
        db.session.add(new_transaction)
        db.session.commit()
        return jsonify(message="Transaction inserted successfully"), 201

    except Exception as e:
        db.rollback()
        return jsonify(message="An error occurred while inserting transaction: " + str(e)), 500

@budget_bp.route('/transactions/<int:id>', methods=['DELETE'])
def delete_transaction(id):
    transaction = Transaction.query.get(id)
    if transaction:
        try:    
            db.session.delete(transaction)
            db.session.commit()
            return jsonify(message="Transaction successfully deleted"), 200

        except Exception as e:
            db.session.rollback()
            return jsonify(message="An error occured while deleting transaction: " + str(e)), 500

    return jsonify(message="Transaction not found"), 404
        
