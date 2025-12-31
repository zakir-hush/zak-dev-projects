# create a Target Group
resource "aws_lb_target_group" "flask_tg" {
  name     = "flask-tg"
  port     = 5000
  protocol = "TCP"
  vpc_id   = aws_vpc.datacenter_vpc.id

  health_check {
    protocol            = "TCP"
    interval            = 30
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

# Create a NLB
resource "aws_lb" "flask_nlb" {
  name               = "flask-nlb"
  internal           = true
  load_balancer_type = "network"
  subnets            = [aws_subnet.dc_public1_az1.id, aws_subnet.dc_public1_az2.id]
}


# Attach TG to NLB
resource "aws_lb_listener" "flask_listener" {
  load_balancer_arn = aws_lb.flask_nlb.arn
  port              = 5000
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.flask_tg.arn
  }
}



# Register EC2 instance with TG
resource "aws_lb_target_group_attachment" "flask_attachment" {
  target_group_arn = aws_lb_target_group.flask_tg.arn
  target_id        = aws_instance.flask.id
  port             = 5000
}


# Crate VPC endpoint service
resource "aws_vpc_endpoint_service" "flask_service" {
  acceptance_required = true
  network_load_balancer_arns = [aws_lb.flask_nlb.arn]
}
