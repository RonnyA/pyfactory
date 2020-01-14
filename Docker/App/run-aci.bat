REM First create SP - https://docs.microsoft.com/en-us/azure/container-registry/container-registry-auth-aci
REM Set variables SP_APP_ID and SP_PASSWD 

REM APPNAME should be unique pr Python app, and also the corresponding imagename

SET APPNAME=4sub1
SET IMAGENAME=4sub1.azurecr.io/samples/py-app:latest

REM create container
az container create --resource-group 4sub1 --name app-%APPNAME% --image %IMAGENAME% --cpu 1 --memory 1 --restart-policy OnFailure --registry-login-server 4sub1.azurecr.io --registry-username %SP_APP_ID% --registry-password %SP_PASSWD%  --dns-name-label app-%APPNAME% --ports 80

REM Query container FQDN IP
az container show --resource-group 4sub1 --name app-%APPNAME% --query ipAddress.fqdn

REM when state is "Terminated" you can query the logs
az container show --resource-group 4sub1 --name app-%APPNAME% --query containers[0].instanceView.currentState.state

REM Query container status (Should be "Running" while its running, and "Succeeded" when done)
az container show --resource-group 4sub1 --name app-%APPNAME% --query instanceView.state

REM get output (this should really be automaticlly stored in a persistent volume - either through mount or using Azure SDK for BLOB )
az container logs --resource-group 4sub1 --name app-%APPNAME%

REM Shutdown container group (NB! not needed when use OnFailre as it runs only once and then terminates)
REM az container stop --resource-group 4sub1 --name app-%APPNAME%

REM Delete container group
REM az container delete  --resource-group 4sub1 --name app-%APPNAME% --yes
