terraform {
  backend "s3" {
    bucket = "my-alt-jenkins-bucket"
    region = "us-east-1"
    key = "eks/terraform.tfstate"
  }
}