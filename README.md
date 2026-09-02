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
export AWS_ACCESS_KEY_ID="ASIAYWVTVGGLAULESUIQ"
export AWS_SECRET_ACCESS_KEY="Q7S15Ccp2v0dtXpg8UhszmMhWhruHMhGfP8MKq98"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJHMEUCIQCH0NvF/ZcijajNBIgZo47cbdnQJJmNVk8bebRuq8AslQIgapF/YKIlPRCcIe7JwBlSn90zwY/8AaupzD6NNcEIKe0qwQIIzP//////////ARABGgw1OTg0NTA5NzUxMjYiDJRC4/zQCAYNJ3YngSqVAvL7KFUJBm4sdqGRq60IS+Dsk7HFETs4rt6dIZ++JcpTF5Ow2OLOpGYlUrZojxtX4jDnndI+XaD2h35qrbL7Yt5wOPf2Ge4KDQIRRJzeQPJCszHkKrtnvXzwtgVPqw97ceYt+wKfK+QTV59fJ5crMjKuhWROBBFR4xDRS9mx5MoEob8/oZqVPWwbgxxZg0K3lG44ZdxYUGitgLCSBs74v1tKBewZhqbRq+Teu4v/9XyJxxBsazig/JzyzBw3TOch9OUPKO8S8d5sjqM1gKf1TVXKnZtHN9yiM3Hf6DqIOISk78qkdA5Gkm0awTTgTKE0ffNpgXgXu5c7E+a8+5RATe0+dbVreDW8nc6iVRGVE3i86fgpg1Iw7eHh1AY6nQHTM3sgNRVF215wX9NoHSPZTT2jOIMrCmJT99z1aJIXbvJ7kJMy/Iygp55Bqk+hg//Ub8ycOlL/eB27MuJFCMWkobmQH5yjTAuRbyQWCHkNF1jCbj7BsA4keCBz3hqPj7rx+QRMvvGKBLl5R8Unyla2NQNm1PJgnETpKmUb99EFD0MkeUZ8f8mbXpyTZM6si5AfB8KNAw3W8ANEo5DM"

# Run the container to execute terraform
docker run -it -e AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" -e AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" -e AWS_SESSION_TOKEN="$AWS_SESSION_TOKEN" -v ./:/workspace terraform-local:1.0 /bin/bash

# terraform commands
terraform init -backend-config="backend/dev-backend.tfvars"
use --reconfigure ### Usar somente para alterar ambientes

terraform plan -var-file="environments/dev.tfvars"

terraform apply -var-file="environments/dev.tfvars"

terraform plan -destroy -var-file="environments/dev.tfvars"
terraform destroy -var-file="environments/dev.tfvars"
