# Create elastic IP that will be used for the nat-gateway in the publiic subnet az1
resource "aws_eip" "eip_for_nat_gateway_az1" {
   domain = "vpc" # Specifies that this EIP is for a VPC

  tags = {
    Name = "nat gateway az1 eip"
  }
}


# Create elastic IP that will be used for the nat-gateway in the publiic subnet az2
resource "aws_eip" "eip_for_nat_gateway_az2" {
   domain = "vpc" # Specifies that this EIP is for a VPC

  tags   = {
    Name = "nat gateway az2 eip"
  }
  
}

#create nat gateway in public subnet az1
resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.eip_for_nat_gateway_az1.id
  subnet_id = aws_subnet.public_subnet_az1.id

  tags    = {
    Name = "Nat gateway az1"
  }
  #tells terraform  to delete the nat gateway before deleting the internet gateway
depends_on = [aws_internet_gateway.internet_gateway]
  
}

#create nat gateway in public subnet az2
resource "aws_nat_gateway" "nat_gateway_az2" {
  allocation_id = aws_eip.eip_for_nat_gateway_az2.id
  subnet_id = aws_subnet.public_subnet_az2.id

  tags    = {
    Name = "Nat gateway az2"
  }
  #tells terraform  to delete the nat gateway before deleting the internet gateway
depends_on = [aws_internet_gateway.internet_gateway]
}

#create private route table in az1  and add route through the nat gateway az1
resource "aws_route_table" "private_route_table_az1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az1.id
  }

  tags = {
    Name = "private route table az1"
  }
}

  
#associate private app subnet az1 with private route table az1
resource "aws_route_table_association" "private_app_subnet_az1_route_table_az1_association" {
  subnet_id = aws_subnet.private_app_subnet_az1.id
  route_table_id = aws_route_table.private_route_table_az1.id
  
}

#associate private data subnet az1 with private route table az1
resource "aws_route_table_association" "private_data_subnet_az1_route_table_az1_association" {
  subnet_id = aws_subnet.private_data_subnet_az1.id
  route_table_id = aws_route_table.private_route_table_az1.id
  
}

#create private route table in az2  and add route through the nat gateway az2
resource "aws_route_table" "private_route_table_az2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az2.id
  }

  tags = {
    Name = "private route table az2"
  }
}

  
#associate private app subnet az2 with private route table az2
resource "aws_route_table_association" "private_app_subnet_az2_route_table_az2_association" {
  subnet_id = aws_subnet.private_subnet_az2.id
  route_table_id = aws_route_table.private_route_table_az2.id
  
}

#associate private data subnet az2 with private route table az2
resource "aws_route_table_association" "private_data_subnet_az2_route_table_az2_association" {
  subnet_id = aws_subnet.private_data_subnet_az2.id
  route_table_id = aws_route_table.private_route_table_az2.id
  
}