resource "aws_subnet" "private-ap-south-2a" {
  vpc_id            = aws_vpc.nvvr.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "ap-south-2a"

  tags = {
    "Name"                            = "private-ap-south-2a"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/nvvr"      = "owned"
  }
}

resource "aws_subnet" "private-ap-south-2b" {
  vpc_id            = aws_vpc.nvvr.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "ap-south-2a"
  

  tags = {
    "Name"                            = "private-ap-south-2b"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/nvvr"      = "owned"
  }
}

resource "aws_subnet" "public-ap-south-2a" {
  vpc_id                  = aws_vpc.nvvr.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "ap-south-2a"
  

  tags = {
    "Name"                       = "public-ap-south-2a"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/nvvr" = "owned"
  }

  map_public_ip_on_launch = true
}

resource "aws_subnet" "public-ap-south-2b" {
  vpc_id                  = aws_vpc.nvvr.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "ap-south-2b"
  

  tags = {
    "Name"                       = "public-ap-south-2b"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/nvvr" = "owned"
  }

  map_public_ip_on_launch = true
}
