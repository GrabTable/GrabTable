resource "aws_ecs_cluster" "terraform_ecs_cluster" {
  name = "terraform-ecs-cluster"
}

data "aws_ecr_repository" "terraform_ecr_repository" {
  name = "grabtable"
}

resource "aws_ecs_task_definition" "terraform_ecs_task_definition" {
  family                   = "terraform-ecs-task-definition"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  container_definitions = templatefile("task-definitions/task.tftpl", {
    ecr_repository_url = data.aws_ecr_repository.terraform_ecr_repository.repository_url
  })
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn      = aws_iam_role.ecs_task_role.arn
}

resource "aws_ecs_service" "terraform_ecs_service" {
  name            = "terraform-ecs-service"
  cluster         = aws_ecs_cluster.terraform_ecs_cluster.id
  task_definition = aws_ecs_task_definition.terraform_ecs_task_definition.arn
  desired_count   = 1

  load_balancer {
    // TODO: container_name equals to name in task definition
    container_name   = "terraform-container-definition"
    target_group_arn = aws_lb_target_group.terraform_target_group.arn
    container_port   = 8000
  }
}
