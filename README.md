# BrainScale_TF


**This Terraform configuration sets up an Application Load Balancer (ALB) on AWS with an associated target group and an Auto Scaling Group (ASG) to host instances of a Dockerized web application. The infrastructure includes a Virtual Private Cloud (VPC) with public subnets and security groups allowing inbound traffic on ports 22, 80, and 3000.**


![image](https://github.com/UlikhanyanSergey/BrainScale_TF/assets/139685392/6396dc6a-5139-4217-8063-c6a169710531)


## Prerequisites
Before running this Terraform configuration, ensure you have the following in place:

1. AWS CLI: Install and configure the AWS CLI on your local machine with appropriate access credentials.
   https://docs.aws.amazon.com/cli/v1/userguide/cli-chap-install.html
3. Terraform: Install Terraform on the local machine where you plan to run the Terraform script.
   https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

## Usage


- Update the ```Vars.tf``` file to customize the deployment according to your project requirements.

- In the ```Provider.tf``` file, either add your AWS access key and secret key or set them as environment variables.

- Ensure that the ```user_data_*.sh``` files contain the correct credentials and configuration for creating Docker images and pushing them to the ECR repository.

- Set your project path in the ```deploy.sh```(and```destroy.sh```) script to execute Terraform commands from the correct location.

## Deploy

To deploy the project, navigate to the project folder and run:

     ./deploy.sh


This script will automatically initialize Terraform, plan the infrastructure, and apply the Terraform files to create the necessary resources on AWS. These resources include an Auto Scaling Group with two instances to pull and run Docker images from the ECR repository, an Application Load Balancer for load balancing instances, a Virtual Private Cloud (VPC), an ECR repository for storing Docker images, and an IAM policy and role to grant instances access to the ECR repository.

**The EC2 instance is used to create a Docker image using the user_data script and push it to the ECR repository.**


## Destroy

To destroy the project and remove all resources created by this Terraform configuration, run:

    ./destroy.sh

    
Please note that destroying the infrastructure will also delete the Docker image stored in the ECR repository.

## **Note**
Make sure to set up the necessary environment variables for AWS CLI or include access keys in the ```Provider.tf``` file to ensure proper authentication and access to AWS resources.
Ensure that all ```user_data``` scripts contain the correct configurations for creating and pushing Docker images to the ECR repository.
Customize the ```Vars.tf``` file and other configurations based on your specific project requirements.
