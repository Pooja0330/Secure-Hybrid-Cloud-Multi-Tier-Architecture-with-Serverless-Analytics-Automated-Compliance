# 4_Hybrid_Connectivity

## Overview
This step establishes secure VPN connectivity for hybrid architecture:
- Customer Gateway representing your on-premises VPN device
- Virtual Private Gateway attached to AWS VPC
- VPN Connection binding the two gateways
- Option for static or dynamic routing (BGP)

## Templates

- `customer-gateway.yaml`  
  Defines your on-premises gateway IP and BGP ASN.

- `virtual-private-gateway.yaml`  
  Creates AWS Virtual Private Gateway and attaches to your VPC.

- `vpn-connection.yaml`  
  Builds VPN Connection linking VGW and Customer Gateway.

## Deployment order & instructions

1. Deploy `customer-gateway.yaml` with your on-prem public IP and BGP ASN:

   ```bash
   aws cloudformation deploy --template-file customer-gateway.yaml --stack-name CustomerGateway \
     --parameter-overrides CustomerGatewayIP=<on-prem-public-ip> BgpAsn=65000 \
     --capabilities CAPABILITY_NAMED_IAM
