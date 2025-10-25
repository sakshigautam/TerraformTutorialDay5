

Implicit dependency

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
}

Explicit dependency
resource "aws_iam_role_policy_attachment" "policy_attach" {
  role       = aws_iam_role.my_role.name
  policy_arn = aws_iam_policy.my_policy.arn
  depends_on = [aws_iam_policy.my_policy]
}
