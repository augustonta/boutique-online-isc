resource "local_file" "clustername" {
    content  = aws_eks_cluster.eks-boutique-ae.name
    filename = "clustername.txt"
}
