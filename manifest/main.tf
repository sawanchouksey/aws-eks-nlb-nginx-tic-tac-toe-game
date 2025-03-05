# main.tf

provider "aws" {
  region = var.region # Using the region variable from variables.tf
}

# Create the EKS Cluster
resource "aws_eks_cluster" "example" {
  name     = var.eks_cluster_name
  role_arn = var.eks_cluster_role_arn # Reference the cluster role ARN from terraform.tfvars
  version  = var.eks_version
  vpc_config {
    subnet_ids = var.subnet_ids # Reference subnet IDs from terraform.tfvars
  }
}

resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.example.name
  addon_name   = "coredns"
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.example.name
  addon_name   = "kube-proxy"
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.example.name
  addon_name   = "vpc-cni"
}

# Create EKS Add-on for Pod Identity
resource "aws_eks_addon" "eks_pod_identity" {
  cluster_name = aws_eks_cluster.example.name
  addon_name   = "eks-pod-identity-agent"
}

# Create the EKS Node Group
resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.example.name
  node_group_name = var.eks_node_group_name
  node_role_arn   = var.eks_node_role_arn # Reference the node role ARN from terraform.tfvars
  subnet_ids      = var.subnet_ids        # Reference subnet IDs from terraform.tfvars

  scaling_config {
    desired_size = var.desired_nodes # Use desired node count from terraform.tfvars
    max_size     = var.max_nodes     # Use max node count from terraform.tfvars
    min_size     = var.min_nodes     # Use min node count from terraform.tfvars
  }

  instance_types = [var.instance_type] # Use instance type from terraform.tfvars
  ami_type       = "AL2_x86_64"        # Amazon Linux 2 AMI

  remote_access {
    ec2_ssh_key = var.ssh_key_name # Optional, if you want SSH access to nodes
  }
}

