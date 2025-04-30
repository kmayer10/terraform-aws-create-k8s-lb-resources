output "lb_dnsname" {
  description = "DNS name of the load balancer"
  value       = aws_lb.aws_lb.dns_name
}