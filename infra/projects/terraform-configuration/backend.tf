resource "aws_s3_bucket" "terraform_state" {
  bucket = "grabtable-terraform-state"
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "terraform-state-lock"
  billing_mode = "PROVISIONED"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
