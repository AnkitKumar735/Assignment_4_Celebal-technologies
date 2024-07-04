#!/bin/bash

# Variables
resourceGroupName="myResourceGroupHubSpoke"
adminUsername="azureuser"
adminPassword="P@ssw0rd1234!"

# Get IP addresses of VMs
managementIP=$(az vm show --resource-group $resourceGroupName --name ManagementVnetVM --show-details --query publicIps --output tsv)
productionIP=$(az vm show --resource-group $resourceGroupName --name ProductionVnetVM --show-details --query publicIps --output tsv)
testingIP=$(az vm show --resource-group $resourceGroupName --name TestingVnetVM --show-details --query publicIps --output tsv)
developingIP=$(az vm show --resource-group $resourceGroupName --name DevelopingVnetVM --show-details --query publicIps --output tsv)

# Verify connectivity
echo "Pinging from ManagementVnetVM to other VMs..."
for ip in $productionIP $testingIP $developingIP; do
  sshpass -p $adminPassword ssh -o StrictHostKeyChecking=no $adminUsername@$managementIP "ping -c 4 $ip"
done
