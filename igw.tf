resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.nvvr.id

  tags = {
    Name = "nvvr-IGW"
  }
}