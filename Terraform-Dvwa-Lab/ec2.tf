# EC2インスタンス (Ubuntu)
resource "aws_instance" "dvwa" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.dvwa_sg.id]
  key_name               = var.key_name

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "dvwa-ubuntu"
  }
}