resource "aws_eks_cluster" "eks-boutique-ae" {
 name = "eks-boutique-ae"
 role_arn = "arn:aws:iam::386603494603:role/LabRole"

 vpc_config {
  subnet_ids = [aws_subnet.subnet-boutique01-ae.id, aws_subnet.subnet-boutique02-ae.id]
  security_group_ids = [aws_security_group.lb_allow_http.id]
 }

 depends_on = [
  aws_subnet.subnet-boutique02-ae, aws_subnet.subnet-boutique01-ae
 ]
}

### CREAR SCALING DE WORKER 
 resource "aws_eks_node_group" "worker-node-group-ae" {
  cluster_name  = aws_eks_cluster.eks-boutique-ae.name
  node_group_name = "eks-boutique-workernodes-ae"
  node_role_arn  = "arn:aws:iam::386603494603:role/LabRole"
  subnet_ids   = [aws_subnet.subnet-boutique01-ae.id, aws_subnet.subnet-boutique02-ae.id]
  instance_types = ["t3.medium"]
 
  scaling_config {
   desired_size = 2
   max_size   = 3
   min_size   = 1
  }
 
 }

  
 