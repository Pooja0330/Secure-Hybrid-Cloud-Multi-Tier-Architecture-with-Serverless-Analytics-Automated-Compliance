# 3_Database_Layer

## Overview
This folder provisions the database tier for the hybrid cloud application:
- Database Subnet Group spans private subnets for secure isolation
- Amazon RDS MySQL instance with Multi-AZ and backup enabled
- Security Group allowing only App tier to access the DB port (3306)

## Templates

- `rds-subnet-group.yaml`  
  Creates RDS subnet group including private subnets for DB placement.

- `database-security-group.yaml`  
  Creates security group allowing inbound DB traffic only from App tier.

- `rds-instance.yaml`  
  Provisions the RDS instance using subnet group and security group.

## Deployment order & instructions

1. Deploy `rds-subnet-group.yaml` with private subnet IDs:

   ```bash
   aws cloudformation deploy --template-file rds-subnet-group.yaml --stack-name DBSubnetGroup \
     --parameter-overrides PrivateSubnetIds=<Private_Subnet1_Id>,<Private_Subnet2_Id> \
     --capabilities CAPABILITY_NAMED_IAM
