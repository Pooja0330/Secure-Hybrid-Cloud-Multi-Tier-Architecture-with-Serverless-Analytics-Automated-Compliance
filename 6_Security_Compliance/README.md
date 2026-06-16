Overview
This step enhances your hybrid cloud security with:

IAM roles and least privilege policies
KMS keys for encryption
Network ACLs for subnet traffic control
AWS Config rules for continuous compliance monitoring
Deployment Instructions
Run these commands in order, replacing placeholders as needed:

# 1. Deploy IAM roles and policies
aws cloudformation deploy --template-file iam-roles-policies.yaml --stack-name Step6-IAM-Roles

# 2. Deploy KMS keys
aws cloudformation deploy --template-file kms-keys.yaml --stack-name Step6-KMS-Keys

# 3. Deploy Network ACLs (Update VPC ID inside template first)
aws cloudformation deploy --template-file network-acl.yaml --stack-name Step6-Network-ACL

# 4. Deploy AWS Config rules
aws cloudformation deploy --template-file aws-config-rules.yaml --stack-name Step6-AWS-Config

**Best Practices**
Adjust IAM policies carefully; follow least privilege principle
Rotate your KMS keys regularly
Test Network ACL changes in a staging environment before production
Monitor AWS Config for compliance drift and address violations promptly
Notes
Update values like VPC ID in network-acl.yaml before deployment
Add or customize AWS Config rule
