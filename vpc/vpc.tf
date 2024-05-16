// VPC creation
resource "aws_vpc" "mvpc" {
  cidr_block       = "10.0.0.0/16"


  tags = {
    Name = "mvpc"
  }
}

// Public subnets 

resource "aws_subnet" "public-1" {
  vpc_id            = aws_vpc.mvpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"  

  tags = {
    Name = "public-1"
  }
}

resource "aws_subnet" "public-2" {
  vpc_id            = aws_vpc.mvpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"  

  tags = {
    Name = "public-2"
  }
}


resource "aws_subnet" "public-3" {
  vpc_id            = aws_vpc.mvpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"  

  tags = {
    Name = "public-3"
  }
}

// Private subnets
resource "aws_subnet" "private-1" {
  vpc_id            = aws_vpc.mvpc.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "us-east-1a"  

  tags = {
    Name = "private-1"
  }
}

resource "aws_subnet" "private-2" {
  vpc_id            = aws_vpc.mvpc.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "us-east-1b"  

  tags = {
    Name = "private-2"
  }
}


resource "aws_subnet" "private-3" {
  vpc_id            = aws_vpc.mvpc.id
  cidr_block        = "10.0.13.0/24"
  availability_zone = "us-east-1c"  

  tags = {
    Name = "private-3"
  }
}

// Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.mvpc.id

  tags = {
    Name = "internet-gw"
  }
}

// Nat Gateway
resource "aws_eip" "example" {

}


resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.public-1.id

  tags = {
    Name = "NAT-gw"
  }

}
// Public Routr Table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.mvpc.id

  tags = {
    Name = "public-rt"
  }
}

// Private Route Table
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.mvpc.id


  tags = {
    Name = "private-rt"
  }
}

// Public Route Table association
resource "aws_route_table_association" "pub-route-ass1" {
  subnet_id      = aws_subnet.public-1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "pub-route-ass2" {
  subnet_id      = aws_subnet.public-2.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "pub-route-ass3" {
  subnet_id      = aws_subnet.public-3.id
  route_table_id = aws_route_table.public-rt.id
}

// Private Route Table Association

resource "aws_route_table_association" "priv-route-ass1" {
  subnet_id      = aws_subnet.private-1.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "priv-route-ass2" {
  subnet_id      = aws_subnet.private-2.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "priv-route-ass3" {
  subnet_id      = aws_subnet.private-3.id
  route_table_id = aws_route_table.private-rt.id
}


// Adding internet gw to route 

resource "aws_route" "InterRoute" {
  route_table_id            = aws_route_table.public-rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id 
}

// adding Nat gw to Route 

resource "aws_route" "NatRoute" {
  route_table_id            = aws_route_table.private-rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id =  aws_nat_gateway.ngw.id 
}