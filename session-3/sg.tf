resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow TLS inbound traffic and all outbound traffic"


  tags = {
    Name = "web"
  }
}

// How to Reference to Resource?
// In order to Referrence to Resource ,we use labels (first and second )
// syntax : first_label.secon_label.

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web.id
  count = 4
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = element( var.ports , count.index)
  ip_protocol = "tcp"
  to_port     = element( var.ports , count.index)
}


resource "aws_vpc_security_group_egress_rule" "example" {
  security_group_id = aws_security_group.web.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

}