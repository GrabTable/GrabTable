resource "aws_vpc_endpoint" "ecs_agent_endpoint" {
  vpc_id             = aws_vpc.default.id
  service_name       = "com.amazonaws.ap-northeast-2.ecs-agent"
  vpc_endpoint_type  = "Interface"
  security_group_ids = [aws_security_group.launch_wizard_1.id]
  subnet_ids         = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  tags = {
    "Name" = "ecs-agent-endpoint"
  }
}

resource "aws_vpc_endpoint" "ecs_endpoint" {
  vpc_id             = aws_vpc.default.id
  service_name       = "com.amazonaws.ap-northeast-2.ecs"
  vpc_endpoint_type  = "Interface"
  security_group_ids = [aws_security_group.launch_wizard_1.id]
  subnet_ids         = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  tags = {
    "Name" = "ecs-endpoint"
  }
}

resource "aws_vpc_endpoint" "ecs_telemetry_endpoint" {
  vpc_id             = aws_vpc.default.id
  service_name       = "com.amazonaws.ap-northeast-2.ecs-telemetry"
  vpc_endpoint_type  = "Interface"
  security_group_ids = [aws_security_group.launch_wizard_1.id]
  subnet_ids         = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  tags = {
    "Name" = "ecs-telemetry-endpoint"
  }
}

resource "aws_vpc_endpoint" "ecr_endpoint" {
  vpc_id              = aws_vpc.default.id
  service_name        = "com.amazonaws.ap-northeast-2.ecr.dkr"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.launch_wizard_1.id]
  subnet_ids          = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  private_dns_enabled = true
  tags = {
    "Name" = "ecr-endpoint"
  }
}

resource "aws_vpc_endpoint" "ecr_api_endpoint" {
  vpc_id             = aws_vpc.default.id
  service_name       = "com.amazonaws.ap-northeast-2.ecr.api"
  vpc_endpoint_type  = "Interface"
  security_group_ids = [aws_security_group.launch_wizard_1.id]
  subnet_ids         = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  tags = {
    "Name" = "ecr-api-endpoint"
  }
}

resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id            = aws_vpc.default.id
  service_name      = "com.amazonaws.ap-northeast-2.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = ["rtb-0fa60af5600950baa"]

  policy = jsonencode({
    Version = "2008-10-17"
    Statement = [
      {
        Action    = "*",
        Effect    = "Allow",
        Resource  = "*",
        Principal = "*"
      }
    ]
  })

  tags = {
    "Name" = "s3-endpoint"
  }
}