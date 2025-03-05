# Comprehensive Guide: AWS EKS Cluster Setup with nginx controller with AWS NLB(Network load Balancer) and deploy sample application `TIC TAC TOE` game. 

## Introduction

### AWS EKS
Amazon Elastic Kubernetes Service (EKS) is a fully managed Kubernetes service provided by AWS. It makes it easy to deploy, manage, and scale Kubernetes applications in the cloud. EKS takes care of the heavy lifting involved in running Kubernetes, allowing you to focus on building your applications.

### Nginx Ingress Controller
The Nginx Ingress Controller is a Kubernetes ingress controller that uses the Nginx web server as a reverse proxy and load balancer. It provides advanced routing and load balancing capabilities for your Kubernetes services, making it easier to expose your applications to the internet.

# EKS Deployment Workflow

## Prerequisites
- AWS CLI installed
- Terraform installed
- kubectl installed
- Helm installed

## Deployment Steps

### 1. Terraform Initialization and Deployment
```bash
# Initialize Terraform
terraform init

# Format Terraform files
terraform fmt

# Validate Terraform configuration
terraform validate

# Plan Terraform deployment
terraform plan

# Apply Terraform configuration
terraform apply
```

### 2. Configure Kubernetes Context
```bash
# Update kubeconfig for EKS cluster
aws eks update-kubeconfig --name eks-monitoring-01 --region ap-south-1
```

### 3. Install Nginx Ingress Controller
```bash
# Install Nginx Ingress Controller in default namespace
helm install nginx-ingress ./nginx-ingress/ -n default --create-namespace
```

### 4. Deploy Application
```bash
# Deploy Tic-Tac-Toe application
kubectl apply -f tic-tac-toe.yaml

# Deploy Ingress configuration
kubectl apply -f ingress-nginx-route.yaml
```

### 5. Verification Commands
```bash
# Check services
kubectl get svc

# Check pods
kubectl get pods

# Check ingress configuration
kubectl get ingress

# Describe ingress
kubectl describe ingress

# Describe specific pod
kubectl describe pod <pod-name>

# View pod logs
kubectl logs <pod-name>
```

### 6. Cleanup
```bash
# Delete deployed resources
kubectl delete -f tic-tac-toe.yaml -f ingress-nginx-route.yaml

# Destroy Terraform-managed infrastructure
terraform destroy
```

## Troubleshooting
- Ensure AWS credentials are correctly configured
- Verify network and security group settings
- Check Kubernetes events for potential issues

## Notes
- Customize configurations based on your specific requirements
- Regularly update Helm charts and EKS versions

### Support Me

**If you find my content useful or enjoy what I do, you can support me by buying me a coffee. Your support helps keep this website running and encourages me to create more content.**

[![Buy Me a Coffee](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/sawanchokso)

**Your generosity is greatly appreciated!**

##### Thank you for your support!💚