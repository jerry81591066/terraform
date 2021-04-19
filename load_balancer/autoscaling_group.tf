resource "aws_autoscaling_group" "asg" {
  availability_zones = data.aws_availability_zones.all.names

  min_size = 2
  max_size = 5

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }

  load_balancers    = [aws_elb.web-cluster.name]
  health_check_type = "ELB"

  tag {
    key                 = "Name"
    value               = "web-srv-cluster"
    propagate_at_launch = true
  }
}
