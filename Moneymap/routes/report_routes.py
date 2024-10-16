from flask import jsonify, Blueprint
from Moneymap.models import db, Transaction
from datetime import datetime, timedelta
from flask_jwt_extended import jwt_required, get_jwt_identity
from Moneymap.utils import true_wealth_budget_split
from Moneymap.models import User

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
    current_user_id = get_jwt_identity()  # Get the current user's identity
    user = User.query.get(current_user_id)  # Fetch user by ID

    if not user:
        return jsonify(message="User not found."), 404

    budget_split_data = true_wealth_budget_split(user)
    return jsonify(budget_split_data), 200
