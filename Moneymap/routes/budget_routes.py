from flask import Blueprint, request, jsonify
from Moneymap.models import db, Transaction, Category
from Moneymap.utils import wealth_budget_split
from flask_jwt_extended import jwt_required, get_jwt_identity

budget_bp = Blueprint('budget', __name__)

@budget_bp.route('/transactions', methods=['POST'])
@jwt_required()
def insert_transaction():
    """
    Insert a new transaction for the user.

    :param amount: the amount of money spent
    :param category: the category of the transaction
    :return: a json response with a message, and a status code of 201, 400, or 500
    """
    user_id = get_jwt_identity()
    data = request.json

    if 'category' not in data:
        return jsonify(message="Category is required"), 400

    category_name = data['category'].lower()
    category = Category.query.filter_by(category_name=category_name).first()

    if not category:
        category = Category(category_name=category_name)
        db.session.add(category)
        try:
            db.session.commit()
        except Exception as e:
            db.session.rollback()
            return jsonify(message="An error occurred while inserting category: " + str(e)), 500

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
    """
    Delete a transaction from the user's transactions.

    :param id: the id of the transaction to be deleted
    :return: a json response with a message, and a status code of 200, 404, or 500
    """
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

    """
    Fetch all transactions for a given user id.

    :param user_id: the id of the user whose transactions are to be fetched
    :return: a json response with a list of all transactions, and a status code of 200 or 404
    """

    transactions = Transaction.query.filter_by(user_id=user_id).all()

    if transactions:
        transact_list = [transaction.to_dict() for transaction in transactions]
        return jsonify(transactions=transact_list), 200
    else:
        return jsonify(message="No transaction found for this user id"),404


@budget_bp.route('/transactions/<int:id>', methods=['PUT'])
@jwt_required()
def update_transaction(id):
    """
    Update a transaction from the user's transactions.

    :param id: the id of the transaction to be updated
    :return: a json response with a message, and a status code of 200, 404, or 500
    """
    data = request.json
    transaction = Transaction.query.get(id)

    if not transaction:
        return jsonify(message="Transaction not found"), 404

    if 'amount' in data:
        transaction.amount = data['amount']

    if 'category' in data:
        category = Category.query.filter_by(category_name=data['category'].lower()).first()
        if not category:
            return jsonify(message="Category not found"), 404
        transaction.category_id = category.id

    try:
        db.session.commit()
        return jsonify(message="Transaction successfully updated"), 200
    except Exception as e:
        db.session.rollback()
        return jsonify(message="An error occurred while updating transaction" + str(e)), 500


@budget_bp.route('/categories', methods=['POST'])
@jwt_required()
def insert_category():
    """
    Insert a new category.

    :param category_name: the name of the category to be inserted
    :return: a json response with a message, and a status code of 201, 404, or 500
    """
    data = request.json
    category_name = data.get('category_name')

    if not category_name:
        return jsonify(message="Category name  is required"), 404

    category_name_lower = category_name.lower()
    category_exists = Category.query.filter_by(category_name=category_name_lower).first()
    if category_exists:
        return jsonify(message="category already exists"), 409

    create_category = Category(category_name=category_name)

    try:
        db.session.add(create_category)
        db.session.commit()
        return jsonify(message="Category inserted successfully", id=create_category.id), 201

    except Exception as e:
        db.session.rollback()
        return jsonify(message="An error has occurred while inserting the category: " + str(e)), 500


@budget_bp.route('/categories', methods=['GET'])
@jwt_required()
def fetch_categories():
    """
    Fetches all categories from the database.

    :return: a json response with a list of categories, and a status code of 200 or 404
    """
    categories = Category.query.all()

    if categories:
        category_list = [{'id': c.id, 'category_name': c.category_name} for c in categories]
        return jsonify(category_list=category_list), 200
    else:
        return jsonify(message="No category found"), 404


@budget_bp.route('/categories/<int:id>', methods=['PUT'])
@jwt_required()
def update_category(id):
    """
    Updates a category from the user's categories.

    :param id: the id of the category to be updated
    :return: a json response with a message, and a status code of 200, 400, or 500
    """
    data = request.json
    new_category_name = data.get('category_name')

    if not new_category_name:
        return jsonify(message="Category name is required"), 400

    category = Category.query.get(id)

    if not category:
        return jsonify(message="Category not found"), 404

    category.category_name = new_category_name

    try:
        db.session.commit()
        return jsonify(message="Category updated successfully"), 200
    except Exception as e:
        db.session.rollback()
        return jsonify(message="An error occurred while updating the category: " + str(e)), 500


@budget_bp.route('/categories/<int:id>', methods=['DELETE'])
@jwt_required()
def delete_category(id):
    """
    Deletes a category and updates associated transactions.

    :param id: the id of the category to be deleted
    :return: a json response with a message, and a status code of 200 if successful, 404 if category not found
    """
    category = Category.query.get(id)
    if not category:
        return jsonify(message="Category not found"), 404

    transactions = Transaction.query.filter_by(category_id=id).all()
    if transactions:
        for transaction in transactions:
            transaction.category_id = None
            db.session.add(transaction)

    db.session.delete(category)
    db.session.commit()

    return jsonify(message="Category deleted successfully"), 200


@budget_bp.route('/wealth-budget', methods=['POST'])
def create_wealth_budget():
    """
    Creates a wealth budget split based on the 50/30/20 principle.

    :param income: the user's income
    :return: a json response with the budget split, and a status code of 200 if successful, 400 if income is invalid
    """
    data = request.json
    income = data.get('income')

    if income is None or income <= 0:
        return jsonify(message="Please enter a valid income"), 400

    budget = wealth_budget_split(income)

    return jsonify(budget=budget), 200
