resource "aws_vpc" "own_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "OwnVPC" 
  }
}

resource "aws_subnet" "own_pubsub" {
  vpc_id = aws_vpc.own_vpc.id
  cidr_block = "10.0.0.0/16"
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSub_Own"
  }
}

resource "aws_internet_gateway" "own_igw" {
  vpc_id = aws_vpc.own_vpc.id
  tags = {
    Name = "OwnIGW"
  }
}

resource "aws_route_table" "own_rt" {
  vpc_id = aws_vpc.own_vpc
  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.own_igw.id
  }
  tags = {
    Name = "Own_rt"
  }
}

resource "aws_route_table_association" "own_rt_asso" {
  route_table_id = aws_route_table.own_rt.id
  subnet_id = aws_subnet.own_pubsub.id
}

resource "aws_security_group" "own_sg" {
  vpc_id = aws_vpc.own_vpc.id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Own_sg"
  }
}