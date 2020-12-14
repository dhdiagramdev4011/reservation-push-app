provider "aws" {
    region = "ap-northeast-2" 
}

resource "aws_security_group" "instance" {
    name = "terraform-app-test-0002"
    ingress {
        from_port = "${var.server_port}"
        to_port = "${var.server_port}"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "tls_private_key" "this" {
    algorithm = "RSA"
}

resource "aws_instance" "example" {
    ami = "ami-027ce4ce0590e3c98"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]

    user_data = <<-EOF
            #!/bin/bash
            mkdir /app
            git clone -b dev https://github.com/dhdiagram4011/reservation-app-project.git /app
            sudo yum install python3 python3-pip -y
            pip3 install -r /app/requirements.txt
            pip3 install -r Django==2.1.5
            pip3 install -r djangorestframework
            EOF
}