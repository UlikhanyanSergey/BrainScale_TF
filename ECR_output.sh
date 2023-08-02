#!/bin/bash

# Using Repo URL for Docker image pushing
ECR_REPO_URL=$(terraform output ecr_repo_url)

echo "ECR Repository URL: $ECR_REPO_URL"