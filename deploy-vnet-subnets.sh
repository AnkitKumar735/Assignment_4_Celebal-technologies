#!/bin/bash

# Variables
resourceGroupName="myResourceGroup"
location="eastus"
vnetTemplate="vnet-subnets.json"

# Create Resource Group
az group create --name $resourceGroupName --location $location

# Deploy VNet with Subnets
az deployment group create --resource-group $resourceGroupName --template-file $vnetTemplate

# Output VNet information
az network vnet list --resource-group $resourceGroupName --output table
