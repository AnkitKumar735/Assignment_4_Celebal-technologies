#!/bin/bash

# Variables
resourceGroupName="myResourceGroup"
location="eastus"
appGatewayTemplate="application-gateway.json"

# Deploy Application Gateway
az deployment group create --resource-group $resourceGroupName --template-file $appGatewayTemplate

# Output Application Gateway information
az network application-gateway list --resource-group $resourceGroupName --output table
