resource "aws_ami_copy" "ami_copy" {
  name = "example-ami-copy"
  source_ami_id = "ami-xxxxxx" // ID da AMI template existente
}

