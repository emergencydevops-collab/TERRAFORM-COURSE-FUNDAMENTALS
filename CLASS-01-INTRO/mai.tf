#Terraform block 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.63.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"

}

# resource for ec2 

resource "aws_instance" "ec2test" {
  ami           = "ami-0a4408457f9a03be3"
  instance_type = "t2.micro"
  key_name      = "devopstraining"
  user_data = file("app.sh")
#   user_data     = <<-EOF
#     #!/bin/bash 
#     sudo yum update -y 
#     sudo yum install httpd -y
#     sudo systemctl enable httpd
#     sudo systemctl start httpd 
#     echo "<h1> THIS IS TERRAFORM FIRST CLASS </h1>" > /var/www/html/index.html
#     EOF
  tags = {
    Name = "MYVM"
  }


}

