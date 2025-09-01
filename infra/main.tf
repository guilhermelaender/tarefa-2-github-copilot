provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web" {
    ami           = "ami-0c94855ba95c71c99" # Amazon Linux 2 AMI (us-east-1)
    instance_type = "t2.micro"

    vpc_security_group_ids = [aws_security_group.web_sg.id]

    tags = {
        Name = "WebServer"
    }
}

resource "aws_security_group" "web_sg" {
    name        = "web_sg"
    description = "Allow HTTP inbound traffic"

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_s3_bucket" "storage_bucket" {
    bucket = "my-storage-bucket-unique-123456"
    acl    = "private"

    tags = {
        Name        = "StorageBucket"
        Environment = "Dev"
    }
}