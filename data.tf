# EKS Managed Nodes Group
# Filter out local zones, which are not currently supported 
# with managed node groups
data "aws_availability_zones" "available" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# EKS EBS Volume Policy
# https://aws.amazon.com/blogs/containers/amazon-ebs-csi-driver-is-now-generally-available-in-amazon-eks-add-ons/
data "aws_iam_policy" "ebs_csi_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

# ECR Authroization Credentials

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}

# IAM Policy Document

data "aws_iam_policy_document" "kubectl_assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.aws_account}:root"]
    }
  }
}