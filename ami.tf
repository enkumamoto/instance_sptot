resource "aws_instance" "ami_instance" {
  ami = "ami-xxxxxx" // ID da AMI template existente
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  tags = {
    Name = "ami-instance"
  }
}
