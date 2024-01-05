
export SECRET_KEY=abc123
export DEBUG=True
export DEVELOPMENT_MODE=True
export DOMAIN='127.0.0.1'
export AUTH_COOKIE_SECURE=False
export REDIRECT_URLS='http://127.0.0.1/auth/google'
export AWS_SES_ACCESS_KEY_ID=$1
export AWS_SES_SECRET_ACCESS_KEY=$2
export AWS_SES_REGION_NAME=$3
export AWS_SES_FROM_EMAIL=$4
export GOOGLE_AUTH_KEY=$5
export GOOGLE_AUTH_SECRET_KEY=$6
export ALLOWED_HOSTS=$7


COMPOSE_DOCKER_CLI_BUILD=0 DOCKER_BUILDKIT=0 docker compose -f docker-compose.dev.yml up -d --build

# make sure the postgres container is ready, then run migrations
sleep 10
docker exec jwt-auth-template-api-1 python /src/manage.py makemigrations 
docker exec jwt-auth-template-api-1  python /src/manage.py migrate