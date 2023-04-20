resource "aws_spot_instance_request" "spot_instance" {
  ami = "ami-xxxxxx" // ID da AMI template existente
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  tags = {
    Name = "spot-instance"
  }
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
  spot_price = "0.001" // Preço máximo por hora
  lifecycle {
    create_before_destroy = true
  }

  provisioner "local-exec" {
    command = "aws sqs send-message --queue-url ${aws_sqs_queue.queue.url} --message-body 'Hello World!'"
  }
}

resource "aws_iam_role_policy" "sqs_policy_spot" {
  name = "sqs-policy-spot"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sqs:SendMessage"
        ]
        Resource = aws_sqs_queue.queue.arn
      }
    ]
  })

  role = aws_iam_role.instance_role_spot.id
}
