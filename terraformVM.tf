data "aws_ami" "terraform_ami" {
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

resource "aws_instance" "terraformec2" {
  instance_type          = var.instance-type
  ami                    = data.aws_ami.terraform_ami.id
  subnet_id              = aws_subnet.My_VPC_Subnet.id
  vpc_security_group_ids = [aws_security_group.My_VPC_Security_Group.id]
  key_name               = aws_key_pair.Key_Pair.key_name

  tags = {
    Name = "Terrafrom Server"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum -y install python3-pip",
      "sudo yum install wget unzip vim -y && export AWS_DEFAULT_REGION=ap-south-1",
      "sudo wget https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.2_linux_amd64.zip",
      "sudo unzip terraform_0.12.2_linux_amd64.zip -d /usr/local/bin/ && sudo rm -rf terraform_0.12.2_linux_amd64.zip",
      "pip3 install awscli --user",
      "pip3 install ansible --user",
      "pip3 install boto3 --user",
      "mkdir deploy_iac_ansible && mkdir deploy_iac_ansible/ansible_templates/inventory_aws",
      "sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config",
      "sudo systemctl restart sshd"
    ]
    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("./datafile/rke.pem")
    }
  }

  provisioner "file" {
    source      = "datafile/"
    destination = "./deploy_iac_ansible"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./datafile/rke.pem")
      host        = self.public_ip
    }
  }
}
