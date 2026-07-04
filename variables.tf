variable "environment" {
  description = "The environment to deploy to"
  type        = string
  default     = "dev"
  
}

variable "region" {
  type = string
  default = "eu-north-1"
}





variable "allowed_vm_types" {
  type = set(string)
  default = [ "t3.micro", "t3.small", "t3.medium" ]
}

variable "s3_bucket_tags" {
  type = map(string)
  default = {
    Name = "My Bucket"
  }
}







variable "bucket_name_sets" {
  type = set(string)
  default = [ "my-unique-day08-12340", "my-unique-day08-56780" ]
}