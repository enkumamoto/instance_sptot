resource "aws_iam_role" "instance_role_spot" {
  name = "example-instance-role-spot"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "spot.amazonaws.com"
        }
      }
    ]
  })
}
