# Bucket S3 com versionamento e criptografia
export BUCKET_NAME="tfstate-tech-challenge-lab-aws"

aws s3api create-bucket --bucket $BUCKET_NAME --region us-east-1
aws s3api put-bucket-versioning --bucket $BUCKET_NAME \
  --versioning-configuration Status=Enabled
aws s3api put-bucket-encryption --bucket $BUCKET_NAME \
  --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'

# Tabela DynamoDB para lock
aws dynamodb create-table \
  --table-name terraform-dev-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region us-east-1

# Build local terraform image
docker build -t terraform-local:1.0 .

# Export AWS Lab variables
export AWS_ACCESS_KEY_ID="ASIAYWVTVGGLIN7MNF3D"
export AWS_SECRET_ACCESS_KEY="Pu3W3PgG9h5n34zpXM2L1swl8X03nslA8TRrNoxK"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJGMEQCIGthrQAbeB57fAGtpYZJIcOQ4ESeXr+iIGHcWUWguyiZAiBVzc+IagZJ6+gu8whKxmvYl8GPupF4u+8t9y0IM7xA+CrBAgjj//////////8BEAEaDDU5ODQ1MDk3NTEyNiIMKWeHKGhiQf/ED9fTKpUCO7zbJQWgpOqvZ1qmAs6LERcjJtH4k3whbH9ZO6VvFlx8G7W+H/ZXE05oW1iL7Fz9jVOmRBOuh13nDGr1V8IhTwnLd5Ms0qhkpOlTGj7N+Os6+NI+jZHC7qXmdNsct+PvgkuKugrD86Sp3eoaU0Sn/HLYDz4Yxl4rzptNcf4jYiv39DeXQ0BX7DIO+UAn4YnQrOo2rPe/tKY43wKl2r1C7VORllLnqfTh6J12ANskTvr0KZbt6Ty+Guvwo61ZuZfjQdf4GTIqc7D6rd9sksXrJlqrNBg8upq9PGE1vg3mXRwn7dtgoIb+3/nJCmpsUeuorgfGcvJVujOJ/KLDPuCHark4iEaITm1q8Qku7HTit8k38l1LQzDN3ebUBjqeAbSEqX7LDjNFvbVk+DImmnu5pSjmCxht6KI5TnEXZFpQPK3O78iGEY3JcnMmxyYVS9qu1YVS5KmPU5KyeSLR5NIgUEywHfgAQA3rCgr62Sf1GFBy1RXHJSJbmf+o6TACZDTgoZB66CMcfgQH2YuomsDwndngcDVNEWQHGz3mgLmHiHTkPxzjD1UU5q6/ZezWBru/n65xckIUflYCxIbY"

# Run the container to execute terraform
docker run -it -e AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" -e AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" -e AWS_SESSION_TOKEN="$AWS_SESSION_TOKEN" -v ./:/workspace terraform-local:1.0 /bin/bash

# terraform commands
terraform init -backend-config="backend/dev-backend.tfvars"
use --reconfigure ### Usar somente para alterar ambientes

terraform plan -var-file="environments/dev.tfvars"

terraform apply -var-file="environments/dev.tfvars"

terraform plan -destroy -var-file="environments/dev.tfvars"
terraform destroy -var-file="environments/dev.tfvars"
