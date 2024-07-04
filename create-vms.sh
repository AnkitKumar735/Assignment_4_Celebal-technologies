#!/bin/bash

# Variables
resourceGroupName="myResourceGroupHubSpoke"
location="eastus"
adminUsername="azureuser"
adminPassword="P@ssw0rd1234!"

# Create VMs in each VNet
for vnet in ManagementVnet ProductionVnet TestingVnet DevelopingVnet; do
  az vm create \
    --resource-group $resourceGroupName \
    --name ${vnet}VM \
    --vnet-name $vnet \
    --subnet default \
    --image UbuntuLTS \
    --admin-username $adminUsername \
    --admin-password $adminPassword
done
