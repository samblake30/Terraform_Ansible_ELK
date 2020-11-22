#Create Route table

resource "aws_route_table" "My_VPC_Route_Table" {
  vpc_id = aws_vpc.My_VPC.id

  tags = {
    Name = "My VPC Route Table"
  }

}

resource "aws_route" "Route_Entry" {
  route_table_id         = aws_route_table.My_VPC_Route_Table.id
  destination_cidr_block = var.destinationcidrblock
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "My_VPC_Association" {
  subnet_id      = aws_subnet.My_VPC_Subnet.id
  route_table_id = aws_route_table.My_VPC_Route_Table.id
}
