output "db-instance-host-out" {
  value = aws_db_instance.rds_instance.address
}