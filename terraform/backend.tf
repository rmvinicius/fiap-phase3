terraform {
  backend "s3" {
    bucket         = "meu-bucket-terraform-state"
    key            = "infra/aula2/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}