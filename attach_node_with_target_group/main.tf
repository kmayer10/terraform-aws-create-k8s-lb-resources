resource "aws_lb_target_group_attachment" "aws_lb_target_group_attachment" {
  count            = length(var.nodes)
  target_group_arn = var.target_group_arn
  target_id        = var.nodes[count.index]
  port             = var.port
}