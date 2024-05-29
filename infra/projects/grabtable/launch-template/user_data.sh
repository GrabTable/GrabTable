#!/bin/bash 
echo ECS_CLUSTER=terraform-ecs-cluster >> /etc/ecs/ecs.config;
echo ECS_ENABLE_TASK_IAM_ROLE=true >> /etc/ecs/ecs.config;
echo ECS_ENABLE_CONTAINER_METADATA=true >> /etc/ecs/ecs.config;