resource "aws_lb" "app_lb" {
  name               = "app-lb-${var.environment}" #Common names will give error when creating the resources in multiple environments
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = values(var.public-subnet_ids)

  enable_deletion_protection = false

  tags = {
    Name = "${var.project_name}-${var.environment}-alb"
  }
}

resource "aws_lb_target_group" "app_tg" {
  name     = "app-lb-tg-${var.environment}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled  = true
    protocol = "HTTP"
    path     = "/"
    port     = "traffic-port"
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-alb-tg"
  }
}

resource "aws_lb_target_group_attachment" "app-tg-attachment" {
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = var.aws_private_id
  port             = 80
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}
