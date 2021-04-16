resource "aws_autoscaling_group" "asg" {
  launch_configuration = aws_launch_configuration.lc.id
  availability_zones   = data.aws_availability_zones.all.names

  min_size = 2
  max_size = 5

  load_balancers    = [aws_elb.web-cluster.name]
  health_check_type = "ELB"

  tag {
    key                 = "Name"
    value               = "web-srv-cluster"
    propagate_at_launch = true
  }
}
