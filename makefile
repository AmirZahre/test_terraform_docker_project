up:
	docker compose --env-file .env up airflow-init && docker compose --env-file .env up --build -d

down:
	docker compose --env-file .env down

# CI
format:
	docker exec loader python -m black -S --line-length 79 .

isort:
	docker exec loader isort .

pytest:
	docker exec loader pytest tests

lint: 
	docker exec loader flake8 /opt/sde

ci: isort format lint pytest