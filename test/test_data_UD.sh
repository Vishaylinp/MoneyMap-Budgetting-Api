##!/bin/bash
# Replace <your_jwt_token> with the JWT received from the login response
TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcyOTY3NTg5NiwianRpIjoiMWZiM2FmOWUtMGRmZC00MzMzLWE5MjAtOGRhZDA3OTZiOTAwIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImFhNDhjNDM0LWJkYzItNGY4My04M2IzLWEwODFkYzI4YzQyNCIsIm5iZiI6MTcyOTY3NTg5NiwiZXhwIjoxNzI5Njc2Nzk2fQ.ILm9DkvgOFYx9agz5yBuqWfqHxpPrL6Y6h0iqV9m35s"
USER_ID="aa48c434-bdc2-4f83-83b3-a081dc28c424"
TRANSACTION_ID="bb947f8d-0177-4780-bde6-7c01a9f14589"
CATEGORY_ID="1f76d2c4-0d39-438e-ad03-92b9db6dcd12"

# Get all transactions
# Replace <user_id> with the actual user ID
curl -X GET http://localhost:5000/transactions/$USER_ID \
-H "Authorization: Bearer $TOKEN"

#update a Transaction
curl -X PUT http://localhost:5000/transactions/$TRANSACTION_ID \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -120,
    "category": "food"
}'

#delete a Transaction
curl -X DELETE http://localhost:5000/transactions/$TRANSACTION_ID \
-H "Authorization: Bearer $TOKEN"

# Get all transactions
# Replace <user_id> with the actual user ID
curl -X GET http://localhost:5000/transactions/$USER_ID \
-H "Authorization: Bearer $TOKEN"

# Fetch Categories
curl -X GET http://localhost:5000/categories \
-H "Authorization: Bearer $TOKEN"

# update a category
curl -X PUT http://localhost:5000/categories/$CATEGORY_ID \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "category_name": "new_category_name"
}'

# delete a category
curl -X DELETE http://localhost:5000/categories/$CATEGORY_ID \
-H "Authorization: Bearer $TOKEN"

# Fetch Categories
curl -X GET http://localhost:5000/categories \
-H "Authorization: Bearer $TOKEN"
