{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "resources": [
    {
      "type": "Microsoft.Network/loadBalancers",
      "apiVersion": "2020-06-01",
      "name": "myInternalLoadBalancer",
      "location": "[resourceGroup().location]",
      "properties": {
        "frontendIPConfigurations": [
          {
            "name": "LoadBalancerFrontend",
            "properties": {
              "privateIPAddress": "10.0.0.10",
              "privateIPAllocationMethod": "Static",
              "subnet": {
                "id": "[resourceId('Microsoft.Network/virtualNetworks/subnets', 'myVnet', 'Subnet1')]"
              }
            }
          }
        ],
        "backendAddressPools": [
          {
            "name": "BackendPool"
          }
        ]
      }
    },
    {
      "type": "Microsoft.Network/loadBalancers",
      "apiVersion": "2020-06-01",
      "name": "myExternalLoadBalancer",
      "location": "[resourceGroup().location]",
      "properties": {
        "frontendIPConfigurations": [
          {
            "name": "LoadBalancerFrontend",
            "properties": {
              "publicIPAddress": {
                "id": "[resourceId('Microsoft.Network/publicIPAddresses', 'myPublicIP')]"
              }
            }
          }
        ],
        "backendAddressPools": [
          {
            "name": "BackendPool"
          }
        ]
      },
      "dependsOn": [
        "[resourceId('Microsoft.Network/publicIPAddresses', 'myPublicIP')]"
      ]
    },
    {
      "type": "Microsoft.Network/publicIPAddresses",
      "apiVersion": "2020-06-01",
      "name": "myPublicIP",
      "location": "[resourceGroup().location]",
      "properties": {
        "publicIPAllocationMethod": "Dynamic"
      }
    }
  ]
}
