# Template for Prefect Flows

Run these commands to setup your project locally.

1. Create a new repository with the template
2. Clone and navigate to the repository
3. Create an .env file with the following variables:

    ```
    WAREHOUSE_USER=postgres
    WAREHOUSE_PASSWORD=password
    WAREHOUSE_DB=warehouse
    WAREHOUSE_HOST=warehouse
    WAREHOUSE_PORT=5432

    PREFECT_API_KEY=<YOUR API KEY>
    PREFECT_WS=<YOUR WORKSPACE>
    ```

4. Use the following `Makefile` commands to spin up and test the repo:
    ```shell
    # Build containers & test
    make up # Spin up the containers

    make pytest # Run all the test files under /tests

    make hello_world # runs the Prefect pipeline

    make hello_world_deploy # deploys the Prefect pipeline

    make prefect_agent # spins up a Prefect Agent to run the pipeline via. Prefect Cloud

    make ci # test as part of a CI pipeline

    make down # spins down the containers
    ```