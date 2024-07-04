# Assignment_4_Celebal-technologies
# Azure Infrastructure Deployment

This repository contains ARM templates and shell scripts to deploy and configure an Azure environment with the following:

1. A Virtual Network (VNet) with two subnets.
2. Four VNets configured in a Hub and Spoke architecture.
3. Internal and External Load Balancers.
4. An Azure Application Gateway.

## Deployment Steps

### 1. Create a VNet with Two Subnets

```bash
./deploy-vnet-subnets.sh
./deploy-hub-spoke.sh
./create-vms.sh
./verify-connectivity.sh
./deploy-load-balancers.sh
./deploy-application-gateway.sh
