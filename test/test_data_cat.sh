#!/bin/bash
# Replace <your_jwt_token> with the JWT received from the login response

echo "please enter TOKEN:"
read TOKEN

echo "adding categories that already exist"
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

echo "adding additional new categories"
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

echo "fetching categories"
# Fetch Categories
curl -X GET http://localhost:5000/categories \
-H "Authorization: Bearer $TOKEN"

echo "please enter CATEGORY_ID:"
read CATEGORY_ID

echo "updating category"
# update a category
curl -X PUT http://localhost:5000/categories/$CATEGORY_ID \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "category_name": "new_category_name"
}'

echo "deleting category"
# delete a category
curl -X DELETE http://localhost:5000/categories/$CATEGORY_ID \
-H "Authorization: Bearer $TOKEN"

echo "fetching categories"
# Fetch Categories
curl -X GET http://localhost:5000/categories \
-H "Authorization: Bearer $TOKEN"

echo "creating wealth budget"
#create wealth budget /50/30/20 rule
curl -X POST http://localhost:5000/wealth-budget \
-H "Content-Type: application/json" \
-d '{
    "income": 3000
}'
