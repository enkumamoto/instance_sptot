resource "aws_sqs_queue" "queue" {
  name = "example-queue"
}

resource "aws_iam_role_policy" "sqs_policy" {
  name = "sqs-policy"
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

  role = aws_iam_role.instance_role.id
}
