terraform {
  backend "s3" {
    bucket         = "terraformstate-terraform-deepseek-r1"
    key            = "terraform.tfstate"
    region         = "sa-east-1"
    encrypt        = true
    dynamodb_table = "terraform-deepseek-r1"
  }
}