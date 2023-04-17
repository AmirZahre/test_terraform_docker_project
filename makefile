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
format:
	docker exec webserver python -m black -S --line-length 79 .

isort:
	docker exec webserver isort .

pytest:
	docker exec webserver pytest /opt/airflow/tests

lint: # omitted for now; experiencing issues with use in webserver container
	docker exec webserver flake8 /opt/airflow

type:
	docker exec webserver mypy --ignore-missing-imports /opt/airflow

ci: isort format type pytest

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

# for CD (github actions secret variables)
infra-public: # REMOTE_HOST
	terraform -chdir=./terraform output -raw ec2_public_dns

infra-private: # SERVER_SSH_KEY
	terraform -chdir=./terraform output -raw private_key

