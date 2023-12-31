# Project Overview:
Our project aims to create a robust and scalable web application infrastructure on AWS 
using Terraform. The objective is to establish a secure environment through the 
creation of a VPC, configuration of IAM users, networking setup, security groups, and 
deployment of EC2 instances.
## Objectives:
### Create IAM User:
 An IAM user named 'terraform-cs423-devops' was created to facilitate 
secure and controlled access to AWS resources. This user was granted the 
Administrator policy to ensure comprehensive management capabilities.
### Set Up AWS Credentials:
 AWS credentials were configured locally, allowing Terraform to interact 
securely with AWS services. This step ensures that Terraform can 
provision and manage resources in the AWS environment.
### Networking (Task 2):
 A VPC named 'devops-assignment-4' was created to isolate and manage 
the infrastructure effectively. Two public and two private subnets were 
distributed across two availability zones to ensure high availability and 
fault tolerance.
### Security Groups (Task 3A):
 A security group named 'ec2-security-group-cs423-devops' was 
established to control inbound and outbound traffic for EC2 instances. It 
follows the principle of least privilege, allowing only necessary ports for 
enhanced security.
### Key Pair (Task 3B):
 A secure key pair named 'cs423-assignment4-key' was generated for 
secure SSH access to EC2 instances. This key pair is essential for securely 
connecting to instances and managing them.
### EC2 Instances (Task 4):
 Two t2.micro EC2 instances were launched within the VPC. One instance 
is configured to host an Apache web server, and the other is intended for 
database-related tasks. User data scripts were utilized to automate the 
configuration of instances.
### Outputs (Task 5):
 Defined outputs to display public and private IP addresses of EC2 
instances, making it easier to identify and connect to the deployed 
resources.
