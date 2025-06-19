//VPC
resource "aws_vpc" "My-VPC" {
  cidr_block = var.vpc_cidr_range
}

//Public Subnet
resource "aws_subnet" "My-Public-Subnet" {
  vpc_id = aws_vpc.My-VPC.id
  cidr_block = var.Public_Subnet
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet"
  }
}

//Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.My-VPC.id
  tags = {
    Name = "Public IGW"
  }
}

//Elastic IP
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

//NAT Gateway
resource "aws_nat_gateway" "priv_nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.My-Public-Subnet.id
  tags = {
    Name = "Private NAT"
  }
}

//Public Route Table
resource "aws_route_table" "Public-Rt" {
  vpc_id = aws_vpc.My-VPC.id
  tags = {
    Name = "Public Rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "Public-rt-asso" {
  route_table_id = aws_route_table.Public-Rt.id
  subnet_id = aws_subnet.My-Public-Subnet.id
}

//Private Subnet
resource "aws_subnet" "My-Private-Subnet" {
  vpc_id = aws_vpc.My-VPC.id
  cidr_block = var.Private_Subnet
}

//Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.My-VPC.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.priv_nat.id
  }
}

resource "aws_route_table_association" "private_rt_asso" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id = aws_subnet.My-Private-Subnet.id
}

//Security Group
resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.My-VPC.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows SSH from anywhere (Change for security)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # HTTP access
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # HTTPS access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }

  tags = {
    Name = "EC2-SecurityGroup"
  }
}


//Public Subnet - EC2 Instance
resource "aws_instance" "my_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.My-Public-Subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = var.key_pair_name
  associate_public_ip_address = true 

  tags = {
    Name = "Public-EC2"
  }
}