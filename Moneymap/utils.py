import json
from datetime import datetime, timedelta
from collections import defaultdict
from Moneymap.models import Transaction

def wealth_budget_split(income):
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
    end_date = datetime.now()
    start_date = end_date - timedelta(days=30)

    total_spending = 0
    income = 0
    category_totals = defaultdict(float)

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

    return {
        'username': user.username,
        'income': income,
        'total_spend': abs(total_spending),
        'breakdown': breakdown,
        'amount_saved': amount_saved
    }
