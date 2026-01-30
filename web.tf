provider "aws" {
  region = "${var.region}"
}

module "vpc" {
  source = "git::https://github.com/vigneshkomma/vpc_MODULE.git"
  name   = "web"
  cidr   = "10.0.0.0/16"
  public_subnet = "10.0.1.0/24"
}

resource "aws_instance" "web" {
  ami = "${lookup(var.ami, var.region)}"
  instance_type = "${var.instance_type}"
  subnet_id = "${module.vpc.public_subnet_id}"
  private_ip = "${var.instance_ips[count.index]}"
  tags = {
    Name = "web-${format("%03d", count.index + 1)}"
    owner = "${element(var.owner_tag, count.index)}"
  }
  associate_public_ip_address = true
  user_data = "${file("files/web_bootstrap.sh")}"
  count = "${length(var.instance_ips)}"
}

resource "aws_elb" "web" {
  name = "web-elb"
  subnets = ["${module.vpc.public_subnet_id}"]
  listener {
    instance_port = 80
    lb_port = 80
    instance_protocol = "http"
    lb_protocol = "http"
  }
  instances = aws_instance.web[*].id
}

