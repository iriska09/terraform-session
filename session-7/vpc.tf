resource "aws_default_vpc" "main" {
  tags = merge(
    { Name = replace(local.name, "rtype", "vpc") },
    local.common_tags

  )

}

resource "aws_default_subnet" "public_subnet_1" {
  availability_zone = "us-east-1e"
  tags = merge(
    { Name = replace(local.name, "rtype", "public_subnet1") },
    local.common_tags

  )
}

resource "aws_default_subnet" "public_subnet_2" {
  availability_zone = "us-east-1b"
  tags = merge(
    { Name = replace(local.name, "rtype", "public_subnet2") },
    local.common_tags

  )
}