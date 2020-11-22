data "aws_ami" "elastic_ami" {
  most_recent = true
  owners      = ["309956199498"]

  filter {
    name   = "name"
    values = ["RHEL-8.3.0_HVM-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["MY VPC SUBNET"]
  }
}


resource "aws_instance" "Elasticec2_Node" {
  count                  = var.node-count
  instance_type          = var.instance-type
  ami                    = data.aws_ami.elastic_ami.id
  subnet_id              = data.aws_subnet.selected.id
  private_ip             = var.privateip[count.index]
  vpc_security_group_ids = [aws_security_group.My_VPC_Security_Group_Elastic.id]
  key_name               = "rke"

  provisioner "local-exec" {
    command = "aws --profile default ec2 wait instance-status-ok --region ap-south-1 --instance-ids ${self.id}"
  }

  provisioner "local-exec" {
    command = "ansible-playbook --extra-vars 'passed_in_hosts=tag_Name_${self.tags.Name}' elastic-search.yml"
  }

  tags = {
    Name = join("_", ["Elastic_Node", count.index + 1])
  }

  depends_on = [aws_security_group.My_VPC_Security_Group_Elastic]
}
