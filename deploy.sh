#!/bin/bash

#Use your own variables for to reach .tf files
home="/home/"
user=$(whoami)
projectpath="/Downloads/BrainScale_TF/Terraform/"
path="$home$user$projectpath"
cd ${path}
	terraform init 
    terraform plan
    terraform apply --auto-approve