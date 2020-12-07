module "eks" {
  source                                = "terraform-aws-modules/eks/aws"
  cluster_name                          = local.cluster_name
  cluster_version                       = var.eks_version
  subnets                               = module.vpc.private_subnets
  vpc_id                                = module.vpc.vpc_id
  cluster_endpoint_private_access       = true
  cluster_endpoint_private_access_cidrs = ["10.1.0.0/8", "192.168.0.0/16"]
  cluster_endpoint_public_access        = true

  map_roles = [
    {
      rolearn  = "arn:aws:iam::925511037392:role/OKTA-Admin"
      username = "admin"
      groups   = ["system:masters"]
    }
  ]

  node_groups = var.node_groups
}

