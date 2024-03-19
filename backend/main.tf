resource "aws_s3_bucket" "microservices_deploy" {
  bucket = var.microservices_bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "microservices_bucket_versioning" {
  #depends_on = [ aws_s3_bucket.microservices_deploy ]
  bucket = var.microservices_bucket_name
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "microservices_bucket_encryption" {
  #depends_on = [ aws_s3_bucket.microservices_deploy ]
  bucket = var.microservices_bucket_name
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
