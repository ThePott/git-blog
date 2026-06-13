# POST

curl -X POST localhost:3000/users \
 -H "Content-Type: application/json" \
 -d '{"name":"Alice","email":"alice@example.com"}'

# PATCH

curl -X PATCH localhost:3000/users/1 \
 -H "Content-Type: application/json" \
 -d '{"name":"Bob"}'
