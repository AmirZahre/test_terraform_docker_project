from prefect.deployments import Deployment

from src.flow_1.hello_world import hello_world


def main():
    deployment = Deployment.build_from_flow(flow=hello_world, name="world")
    deployment.apply()


if __name__ == "__main__":
    main()
