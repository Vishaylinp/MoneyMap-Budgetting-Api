from flask import jsonify, Blueprint
from Moneymap.models import db, Transaction
from datetime import datetime, timedelta

report_bp = Blueprint('report', __name__)

@report_bp.route('/report/monthly/<int:user_id>', methods=['GET'])
def monthly_report(user_id):
    now = datetime.utcnow()
    last_month = now - timedelta(days=30)

    transactions = Transaction.query.filter_by(user_id=user_id).filter(Transaction.date >= last_month).all()

    total_income = sum([x.amount for x in transactions if x.amount > 0])
    total_expense = sum([x.amount for x in transactions if x.amount < 0])
    balance = total_income + total_expense

    return jsonify(total_income=total_income, total_expense=total_expense, balance=balance), 200 
