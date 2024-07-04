#!/bin/bash

# Variables
resourceGroupName="myResourceGroupHubSpoke"
location="eastus"
hubSpokeTemplate="hub-spoke-vnets.json"

# Create Resource Group
az group create --name $resourceGroupName --location $location

# Deploy Hub and Spoke VNets
az deployment group create --resource-group $resourceGroupName --template-file $hubSpokeTemplate

# Output VNet information
az network vnet list --resource-group $resourceGroupName --output table
