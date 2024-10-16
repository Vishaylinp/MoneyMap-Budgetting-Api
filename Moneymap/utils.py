import json
from datetime import datetime, timedelta
from collections import defaultdict
from Moneymap.models import Transaction

def wealth_budget_split(income):
    """
    This function takes in an income and returns a dictionary of the 50/30/20 split
    of the income into the following categories: Tithing, Living Expenses, Savings,
    Investments, Self-improvement, Luxuries, Charity, Emergency.

    Parameters:
    income (float): The income to be split
    Returns:
    dict: The dictionary of the split
    """
    percentages = {
        'Tithing': 0.10,
        'Living Expenses': 0.30,
        'Savings': 0.20,
        'Investments': 0.10,
        'Self-improvement': 0.10,
        'Luxuries': 0.05,
        'Charity': 0.05,
        'Emergency': 0.10
    }

    split = {category: income * percentages for category, percentages in percentages.items()}

    return split

def true_wealth_budget_split(user):
    """
    Calculate the wealth budget split for a user over the past 30 days.

    This function retrieves transactions for a given user within the last 30 days,
    calculates the total spending, income, and categorizes the spending into a breakdown
    by category. It also calculates the amount saved by the user.

    Parameters:
    user (User): The user object for whom the budget split is being calculated.

    Returns:
    dict: A dictionary containing the following keys:
        - 'username': The username of the user.
        - 'income': The total income of the user over the period.
        - 'total_spend': The absolute total spending of the user.
        - 'breakdown': A dictionary with categories as keys and a list containing
          the total amount spent and the percentage of total spending for each category.
        - 'amount_saved': The difference between income and total spending.
    """
    end_date = datetime.now()
    start_date = end_date - timedelta(days=30)

    total_spending = 0
    income = 0
    category_totals = defaultdict(float)

    # last 30 days
    transactions = Transaction.query.filter(
        Transaction.user_id == user.id,
        Transaction.date >= start_date,
        Transaction.date <= end_date
    ).all()

    for transaction in transactions:
        category_name = transaction.category.category_name
        amount = transaction.amount

        if category_name == 'income':
            income += amount
        else:
            abs_amount = abs(amount)
            total_spending += abs_amount
            category_totals[category_name] += abs_amount

    breakdown = {
        category: [amount, round((amount / total_spending * 100), 2) if total_spending > 0 else 0]
        for category, amount in category_totals.items()
    }

    amount_saved = income - total_spending

    result = {
        'amount_saved': amount_saved,
        'breakdown': breakdown,
        'total_spend': abs(total_spending),
        'income': income,
        'username': user.username,
    }

    return result
