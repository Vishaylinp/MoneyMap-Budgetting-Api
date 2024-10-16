# Replace <your_jwt_token> with the JWT received from the login response
TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcyOTA4NTk1OSwianRpIjoiZTU2ZTNkYjMtMThmYy00ZmM4LTkzMWQtOWFkNDRhYzQ1MDUxIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MSwibmJmIjoxNzI5MDg1OTU5LCJleHAiOjE3MjkwODY4NTl9.E5fLhd9FcU7CSx91SpAiM87wL6XPW_d2NvrltpeE1No"

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
curl -X PUT http://localhost:5000/categories/<category_id> \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "category_name": "new_category_name"  # New category name
}'

# delete a category
curl -X DELETE http://localhost:5000/categories/<category_id> \
-H "Authorization: Bearer $TOKEN"


#create wealth budget /50/30/20 rule
curl -X POST http://localhost:5000/wealth-budget \
-H "Content-Type: application/json" \
-d '{
    "income": 3000  # Replace with desired income value
}'
