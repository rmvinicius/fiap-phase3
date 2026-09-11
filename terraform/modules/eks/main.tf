resource "aws_eks_cluster" "main" {
  name     = var.eks_cluster_name
  role_arn = var.eks_role_arn
  version  = var.eks_cluster_version

  access_config {
    authentication_mode = "API"
  }

  vpc_config {
    subnet_ids              = var.eks_subnet_ids
    endpoint_public_access  = false
    endpoint_private_access = true
  }

  tags = {
    Name        = var.eks_cluster_name
    Environment = var.environment
  }
}

# Node groups
resource "aws_eks_node_group" "nodes" {
  for_each = { for ng in var.eks_node_groups : ng.name => ng }

  cluster_name    = aws_eks_cluster.main.name
  node_group_name = each.value.name
  node_role_arn   = var.eks_role_arn
  subnet_ids      = var.eks_subnet_ids

  scaling_config {
    desired_size = each.value.desired_size
    min_size     = each.value.min_size
    max_size     = each.value.max_size
  }

  update_config {
    max_unavailable = 1
  }

  instance_types = [each.value.instance_type]

  tags = {
    Name        = each.value.name
    Environment = var.environment
  }
}