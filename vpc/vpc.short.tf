// VPC creation
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"


  tags = {
    Name = "vpc"
  }
}

// Public Subnets

resource "aws_subnet" "public" {
  count = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = element (var.cidr_blocks_public , count.index)
  availability_zone = element (var.availability_zones , count.index  )
  tags = {
    Name = "public"
  }
}

// Private Subnets 

resource "aws_subnet" "private" {
  count = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = element (var.cidr_blocks_private , count.index)
  availability_zone = element (var.availability_zones , count.index  )

  tags = {
    Name = "private"
  }
}

// Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internet-gw"
  }
}

// Nat Gateway
resource "aws_eip" "main" {
  count = 3

}



resource "aws_nat_gateway" "ngw" {
  count = 3
  allocation_id = element (aws_eip.main.*.id , count.index)
  subnet_id     = element (aws_subnet.public.*.id , count.index)

  tags = {
    Name = "nat-gw"
  }
}

// Public route table 

resource "aws_route_table" "public_rt" {
  count = 3
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public-rt"
  }
}

// Private Route Table
resource "aws_route_table" "private_rt" {
  count = 3
  vpc_id = aws_vpc.main.id


  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "public_route_assoication" {
  count = 3
  subnet_id = element( aws_subnet.public.*.id, count.index)
  route_table_id = element(aws_route_table.public_rt.*.id , count.index)

}
resource "aws_route_table_association" "private_route_assoication" {
  count = 3
  subnet_id = element( aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private_rt.*.id , count.index)
}


// Adding Internet Gateway to Public Route Tables
resource "aws_route" "igw_route" {
  count = 3
  route_table_id         = element(aws_route_table.public_rt.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}


// Adding NAT Gateways to Private Route Tables
resource "aws_route" "ngw_route" {
  count = 3
  route_table_id         = element(aws_route_table.private_rt.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.ngw.*.id, count.index)
}