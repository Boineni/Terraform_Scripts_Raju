resource "aws_iam_role" "nvvr" {
  name = "${var.iam_role}"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "nvvr-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.nvvr.name
}

resource "aws_eks_cluster" "nvvr" {
  name     = "${var.cluster_name}"
  role_arn = aws_iam_role.nvvr.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-ap-south-2a.id,
      aws_subnet.private-ap-south-2b.id,
      aws_subnet.public-ap-south-2a.id,
      aws_subnet.public-ap-south-2b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.nvvr-AmazonEKSClusterPolicy]
}