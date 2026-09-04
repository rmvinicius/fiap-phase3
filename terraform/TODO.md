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
export AWS_ACCESS_KEY_ID="ASIAYWVTVGGLOUD5UJ22"
export AWS_SECRET_ACCESS_KEY="hUC2tffipA7qv0/vqF/5StZce+i3O/DPKwv652rM"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEC0aCXVzLXdlc3QtMiJGMEQCIBw8BgTDe2TOa/co4kB7NdLjWlUolxfOqy8KPP6kskGxAiBDCxfzQdGckewfcX3nQY1yY5zIjWepy5vIO/7pitUwhCrBAgj2//////////8BEAEaDDU5ODQ1MDk3NTEyNiIMWvIaAyDc+D/c0cfeKpUCYGT/+YMaw12Rrxg+Inj7ykmc32UwheR98ijClEYydRnBl7TPaCTlutalegqh2u0TKvDqI62yzzzceqdSJujg5+VAcuHO4RKS0BJH8BINtRxUPymXqIk2eZIXazhM+jpOLIBLkjqWGzxPddXXi8TMHy/dZn2qnnakPpnBMYQqrKAXaGXS/6x8PGLvNuE2mHhZT9I4wTkc4pUQwfdG+531pRRSZdJSDkUxJJWKiOXRcK1PveNc8WuRt1WZ8SO7HxRHeL0KoVeps9TzggN8e9cv8Z+UG6NR+ULHeJCfcQQdLRSoQm+4M46lh3e3aiHSkouD2Awm0n19vx/jkJzvgM+a2eqX9ys2nS8cjG0cdbDQfgRR6mdGdzCo8+rUBjqeAZzsxfUb54b6ABugCeqs/7GPc9aunxXaGLWET1YaJLTYQOcgJgf08K4VDF8BRXLACvuzYGWvxpuYvbwQI58TtqGA36FF+47NjytP8cEzIhiYzx4nT3x+fvW6U01DO42Nlr8l49b1wgzCi037HDVdjUs246E2F8BcPaEPPFnRFhmsk6cgDLhH6KANDHxHDucRes4531ZYz0Borhaf1pSQ"

# Run the container to execute terraform
docker run -it -e AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" -e AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" -e AWS_SESSION_TOKEN="$AWS_SESSION_TOKEN" -v ./:/workspace terraform-local:1.0 /bin/bash

# terraform commands
terraform init -backend-config="backend/dev-backend.tfvars"
use --reconfigure ### Usar somente para alterar ambientes

terraform validate

terraform plan -var-file="environments/dev.tfvars"

terraform apply -var-file="environments/dev.tfvars"

terraform plan -destroy -var-file="environments/dev.tfvars"
terraform destroy -var-file="environments/dev.tfvars"
