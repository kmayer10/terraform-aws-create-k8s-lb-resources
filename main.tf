resource "aws_lb" "aws_lb" {
  name               = var.name
  internal           = false
  load_balancer_type = "network"
  security_groups    = var.security_groups
  subnets            = var.subnets
}

resource "aws_lb_target_group" "aws_lb_target_group" {
  count    = length(var.ports)
  name     = "${var.name}-target-group-${var.ports[count.index]}"
  port     = var.ports[count.index]
  protocol = "TCP"
  vpc_id   = var.vpc_id  
}

resource "aws_lb_listener" "aws_lb_listener" {
  count             = length(var.ports)
  load_balancer_arn = aws_lb.aws_lb.arn
  port              = var.ports[count.index]
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.aws_lb_target_group[count.index].arn
  }
}

module "attach_node_with_target_group" {
  count             = length(var.ports)
  source            = "./attach_node_with_target_group"
  target_group_arn  = aws_lb_target_group.aws_lb_target_group[0].arn
  nodes             = var.nodes
  port              = var.ports[count.index]
}