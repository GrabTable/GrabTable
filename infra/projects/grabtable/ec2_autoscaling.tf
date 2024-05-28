resource "aws_launch_template" "terraform_launch_template" {
  name_prefix            = "terraform-launch-template"
  image_id               = "ami-05db432abf706dc01"
  instance_type          = "t2.micro"
  key_name               = "bastion"
  user_data              = filebase64("launch-template/user_data.sh")
  vpc_security_group_ids = [aws_security_group.launch_wizard_1.id]

  iam_instance_profile {
    arn = aws_iam_instance_profile.ecs_instance_role_instance_profile.arn
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "terraform-container"
    }
  }
}

resource "aws_autoscaling_group" "terraform_autoscaling_group" {
  name                = "terraform-autoscaling-group"
  health_check_type   = "EC2"
  desired_capacity    = 1
  min_size            = 1
  max_size            = 3
  vpc_zone_identifier = [aws_subnet.private_subnet_1.id]

  launch_template {
    id      = aws_launch_template.terraform_launch_template.id
    version = aws_launch_template.terraform_launch_template.latest_version
  }

  tag {
    key                 = "AmazonECSManaged"
    propagate_at_launch = true
    value               = ""
  }
}

resource "aws_autoscaling_policy" "terraform_autoscaling_policy" {
  name                   = "terraform-autoscaling-policy"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.terraform_autoscaling_group.name

  // TODO: adjust metric to network load balancing
  target_tracking_configuration {
    target_value = 70
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
  }
}

resource "aws_ecs_capacity_provider" "terraform_ecs_capacity_provider" {
  name = "terraform-ecs-capacity-provider"
  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.terraform_autoscaling_group.arn
  }
}

resource "aws_ecs_cluster_capacity_providers" "ecs_api" {
  cluster_name       = aws_ecs_cluster.terraform_ecs_cluster.name
  capacity_providers = [aws_ecs_capacity_provider.terraform_ecs_capacity_provider.name]
}