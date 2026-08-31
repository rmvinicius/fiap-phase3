# Start
terraform init -backend-config=bootstrap/remote/backend-hmg.tfvars --reconfigure ### Usar somente para alterar ambientes
terraform plan -var-file="environment\hmg.tfvars"
terraform apply -var-file="environment\hmg.tfvars"

terraform plan -var=access_key=$AWS_ACCESS_KEY_ID -var=secret_key=$AWS_SECRET_ACCESS_KEY -var=token=$AWS_SESSION_TOKEN 

# Bucket S3 com versionamento e criptografia
aws s3api create-bucket --bucket meu-bucket-terraform-state --region us-east-1
aws s3api put-bucket-versioning --bucket meu-bucket-terraform-state \
  --versioning-configuration Status=Enabled
aws s3api put-bucket-encryption --bucket meu-bucket-terraform-state \
  --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'

# Tabela DynamoDB para lock
aws dynamodb create-table \
  --table-name terraform-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region us-east-1

  
# Review

main.tf
provider.tf = OK
variables.tf = OK
outputs.tf
backend.tf
modules/network
dev.tfvars