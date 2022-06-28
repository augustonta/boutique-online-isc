##############################allow http##############################

resource "aws_security_group" "lb_allow_http" {
  name        = "lb_allow_http"
  description = "permit-80-sg"
  vpc_id      = aws_vpc.vpc-boutique-ae.id

  ingress = [
    {
      description      = "Allow http"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      description      = "egress any"
      prefix_list_ids  = []
      security_groups  = []
      self             = false
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]
  depends_on = [
    aws_vpc.vpc-boutique-ae
  ]
  tags = {
    Name = "sg_allow_http"
  }
}