##!/bin/bash

# Replace <your_jwt_token> with the JWT received from the login response
TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcyOTA4NTk1OSwianRpIjoiZTU2ZTNkYjMtMThmYy00ZmM4LTkzMWQtOWFkNDRhYzQ1MDUxIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MSwibmJmIjoxNzI5MDg1OTU5LCJleHAiOjE3MjkwODY4NTl9.E5fLhd9FcU7CSx91SpAiM87wL6XPW_d2NvrltpeE1No"

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
curl -X GET http://localhost:5000/transactions/<user_id> \
-H "Authorization: Bearer $TOKEN"

#update a Transaction
curl -X PUT http://localhost:5000/transactions/<transaction_id> \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -120,
    "category": "food"
}'

#delete a Transaction
curl -X DELETE http://localhost:5000/transactions/<transaction_id> \
-H "Authorization: Bearer $TOKEN"
