#Create the Security group

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["My VPC"]
  }

}

resource "aws_security_group" "My_VPC_Security_Group_Elastic" {
  vpc_id = data.aws_vpc.selected.id

  dynamic "ingress" {
    for_each = var.sgingress_elastic_port
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = var.cidr_elastic
    }

  }

  tags = {
    Name        = "Elasticsearch Security Group"
    Description = "Elasticsearch Security Group"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}
