provider "aws" {
   region = "us-east-1"
}
resource "aws_instance" "ec2_instance" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t3.micro"
 }

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

output "aws_network_ip" {
  value = "${var.aws_network_ip}"
}

data "aws_caller_identity" "current" {}
output "account_id" {
    value = data.aws_caller_identity.current.account_id
}

data "aws_region" "current" {}
output "aws_region" {
  value = "${var.aws_region}"
}


