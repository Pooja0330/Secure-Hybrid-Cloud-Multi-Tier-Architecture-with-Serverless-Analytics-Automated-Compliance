# 1_VPC_Networking

## Overview
Setup the base VPC network infrastructure with public/private subnets, internet gateway, NAT gateways, and routing.

## Files & Purpose
- `vpc-setup.yaml`: Create VPC, public and private subnets, IGW, NAT Gateways.
- `route-tables.yaml`: Define route tables and associate subnets.
- `security-groups.yaml`: Define security groups for Web, App, DB tiers.

## Deployment Order
1. `vpc-setup.yaml`
2. `route-tables.yaml`
3. `security-groups.yaml`

Customize CIDR blocks and AZs as needed before deployment.
