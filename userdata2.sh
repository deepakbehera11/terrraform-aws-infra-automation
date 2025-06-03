#!/bin/bash
sudo yum update
sudo yum install -y httpd

# Get the instance ID using the instance metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" "http://169.254.169.254/latest/meta-data/instance-id")


# Install the AWS CLI
sudo yum install -y awscli

# Download the images from S3 bucket
#aws s3 cp s3://myterraformprojectbucket2023/project.webp /var/www/html/project.png --acl public-read

aws s3 cp s3://myterraformprojectbucket2023/home/deepak_11/projects/terraform_project/Terraform-Infra-Image.png /var/www/html/home/deepak_11/projects/terraform_project/Terraform-Infra-Image.png --acl public-read

# Create a simple HTML file with the portfolio content and display the images
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>My Portfolio</title>
  <style>
    /* Add animation and styling for the text */
    @keyframes colorChange {
      0% { color: red; }
      50% { color: green; }
      100% { color: blue; }
    }
    h1 {
      animation: colorChange 2s infinite;
    }
  </style>
</head>
<body>
  <h1>Terraform Project Server 2</h1>
  <h2>Instance ID: <span style="color:green">${INSTANCE_ID}</span></h2>
  <h3>I am a <b>DevOps Engineer</b></h3>
  <h3>This is the Infrastructure Which I have built using Terraform</h3>
  <img src="https://deepakterrform2025project.s3.us-east-1.amazonaws.com/Terraform-Infra-Image.png" alt="Terraform Image" />
</body>
</html>
EOF

# Start Apache and enable it on boot
sudo systemctl start httpd
sudo systemctl enable httpd