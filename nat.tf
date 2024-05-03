resource "aws_eip" "elastic" {
  vpc = true

  tags = {
    Name = "nvvr-eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.elastic.id
  subnet_id     = aws_subnet.public-ap-south-2a.id

  tags = {
    Name = "nvvr-nat"
  }

  depends_on = [aws_internet_gateway.igw]
}