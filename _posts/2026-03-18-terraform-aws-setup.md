---
layout: post
title: "Terraform + AWS CLI Setup (No Fluff)"
date: 2026-03-18
categories: devops terraform aws
---

## Introduction

This step by step instruction guide is meant to walk you through setting up Terraform with AWS CLI so that you can provision infrastructure from code instead of manually clicking through an AWS console. Minimize the manual stuff automate the actual stuff kinda thing.

Steps include:
- Install Terraform
- Configure AWS CLI
- Set up credentials
- Deploy a simple resource

---

## Prerequisites

- AWS account
- Terminal access
- Basic command line knowledge

---

## Install Terraform

Check if Terraform is installed:

```bash
terraform version
```
If not install it, since I am on a macbook I will be running mac based options for this.

```
brew install terraform
```

Verify installation
```
terraform version
```



## Create AWS Credentials
	1.	Go to AWS Console
	2.	Navigate to IAM → Users
	3.	Create a new user:
	•	Name: terraform-user
	•	Access type: Programmatic access
	4.	Attach permissions:
	•	For testing: AdministratorAccess
	•	For production: use least privilege
	5.	Save:
	•	Access Key
	•	Secret Key



Install AWS CLI

Check if installed:

```
aws --version
```

if not installed  then run
```
brew install awscli
```

## Configure AWS CLI

Run:
```
aws configure
```
Enter:
	•	Access Key
	•	Secret Key
	•	Region (e.g. us-east-1)
	•	Output format (json)

Test configuration:
```
aws sts get-caller-identity
```

## Create Terraform Project

Create a directory:

mkdir tf-day2 && cd tf-day2

Create a file called main.tf:
```
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
```

⸻

Initialize Terraform
```
terraform init
```

⸻

Preview Changes
```
terraform plan
```

⸻

Apply Configuration
```
terraform apply
```
Type:

yes


⸻

Destroy Resources

To avoid unnecessary costs:
```
terraform destroy
```

⸻

Common Issues one might experience are 
	•	Invalid AWS credentials
	•	Insufficient IAM permissions
	•	Forgetting terraform init
	•	Leaving resources running

⸻

Conclusion

You now have a working setup for provisioning AWS infrastructure using Terraform. This forms the foundation for more advanced workflows.


