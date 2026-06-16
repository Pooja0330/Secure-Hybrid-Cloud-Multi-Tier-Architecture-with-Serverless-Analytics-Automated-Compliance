#Make it executable: chmod +x deploy-step6.sh
#!/bin/bash
# deploy-step6.sh
# Script to deploy Step 6: Security & Compliance enhancements

set -e  # Exit on error

echo "Starting Step 6 deployment..."

echo "Deploying IAM Roles and Policies..."
aws cloudformation deploy --template-file iam-roles-policies.yaml --stack-name Step6-IAM-Roles

echo "Deploying KMS Keys..."
aws cloudformation deploy --template-file kms-keys.yaml --stack-name Step6-KMS-Keys

echo "Deploying Network ACLs... (Make sure VPC ID in template is updated)"
aws cloudformation deploy --template-file network-acl.yaml --stack-name Step6-Network-ACL

echo "Deploying AWS Config Rules..."
aws cloudformation deploy --template-file aws-config-rules.yaml --stack-name Step6-AWS-Config

echo "Step 6 deployment completed successfully!"

