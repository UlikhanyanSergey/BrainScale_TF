#Application Load Balancer
resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.SecGroup.id]
  subnets            = [aws_subnet.Public1.id, aws_subnet.Public2.id]
}

# Listener for Application Load Balancer
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

# Target group for Application Load Balancer
resource "aws_lb_target_group" "target_group" {
  name     = "ALBtarget"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = aws_vpc.VPC_ECR.id

  health_check {
    protocol = "HTTP"
    path     = "/login"
    port     = "traffic-port"
    interval = 30
    timeout  = 10
  }
}


# Attachment 
resource "aws_autoscaling_attachment" "asg_attach3" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.target_group.arn
}