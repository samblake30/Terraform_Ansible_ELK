variable "node-count" {
  type    = number
  default = 3
}

variable "instance-type" {
  default = "t2.xlarge"
}

variable "sgingress_elastic_port" {
  type    = list(number)
  default = [22, 80, 8080, 9200, 9300]
}

variable "privateip" {
  type    = list
  default = ["192.168.0.30", "192.168.0.31", "192.168.0.32"]
}

variable "cidr_elastic" {
  type    = list
  default = ["43.224.0.200/32", "0.0.0.0/0", "192.168.0.0/24"]
}
