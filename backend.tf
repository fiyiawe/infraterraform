terraform {
  backend "s3" {
    bucket = "myterraformstatebucket1212"
    key = "terraform1212.tfstate"
    region = "eu-west-2"
    dynamodb_table = "fiyiterraformstateblock"
  }
}
