terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }

    local = {
      source = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Fetching your existing security groups by ID
# (vpc_id omitted here because the direct ID is completely self-sufficient)
data "aws_security_group" "master_node" {
  id = "sg-0ea2dcb5c47b5c4fe"
}

data "aws_security_group" "work_node" {
  id = "sg-02d00d8809a2d50c6"
}

locals {
  server_config = {
    "master_node" = {
      instance_type = "t3.small"
      ami           = "ami-0388e3ada3d9812da" #
      sg_id         = data.aws_security_group.master_node.id # Added data. prefix
    },
    "work_node_1" = {
      instance_type = "t3.small"
      ami           = "ami-0388e3ada3d9812da"
      sg_id         = data.aws_security_group.work_node.id
    },
    "work_node_2" = {
      instance_type = "t3.small"
      ami           = "ami-0388e3ada3d9812da"
      sg_id         = data.aws_security_group.work_node.id
    }
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("/home/ubuntu/.ssh/id_rsa.pub")
}

resource "aws_instance" "custom_servers" {
  for_each               = local.server_config
  ami                    = each.value.ami
  key_name               = aws_key_pair.deployer.key_name
  instance_type          = each.value.instance_type
  vpc_security_group_ids = [each.value.sg_id]

  tags = {
    Name = "${each.key}-server"
  }
}

# Added a dynamic output to print your server IPs neatly upon application
output "deployed_server_ips" {
  value = { for name, server in aws_instance.custom_servers : name => server.public_ip }
}
