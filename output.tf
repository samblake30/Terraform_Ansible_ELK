/*output "Elastic_Node_PublicIPs" {
  value = {
    for instance in aws_instance.Elasticec2_Node :
    instance.id => instance.public_ip
  }
}*/

output "Terraform_Node_PublicIP" {
  value = aws_instance.terraformec2.public_ip
}
