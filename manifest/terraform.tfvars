# terraform.tfvars
region               = "ap-south-1"
eks_cluster_role_arn = "arn:aws:iam::ACCOUNT_ID:role/eksClusterRole"    # Replace with your EKS cluster role ARN
eks_node_role_arn    = "arn:aws:iam::ACCOUNT_ID:role/AmazonEKSNodeRole" # Replace with your EKS node role ARN
subnet_ids = [
  "subnet-00e8284becb87672b", # Replace with actual subnet IDs
  "subnet-03f098afe6a476060",
  "subnet-0bfdaf7ba6397dd30" # Replace with actual subnet IDs
]

ssh_key_name = "my-ec2" # Replace with your actual SSH key name

instance_type = "t3.medium" # Replace with your preferred instance type (e.g., "t3.large")

min_nodes     = 1 # Minimum number of nodes
max_nodes     = 3 # Maximum number of nodes
desired_nodes = 2 # Desired number of nodes

eks_cluster_name    = "eks-monitoring-01"
eks_node_group_name = "eks-monitoring-ng-01"
eks_version         = "1.31"
