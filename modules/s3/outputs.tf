output "Hourly_bucket_name" {
    value = aws_s3_bucket.s3_bucket_hour.bucket
}

output "Weekly_bucket_name" {
   value = aws_s3_bucket.s3_bucket_week.bucket
}
output "Monthly_bucket_name" {
   value = aws_s3_bucket.s3_bucket_month.bucket
}
