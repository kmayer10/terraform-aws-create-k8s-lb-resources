variable "target_group_arn" {
  description = "ARN of the target group"
  type        = string
}
variable "nodes" {
  description = "List of nodes to attach to the target group"
  type        = list(string)
}
variable "port" {
  description = "Port for the target group"
  type        = number
}