from flask import jsonify, Blueprint
from Moneymap.models import db, Transaction
from datetime import datetime, timedelta
from flask_jwt_extended import jwt_required, get_jwt_identity
from Moneymap.utils import true_wealth_budget_split
from Moneymap.models import User, MonthlyReport
from sqlalchemy import func

report_bp = Blueprint('report', __name__)

@report_bp.route('/report/monthly', methods=['GET'])
@jwt_required()
def monthly_report():
    """
    Generate a monthly report for the authenticated user.

    Returns:
        dict: A dictionary containing the wealth budget split data for the user.

    Raises:
        None
    """
    current_user_id = get_jwt_identity()
    user = User.query.get(current_user_id)

    if not user:
        return jsonify(message="User not found."), 404

    today =  datetime.utcnow()
    report_start_date = datetime(today.year, today.month - 1 if today.day < 28 else today.month, 28)

     # Check if report exists for the period from the 28th of last month to today
    existing_report = MonthlyReport.query.filter(
        MonthlyReport.user_id == user.id,
        func.date(MonthlyReport.created_at) >= report_start_date
    ).first()

    if existing_report:
        report_data = true_wealth_budget_split(user)
        existing_report.report_data = report_data
        existing_report.updated_at = datetime.utcnow()
        db.session.commit()
        return jsonify({"message": "Monthly report updated", "report": report_data}), 200
    else:
        report_data = true_wealth_budget_split(user)
        new_report = MonthlyReport(user_id=user.id, report_data=report_data)
        db.session.add(new_report)
        db.session.commit()
        return jsonify({"message": "Monthly report created", "report": report_data}), 201
