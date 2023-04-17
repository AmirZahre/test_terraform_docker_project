include .env

####################################################################################################################
# General setup of containers
docker-spin-up:
	docker compose --env-file .env up airflow-init && docker compose --env-file .env up --build -d

perms:
	sudo mkdir -p logs plugins temp dags tests && sudo chmod -R u=rwx,g=rwx,o=rwx logs plugins temp dags tests

up: perms docker-spin-up

down:
	docker compose --env-file .env down --volumes --rmi all

####################################################################################################################
# Testing, auto formatting, type checks, & Lint checks
# format:
# 	docker exec loader python -m black -S --line-length 79 .

# isort:
# 	docker exec loader isort .

# pytest:
# 	docker exec loader pytest tests

# lint: 
# 	docker exec loader flake8 /opt/sde

# type:
# 	docker exec webserver mypy --ignore-missing-imports /opt/airflow

# ci: isort format type lint pytest

####################################################################################################################
# Set up cloud infrastructure

infra-init:
	terraform -chdir=./terraform init

infra-up:
	terraform -chdir=./terraform apply

infra-down:
	terraform -chdir=./terraform destroy

infra-config:
	terraform -chdir=./terraform output

infra-public:
	terraform -chdir=./terraform output -raw ec2_public_dns

infra-private:
	terraform -chdir=./terraform output -raw private_key

