# Create a new RDS parameter group for MySQL 8.0
resource "aws_db_subnet_group" "private_subnet" {
  name_prefix = "private-subnet-group-"
  subnet_ids  = var.private-subnet-id-in
}

# Create a new RDS parameter group for MySQL 8.0
resource "aws_db_parameter_group" "mysql_parameter_group" {
  name_prefix = "db-parameter-group-"
  family      = var.aws_db_parameter_group_family
}

# Create a new RDS instance using the MySQL engine
resource "aws_db_instance" "rds_instance" {
  allocated_storage      = var.rds_instance_storage
  engine                 = var.rds_instance_engine
  engine_version         = var.rds_instance_engine_version
  instance_class         = var.rds_instance_class
  identifier             = var.rds_instance_identifier
  db_name                = var.rds_instance_name
  port                   = var.rds_instance_port
  username               = var.rds_instance_username
  password               = var.rds_instance_password
  db_subnet_group_name   = aws_db_subnet_group.private_subnet.name
  parameter_group_name   = aws_db_parameter_group.mysql_parameter_group.name
  skip_final_snapshot    = var.rds_instance_skip_final_snapshot
  publicly_accessible    = var.rds_instance_publicly_accessible
  multi_az               = var.rds_instance_multi_az
  vpc_security_group_ids = [var.db-security-group-id-in]
}