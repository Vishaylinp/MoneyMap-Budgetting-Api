##!/bin/bash
# Replace <your_jwt_token> with the JWT received from the login response
echo "please enter TOKEN:"
read TOKEN
echo "please enter USER_ID:"
read USER_ID

echo "adding transactions"
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

echo "getting transactions"
# Get all transactions
# Replace <user_id> with the actual user ID
curl -X GET http://localhost:5000/transactions/$USER_ID \
-H "Authorization: Bearer $TOKEN"

echo "updating transaction"
echo "please enter TRANSACTION_ID:"
read TRANSACTION_ID
#update a Transaction
curl -X PUT http://localhost:5000/transactions/$TRANSACTION_ID \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-d '{
    "amount": -120,
    "category": "food"
}'

echo "deleting transaction"
#delete a Transaction
curl -X DELETE http://localhost:5000/transactions/$TRANSACTION_ID \
-H "Authorization: Bearer $TOKEN"

echo "getting transactions"
# Get all transactions
# Replace <user_id> with the actual user ID
curl -X GET http://localhost:5000/transactions/$USER_ID \
-H "Authorization: Bearer $TOKEN"

echo "getting report"
#get report
curl -X GET http://127.0.0.1:5000/report/monthly \
     -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json"
