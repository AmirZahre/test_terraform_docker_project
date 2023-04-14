from prefect import flow

from src.flow_1.tasks.task_1 import print_hello_task


@flow(name="Hello Flow")
def hello_world(name="world"):
    print_hello_task(name)


if __name__ == "__main__":
    hello_world()

