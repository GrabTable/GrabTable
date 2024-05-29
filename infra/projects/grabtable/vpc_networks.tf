resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "grabtable-vpc-0"
  }
}

resource "aws_security_group" "launch_wizard_1" {
  name        = "launch-wizard-1"
  description = "launch-wizard-1 created 2024-05-10T04:15:28.095Z"
  vpc_id      = aws_vpc.default.id
  egress = [
    {
      description      = ""
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
  ]
  ingress = [
    {
      description      = ""
      from_port        = 0
      to_port          = 65535
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = ""
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
  ]
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "private-subnet-01"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.3.0/24"
  tags = {
    Name = "private-subnet-02"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.0.0/24"
  tags = {
    "Name" = "pub-subnet-01"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.1.0/24"
  tags = {
    "Name" = "pub-subnet-02"
  }
}