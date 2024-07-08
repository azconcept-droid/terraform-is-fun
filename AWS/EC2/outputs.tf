#outputs.tf
output "aws_instance_ip" {
  value       = aws_instance.db_server.public_ip
}