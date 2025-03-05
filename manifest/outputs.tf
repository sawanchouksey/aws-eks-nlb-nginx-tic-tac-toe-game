# Output EKS Cluster Name
output "eks_cluster_name" {
  value = aws_eks_cluster.example.name
}

# Output Node Group Name
output "eks_node_group_name" {
  value = aws_eks_node_group.example.node_group_name
}

