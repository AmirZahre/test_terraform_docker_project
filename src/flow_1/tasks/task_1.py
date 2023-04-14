from prefect import task


@task
def print_hello_task(name):
    print(f"Hello {name}!")
