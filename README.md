# terrraform-aws-infra-automation

## Terraform AWS 2-Tier Web Application Infrastructure
This project provisions a **high-availability, scalable web application infrastructure on AWS** using Terraform. <br>
It includes a VPC, public subnets, EC2 instances, an Application Load Balancer (ALB), and an S3 bucket for static assets.

---

## **Architecture Overview**

- **VPC** with two public subnets (in different AZs)
- **Internet Gateway** and route tables for internet access
- **Security Group** allowing HTTP, HTTPS, and SSH
- **Two EC2 Instances** (web servers) in separate subnets
- **Application Load Balancer (ALB)** distributing traffic to EC2s
- **IAM Role & Instance Profile** for EC2 S3 access
- **S3 Bucket** for storing and serving static files (e.g., images)
- **S3 Bucket Policy** for public read access to objects

![Architecture Diagram](https://github.com/deepakbehera11/terrraform-aws-infra-automation/blob/9e6d05c59fd74865830c39ead944954a808b2460/Terraform-Infra-Image.png) <!-- Replace with your diagram if available -->

---
