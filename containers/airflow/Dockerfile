FROM apache/airflow:2.5.3
# lets us import from folders inside /src/loader directly
ENV PYTHONPATH=/opt/airflow
WORKDIR /airflow

COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt

# ENTRYPOINT [ "/containers/scripts/entrypoint.sh" ]








# FROM python:3.10-slim

# # this is the starting directory inside the container
# WORKDIR /opt/sde/

# # lets us import from folders inside /src/loader directly
# ENV PYTHONPATH=/opt/sde

# # install python requirements
# COPY requirements.txt requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

# # copy over the entire code folder to docker
# COPY ../.. /opt/sde
