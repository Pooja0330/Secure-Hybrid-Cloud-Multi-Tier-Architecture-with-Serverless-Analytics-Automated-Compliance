# 2_Compute_AutoScaling

## Overview
This folder contains CloudFormation templates for deploying scalable compute resources:
- EC2 Launch Template defining instance configuration
- Auto Scaling Group to manage number of instances dynamically
- Application Load Balancer (ALB) to distribute traffic evenly

## Templates

- `launch-template.yaml`  
  Creates EC2 launch template with instance type, AMI, network, security groups.

- `auto-scaling.yaml`  
  Defines Auto Scaling Group using the launch template with min/max capacity.

- `load-balancer.yaml`  
  Creates Application Load Balancer, Target Group, and Listener configured on port 80.

## Deployment order & instructions

1. Deploy `launch-template.yaml`, pass parameters such as VPC ID, Subnets, Security Group, KeyPair.

    ```bash
    aws cloudformation deploy --template-file launch-template.yaml --stack-name LaunchTemplate \
      --parameter-overrides VpcId=<VPC_ID> SubnetIds=<Private_Subnet1_Id> KeyName=<KeyPair_Name> WebSecurityGroupId=<Web_SG_ID> \
      --capabilities CAPABILITY_NAMED_IAM
    ```

2. Deploy `load-balancer.yaml` providing VPC ID and public subnet IDs:

    ```bash
    aws cloudformation deploy --template-file load-balancer.yaml --stack-name LoadBalancer \
      --parameter-overrides VpcId=<VPC_ID> PublicSubnetIds=<Public_Subnet1_Id> \
      --capabilities CAPABILITY_NAMED_IAM
    ```

3. Deploy `auto-scaling.yaml` passing launch template ID, and private subnet IDs:

    ```bash
    aws cloudformation deploy --template-file auto-scaling.yaml --stack-name AutoScaling \
      --parameter-overrides LaunchTemplateId=<Launch_Template_ID> SubnetIds=<Private_Subnet1_Id> \
      --capabilities CAPABILITY_NAMED_IAM
    ```

4. **Manual Step:** Update the Auto Scaling Group to attach the Target Group ARN from ALB so your instances are registered for load balancing.

## Tips
- Modify instance type, AMI in launch-template.yaml as needed.
- Scale ASG min/max/desired capacities based on expected traffic.
- Configure security groups properly: ALB needs inbound HTTP(80), instances open for ALB SG.
- Consider adding HTTPS listener and certificates for secure traffic.

Happy Learning and scaling your cloud app!
