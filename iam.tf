# EKS Admin Role

resource "aws_iam_role" "eks_kubectl_role" {
  name               = "kubectl-${local.suffix}-access-role"
  assume_role_policy = data.aws_iam_policy_document.kubectl_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "eks_kubectl-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_kubectl_role.name
}

resource "aws_iam_role_policy_attachment" "eks_kubectl-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.eks_kubectl_role.name
}

resource "aws_iam_role_policy_attachment" "eks_kubectl-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_kubectl_role.name
}

resource "aws_iam_user_policy" "eks_assume_role" {
  name = "eks-${local.suffix}-assume-role"
  user = var.aws_user_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
            "sts:AssumeRole",
        ]
        Effect = "Allow"
        Sid    = ""
        Resource = "${aws_iam_role.eks_kubectl_role.arn}"
      },
    ]
  })
}