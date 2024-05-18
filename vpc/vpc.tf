# // VPC creation
# resource "aws_vpc" "main" {
#   cidr_block       = "10.0.0.0/16"


#   tags = {
#     Name = "vpc"
#   }
# }

# // Public subnets 

# resource "aws_subnet" "public_1" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-east-1a"  

#   tags = {
#     Name = "private-1"
#   }
# }

# resource "aws_subnet" "public_2" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "us-east-1b"  

#   tags = {
#     Name = "public-2"
#   }
# }


# resource "aws_subnet" "public_3" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.3.0/24"
#   availability_zone = "us-east-1c"  

#   tags = {
#     Name = "public-3"
#   }
# }

# // Private subnets
# resource "aws_subnet" "private_1" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.11.0/24"
#   availability_zone = "us-east-1a"  

#   tags = {
#     Name = "private-1"
#   }
# }

# resource "aws_subnet" "private_2" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.12.0/24"
#   availability_zone = "us-east-1b"  

#   tags = {
#     Name = "private-2"
#   }
# }


# resource "aws_subnet" "private_3" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.13.0/24"
#   availability_zone = "us-east-1c"  

#   tags = {
#     Name = "private-3"
#   }
# }

# // Internet Gateway
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "internet-gw"
#   }
# }

# // Nat Gateway
# resource "aws_eip" "main" {

# }


# resource "aws_nat_gateway" "ngw" {
#   allocation_id = aws_eip.main.id
#   subnet_id     = aws_subnet.private_1.id

#   tags = {
#     Name = "nat-gw"
#   }

# }
# // Public Rout Table
# resource "aws_route_table" "public_rt" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "public-rt"
#   }
# }

# // Private Route Table
# resource "aws_route_table" "private_rt" {
#   vpc_id = aws_vpc.main.id


#   tags = {
#     Name = "private-rt"
#   }
# }

# // Public Route Table association
# resource "aws_route_table_association" "public_route_ass1" {
#   subnet_id      = aws_subnet.public_1.id
#   route_table_id = aws_route_table.public_rt.id
# }

# resource "aws_route_table_association" "public_route_ass2" {
#   subnet_id      = aws_subnet.public_2.id
#   route_table_id = aws_route_table.public_rt.id
# }

# resource "aws_route_table_association" "public_route_ass3" {
#   subnet_id      = aws_subnet.public_3.id
#   route_table_id = aws_route_table.public_rt.id
# }

# // Private Route Table Association

# resource "aws_route_table_association" "private_route_ass1" {
#   subnet_id      = aws_subnet.private_1.id
#   route_table_id = aws_route_table.private_rt.id
# }

# resource "aws_route_table_association" "private_route_ass2" {
#   subnet_id      = aws_subnet.private_2.id
#   route_table_id = aws_route_table.private_rt.id
# }

# resource "aws_route_table_association" "private_route_ass3" {
#   subnet_id      = aws_subnet.private_3.id
#   route_table_id = aws_route_table.private_rt.id
# }


# // Adding internet gw to route 

# resource "aws_route" "igw_route" {
#   route_table_id            = aws_route_table.public_rt.id
#   destination_cidr_block    = "0.0.0.0/0"
#   gateway_id = aws_internet_gateway.igw.id 
# }

# // adding Nat gw to Route 

# resource "aws_route" "ngw_route" {
#   route_table_id            = aws_route_table.private_rt.id
#   destination_cidr_block    = "0.0.0.0/0"
#   gateway_id =  aws_nat_gateway.ngw.id 
# }