terraform {
  backend "s3" {
    bucket = "fiyiterraformstatebucket1212"
    key = "terraform.tfstate"
    region = "eu-west-2"
    dynamodb_table = "fiyi_dynamodb_table"
  }
}
