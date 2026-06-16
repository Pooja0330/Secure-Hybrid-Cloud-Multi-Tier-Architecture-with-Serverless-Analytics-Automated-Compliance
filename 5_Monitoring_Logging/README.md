# 5_Monitoring_Logging

## Overview
This step sets up centralized monitoring and logging to maintain visibility into your hybrid cloud environment using AWS CloudWatch:
- Alarms on EC2 and RDS CPU utilization for proactive response
- Centralized log groups for app and system logs
- Integration with CloudTrail for auditing (optional)
- Monitoring VPN tunnel status and load balancer access logs (enable in AWS console)

## Templates

- `cloudwatch-alarms.yaml`  
  Creates alarms on high CPU utilization for EC2 and RDS instances.

- `cloudwatch-log-group.yaml`  
  Defines a CloudWatch Logs group to collect application/system logs.

## Deployment instructions

1. Deploy CloudWatch Alarms providing resource identifiers:

   ```bash
   aws cloudformation deploy --template-file cloudwatch-alarms.yaml --stack-name CWAlarms \
     --parameter-overrides EC2InstanceId=<EC2_ID> DBInstanceId=<RDS_ID> \
     --capabilities CAPABILITY_NAMED_IAM
