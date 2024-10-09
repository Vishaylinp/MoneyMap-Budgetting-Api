import json

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
