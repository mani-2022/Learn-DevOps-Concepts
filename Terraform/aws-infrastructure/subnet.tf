resource "aws_subnet" "public" {
  for_each          = local.public_subnets
  availability_zone = each.key
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value

  tags = {
    Name = "${var.project_name}-${var.environment}-subnet"
  }
}

resource "aws_subnet" "private" {
  for_each          = local.private_subnets
  vpc_id            = aws_vpc.main.id
  availability_zone = each.key
  cidr_block        = each.value

  tags = {
    Name = "${var.project_name}-${var.environment}-subnet"
  }
}
