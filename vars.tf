variable "s3_bucket_hour" {
  type = string
  default = "berlin-weather-hourly"
}

variable "s3_bucket_week" {
  type = string
  default =  "berlin-weather-weekly"
}


variable "s3_bucket_month" {
  type = string
  default =  "berlin-weather-monthly"
}

variable "versioning" {
    type        = bool
    description = "A state of versioning the objects."
    default     = true
}

variable "acl" {
    type        = string
    description = "Defines to manage access of buckets and objects."
    default     = "private"
}

variable "destroy" {
    type        = bool
    description = "Its make sure all objects are deleted before deleting the bucket"
    default     = true
}

variable "sse_algorithm" {
    type        = string
    description = "Encrypt all objects in bucket"
    default   = "AES256"  
}
