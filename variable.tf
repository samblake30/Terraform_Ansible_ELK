variable "node-count" {
  type    = number
  default = 3
}
variable "instance-type" {
  default = "t2.micro"
}

variable "az" {
  default = "ap-south-1b"
}

variable "vpccidr" {
  default = "192.168.0.0/16"
}

variable "instancetenancy" {
  default = "default"
}

variable "dnssupport" {
  default = true
}

variable "dnshostname" {
  default = true
}

variable "subnetcidrblock" {
  default = "192.168.0.0/24"
}

variable "mappublicip" {
  default = true
}

variable "destinationcidrblock" {
  default = "0.0.0.0/0"
}

variable "sgingress_port" {
  type    = list(number)
  default = [22, 80, 8080]
}

variable "sgingress_elastic_port" {
  type    = list(number)
  default = [22, 80, 8080]
}


variable "cidr" {
  type    = list
  default = ["43.224.0.200/32", "192.168.0.0/24"]
}

variable "cidr_elastic" {
  type    = list
  default = ["43.224.0.200/32", "192.168.0.0/24"]
}

variable "keypair" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCMs/P+uI/akuXusckArMPNX1OluKmJ15sj++KWwdWfBqkJSMHyUzqOusOSx/Oe8hhrQ5LCnNMjzRJMJtZkUzRdwRLS/PeytjjIkwbxPXH/szULoD0K8RoptD9BFBblQJyjnFWYmb9lqXcaUAUQGMJc4W0kNhL3SL7LcnX/sEbt4uejZ8gXBP9wPQzEd6dzJoLoLkHMCoogId2mBFHCykJfh/Lg7G7raXNqt3Tg8hlcGe6uiKcAMROracJDvVYOyKnw6q1Xq1aB7E0Eise8Ib+d/PU2WNcO0lqDT4+20zlXjx1flBqFurUfty9T8fjee39Hh/i8CncPXAJ5Rdei+ZDP imported-openssh-key"
}
