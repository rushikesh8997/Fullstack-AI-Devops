output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value = aws_instance.demo_ec2.public_ip
}


output "ec2_instance_id" {
    description = "EC2 instance ID"
    value = aws_instance.demo_ec2.id
}

output "ec2_private_ip" {
    description = "Private IP of EC2 instance"
    value = aws_instance.demo_ec2.private_ip
}

output "ec2_instance_arn" {
    description = "ARN EC2 instance"
    value = aws_instance.demo_ec2.arn
}

output "s3_bucket_name" {
    description = "Name of S3 Bucket"
    value = aws_s3_bucket.demo_bucket.bucket
}

output "s3_bucket_arn" {
    description = "ARN of S3 Bucket"
    value = aws_s3_bucket.demo_bucket.arn
}

output "iam_user_name" {
    description = "IAM user created by Terraform"
    value = aws_iam_user.demo_user.name
}

output "iam_user_arn" {
    description = "IAM user ARN"
    value = aws_iam_user.demo_user.arn
}