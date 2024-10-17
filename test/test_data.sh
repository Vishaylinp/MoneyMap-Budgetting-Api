##!/bin/bash

# Replace <your_jwt_token> with the JWT received from the login response
TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcyOTE1NzQ4MSwianRpIjoiNzc4N2MxMzMtOWExYi00MzM4LTgyZWQtNmQxYWI5NGE2YjgwIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MSwibmJmIjoxNzI5MTU3NDgxLCJleHAiOjE3MjkxNTgzODF9.ZAd2FDw67igrzrTa7IbtN31W8rt_eP84l-yCL08cv8A"
USER_ID="1"
TRANSACTION_ID="6"
# Adding transactions
curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": 1000,
    "category": "income"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -200,
    "category": "food"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -150,
    "category": "entertainment"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -300,
    "category": "bills"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -800,
    "category": "rent"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -100,
    "category": "clothing"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -50,
    "category": "entertainment"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -20,
    "category": "food"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -500,
    "category": "bills"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -75,
    "category": "clothing"
}'

# Adding transactions
curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": 1000,
    "category": "income"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -200,
    "category": "food"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -150,
    "category": "entertainment"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -300,
    "category": "bills"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -800,
    "category": "rent"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -100,
    "category": "clothing"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -50,
    "category": "entertainment"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -20,
    "category": "food"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -500,
    "category": "bills"
}'

curl -X POST http://localhost:5000/transactions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -75,
    "category": "clothing"
}'


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

#get report
curl -X GET http://127.0.0.1:5000/report/monthly \
     -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json"
