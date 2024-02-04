resource "aws_s3_bucket" "example" {
  bucket_prefix = "test-bucket"

}

terraform {
  backend "s3" {
    bucket         = "lacp-managed-remote-backend"
    key            = "jenkins/s3/terraform.tfstate"
    region         = "us-east-1" # Change this to your desired region
    #dynamodb_table = "terraform_locks" # Optional: DynamoDB table for state locking

    encrypt        = true # Optional: Encrypt the state file at rest
    #kms_key_id     = "your-kms-key-id" # Optional: KMS key ARN for S3 server-side encryption

    # Specify profile if you're using a named AWS profile or set other AWS configuration here
    # profile = "your-named-profile"

    # Optionally, you can specify the role_arn to assume a role for accessing the S3 bucket
    # role_arn = "your-role-arn"

    # Specify versioning if you want to enable versioning for your state files
    # versioning {
    #   enabled = true
    # }
  }
}
