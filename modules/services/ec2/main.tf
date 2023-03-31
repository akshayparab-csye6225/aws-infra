# Define the EC2 instance
data "aws_ami" "latest" {
  most_recent = true
  filter {
    name   = "name"
    values = [var.ami_name_regex]
  }
}

# IAM Policy to Access Buckets
resource "aws_iam_policy" "webapp_s3_policy" {
  name = var.aws_iam_policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = var.aws_iam_policy_action
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${var.s3-bucket-name-in}",
          "arn:aws:s3:::${var.s3-bucket-name-in}/*"
        ]
      }
    ]
  })
}

# IAM Policy to Access CloudWatch
resource "aws_iam_policy" "cloudwatch_policy" {
  name = var.aws_iam_cw_policy_name

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ec2:DescribeVolumes",
          "ec2:DescribeTags",
          "logs:PutLogEvents",
          "logs:DescribeLogStreams",
          "logs:DescribeLogGroups",
          "logs:CreateLogStream",
          "logs:CreateLogGroup"
        ],
        "Resource" : [
          "arn:aws:logs:*:*:log-group:csye6225:*"
        ]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "cloudwatch:PutMetricData"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "ssm:GetParameter"
        ],
        "Resource" : "arn:aws:ssm:*:*:parameter/AmazonCloudWatch-*"
      }
    ]
  })
}

# IAM Role
resource "aws_iam_role" "ec2_csye6225_role" {
  name = var.aws_iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# IAM Role Policy Attachment
resource "aws_iam_role_policy_attachment" "webapp_s3_attachment" {
  policy_arn = aws_iam_policy.cloudwatch_policy.arn
  role       = aws_iam_role.ec2_csye6225_role.name
}

resource "aws_iam_role_policy_attachment" "cloudwatch_policy_attachment" {
  policy_arn = aws_iam_policy.webapp_s3_policy.arn
  role       = aws_iam_role.ec2_csye6225_role.name
}

# IAM Instance Profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = var.ec2_iam_profile_name
  role = aws_iam_role.ec2_csye6225_role.name
}
# EC2
resource "aws_instance" "my_web_server" {
  ami                         = var.ami_id == null ? data.aws_ami.latest.id : var.ami_id
  instance_type               = var.ec2_instance_type
  subnet_id                   = var.vpc-public-subnet-id-in
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [var.ec2-security-group-id-in]
  disable_api_termination     = var.disable_api_termination
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  user_data                   = <<EOF
#!/bin/bash
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/home/ec2-user/webapp/scripts/cloudwatch-config.json -s
cat <<EOT >> ${var.envfilePath}
NODE_ENV=${var.env}
PORT=${var.server_port}
MYSQL_DB_HOST=${var.db-instance-host-in}
MYSQL_DB_USER=${var.rds_instance_username}
MYSQL_DB_PASSWORD="${var.rds_instance_password}"
MYSQL_DB_NAME=${var.rds_instance_name}
MYSQL_DB_PORT=${var.rds_instance_port}
DB_DIALECT=${var.rds_dialect}
S3_BUCKET_NAME=${var.s3-bucket-name-in}
AWS_DEFAULT_REGION=${var.aws_region}
STATSD_HOST=${var.statsd_host}
STATSD_PORT=${var.statsd_port}
EOT
EOF
  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    delete_on_termination = var.root_volume_delete_on_termination
  }
  tags = {
    Name = "Web Server"
  }
}