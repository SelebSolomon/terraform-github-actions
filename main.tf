


resource "aws_s3_bucket" "example" {
  for_each= var.bucket_name_sets
  bucket = each.key

  tags = var.s3_bucket_tags
  depends_on = [ aws_s3_bucket.example ] 
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = [for bucket in aws_s3_bucket.example : bucket.bucket]

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}


resource "aws_s3_bucket_acl" "example" {
  for_each = aws_s3_bucket.example

  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = each.value.bucket
  acl    = "private"
}


resource "aws_s3_bucket_public_access_block" "example" {
  for_each = aws_s3_bucket.example

  bucket = each.value.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  for_each = aws_s3_bucket.example
  bucket = each.value.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0ebc281c20e89ba4b"
  instance_type = tolist(var.allowed_vm_types)[0]
  region = var.region

  tags = {
    Name = "HelloWorld"
    Environment = var.environment
  }
  lifecycle {
    prevent_destroy = true
    create_before_destroy = true
  }
}




