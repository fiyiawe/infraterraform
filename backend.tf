terraform {
  backend "s3" {
    bucket = "myterraformstatebucket1212new"
    key = "terraform.tfstate"
    region = "eu-west-2"
    dynamodb_table = "fiyiterraformstateblock1212"
  }
}
