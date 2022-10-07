resource "aws_instance" "web" {
  
 
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
   user_data = <<-EOF
            #!/bin/bash
            sudo yum update -y
            sudo yum install httpd -y
            sudo systemctl enable httpd
            sudo systemctl start httpd
            echo "<h1> Welcome ! AWS Infra created using Terraform Successfully </h1><br><h2> Message from `hostname`  </h2>" > /var/www/html/index.html
            EOF
  tags = {
    Name = "ytechvm1"
    

  }


/*provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "echo '<h1>Terraform Instance Launched Successfully</h1>' | sudo tee /var/www/html/index.html"
    ]
  }*/
}
resource "aws_security_group" "ytech-sg" {
  name = "ytechs-grp"
  description = "Allow HTTP  traffic via Terraform"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
}
 output "ec2_instance_web" {
  description = "EC2 Instance Public IP"
  value = aws_instance.web.public_ip
}
