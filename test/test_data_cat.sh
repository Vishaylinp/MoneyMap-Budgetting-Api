#!/bin/bash
# Replace <your_jwt_token> with the JWT received from the login response
TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcyOTY3NTg5NiwianRpIjoiMWZiM2FmOWUtMGRmZC00MzMzLWE5MjAtOGRhZDA3OTZiOTAwIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImFhNDhjNDM0LWJkYzItNGY4My04M2IzLWEwODFkYzI4YzQyNCIsIm5iZiI6MTcyOTY3NTg5NiwiZXhwIjoxNzI5Njc2Nzk2fQ.ILm9DkvgOFYx9agz5yBuqWfqHxpPrL6Y6h0iqV9m35s"
CATEGORY_ID="10"

# Adding default categories
curl -X POST http://localhost:5000/categories \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "category_name": "income"
}'

curl -X POST http://localhost:5000/categories \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "category_name": "food"
}'

curl -X POST http://localhost:5000/categories \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "category_name": "entertainment"
}'

curl -X POST http://localhost:5000/categories \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "category_name": "bills"
}'

curl -X POST http://localhost:5000/categories \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "category_name": "rent"
}'

curl -X POST http://localhost:5000/categories \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "category_name": "clothing"
}'

# Adding additional categories
curl -X POST http://localhost:5000/categories \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "category_name": "transport"
}'

curl -X POST http://localhost:5000/categories \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "category_name": "health"
}'

curl -X POST http://localhost:5000/categories \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "category_name": "education"
}'

curl -X POST http://localhost:5000/categories \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "category_name": "travel"
}'

# Fetch Categories
curl -X GET http://localhost:5000/categories \
-H "Authorization: Bearer $TOKEN"

# update a category
#curl -X PUT http://localhost:5000/categories/$CATEGORY_ID \
#-H "Content-Type: application/json" \
#-H "Authorization: Bearer $TOKEN" \
#-d '{
#    "category_name": "new_category_name"
#}'

# delete a category
#curl -X DELETE http://localhost:5000/categories/$CATEGORY_ID \
#-H "Authorization: Bearer $TOKEN"


#create wealth budget /50/30/20 rule
curl -X POST http://localhost:5000/wealth-budget \
-H "Content-Type: application/json" \
-d '{
    "income": 3000
}'
