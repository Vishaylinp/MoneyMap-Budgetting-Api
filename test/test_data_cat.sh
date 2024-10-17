# Replace <your_jwt_token> with the JWT received from the login response
TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcyOTE1NzQ4MSwianRpIjoiNzc4N2MxMzMtOWExYi00MzM4LTgyZWQtNmQxYWI5NGE2YjgwIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MSwibmJmIjoxNzI5MTU3NDgxLCJleHAiOjE3MjkxNTgzODF9.ZAd2FDw67igrzrTa7IbtN31W8rt_eP84l-yCL08cv8A"
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
curl -X PUT http://localhost:5000/categories/$CATEGORY_ID \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "category_name": "new_category_name"
}'

# delete a category
curl -X DELETE http://localhost:5000/categories/$CATEGORY_ID \
-H "Authorization: Bearer $TOKEN"


#create wealth budget /50/30/20 rule
curl -X POST http://localhost:5000/wealth-budget \
-H "Content-Type: application/json" \
-d '{
    "income": 3000
}'
