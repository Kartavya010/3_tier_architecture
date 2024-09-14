# Getting the DNS of load balancer
output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.infra_suplierX_LoadBalancer.dns_name
}

output "vpc_id"{
  description = "final output that shown vpc-id"
  value = aws_vpc.infra_suplierXvpc.id
}