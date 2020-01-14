REM Requirements: Log in to ACR  https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-docker-cli

docker tag ronnya/py-app 4sub1.azurecr.io/samples/py-app
docker push 4sub1.azurecr.io/samples/py-app