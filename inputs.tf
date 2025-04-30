variable "name" {
  description = "Name of the load balancer"
  type = string
}
variable "subnets" {
  description = "Subnets for the load balancer"
  type = list(string)
}
variable "security_groups" {
  description = "Security groups for the load balancer"
  type = list(string)
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "ports" {
  description = "Ports for the load balancer"
  type = list(number)
  default = [30000, 31000, 32000, 32123, 32767]
}
variable "nodes" {
  description = "List of nodes to attach to the target group"
  type        = list(string)
}