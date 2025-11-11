output "public_ip" {
  description = "EC2 public IP"
  value       = aws_instance.dvwa.public_ip
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.dvwa.id
}