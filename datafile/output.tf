output "Elastic_Node_PublicIPs" {
  value = {
    for instance in aws_instance.Elasticec2_Node :
    instance.id => instance.public_ip
  }
}
