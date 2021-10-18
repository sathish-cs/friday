# Friday
Terraform to create s3 buckets and helm charts to deploy application in kubernetes

### Prerequisite 

All this terraform code tested in v0.13. This version contraint imposed in provider.tf
Make sure user which you are using to run terraform CLI has access to the bucket (Attached instance role in our case rather than configuring credentials)


### Provision S3 buckets in AWS

```
git clone https://github.com/sathish-cs/friday.git

terraform init

terraform plan

terraform apply

```
```
provider.tf - Defined region, terrform and aws provider versions to avoid issues

main.tf - We are calling child module by specifying path in source

outputs.tf - Calling outputs from module

Spinning resources using modules


├── modules
│   └── s3
│       ├── s3.tf
│       ├── outputs.tf
│       └── vars.tf

modules/s3/s3.tf - Defined all config related to s3 buckets
modules/s3/outputs.tf - Querying s3 buckets names to display names
modules/s3/vars.tf - Variables 
```
* Since 3 buckets should be created with different configurations, I did'nt used count argument and length function to create multiple buckets under single resource. 

Verify the resources with config in either from AWS console or CLI

`terraform destroy`


