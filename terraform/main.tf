data "aws_vpc" "existing_vpc" {
  filter {
    name   = "tag:Name"
    values = ["my-existing-vpc"]
  }
}

resource "aws_subnet" "example" {
  vpc_id     = data.aws_vpc.existing_vpc.id
  cidr_block = "10.0.1.0/24"
}
