resource "aws_eks_cluster" "k8-cluster" {
  name     = "k8-cluster"
  role_arn = "arn:aws:iam::891376947722:role/eks-cluster-role"
  version  = "1.29"

  vpc_config {
    subnet_ids         = ["subnet-0ed9f14ca7481cbce", "subnet-0fa692ec7d680bf3e"]
    security_group_ids = ["sg-0110fe679192f8fc9"]
  }
}

resource "aws_eks_node_group" "k8-cluster-node-group" {
  cluster_name    = aws_eks_cluster.k8-cluster.name
  node_group_name = "k8-cluster-node-group"
  node_role_arn   = "arn:aws:iam::891376947722:role/node-role"
  subnet_ids      = ["subnet-0ed9f14ca7481cbce", "subnet-0fa692ec7d680bf3e"]

  scaling_config {
    desired_size = 3
    min_size     = 2
    max_size     = 5
  }
}