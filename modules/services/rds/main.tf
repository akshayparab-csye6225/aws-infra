data "aws_iam_user" "AWS_User" {
  user_name = var.aws_user_name
}

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

resource "aws_kms_key" "rds_kms_key" {
  description = var.kms_key_description
  is_enabled  = var.kms_key_enabled
}

resource "aws_kms_key_policy" "rds_kms_key_policy" {
  key_id = aws_kms_key.rds_kms_key.id
  policy = jsonencode({
    "Id" : "rds-kms-key-policy",
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "Enable IAM User Permissions",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : ["${data.aws_iam_user.AWS_User.arn}"]
        },
        "Action" : "kms:*",
        "Resource" : "${aws_kms_key.rds_kms_key.arn}"
      }
    ]
  })
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
  storage_encrypted      = var.rds_storage_encrypted
  kms_key_id             = aws_kms_key.rds_kms_key.arn
}