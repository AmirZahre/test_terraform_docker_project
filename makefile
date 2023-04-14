up:
	docker compose --env-file .env up --build -d

down:
	docker compose --env-file .env down

### Run & Deploy Pipeline
hello_world:
	docker exec loader python3 src/flow_1/hello_world.py

hello_world_deploy:
	docker exec loader python3 src/flow_1/deployment.py

# Spin up Local Agent
prefect_agent:
	docker exec loader prefect agent start --pool default-agent-pool

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