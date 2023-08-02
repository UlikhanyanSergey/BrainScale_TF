# Autoscaling Group
resource "aws_autoscaling_group" "asg" {
  name_prefix               = "myasg-"
  desired_capacity          = 3
  max_size                  = 4
  min_size                  = 3
  vpc_zone_identifier       = [aws_subnet.Public1.id, aws_subnet.Public2.id]
  health_check_type         = "EC2"
  health_check_grace_period = 300
  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = aws_launch_template.my_launch_template.latest_version
  }


  # Instance Refresh
  instance_refresh {
    strategy                 = "Rolling"
    preferences {
      instance_warmup        = 300
      min_healthy_percentage = 50
    }
    triggers                 = ["desired_capacity"]
  }
  tag {
    key                      = "Owner"
    value                    = "S_Ulikhanyan"
    propagate_at_launch      = true
  }
}


# Launch Template Resource
resource "aws_launch_template" "my_launch_template" {
  name                   = "my-launch-template"
  description            = "My Launch template"
  image_id               = "ami-0ab1a82de7ca5889c"
  instance_type          = "t2.micro"
  iam_instance_profile {
    name = aws_iam_instance_profile.ecr_full_access_profile.name
  }
  vpc_security_group_ids = [aws_security_group.SecGroup.id]
  key_name               = "InternBrainScale-key"
  user_data              = filebase64("user_dataLaunchTemplate.sh")
  ebs_optimized          = false
  update_default_version = true
  tags = {
    Name = "AppServer"
  }
  }