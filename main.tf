provider "aws" {
    region = "us-east-2"
}

variable "server_port" {
    description = "The port number for incoming http requests"  
    type = number
    default = 8080
}

resource "aws_instance" "ec2" {
    ami = "ami-0fb653ca2d3203ac1"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]

    user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF
    user_data_replace_on_change = true
    tags = {
      Name = "terraform-example"
    }
}

resource "aws_security_group" "instance" {
    name = "terraform-example-instance"

    ingress {
        from_port = var.server_port
        to_port = var.server_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "public_ip" {
    value = aws_instance.ec2.public_ip
    description = "the public IP Address of the webserver"
}