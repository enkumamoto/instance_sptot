resource "aws_subnet" "subnet" {
  vpc_id = var.vpc_id
  cidr_block = "10.0.1.0/24" // Substitua pelo bloco CIDR da sua sub-rede pública
  availability_zone = "${var.region}a"
  tags = {
    Name = "example-subnet"
  }
}
