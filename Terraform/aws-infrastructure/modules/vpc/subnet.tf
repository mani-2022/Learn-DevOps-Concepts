resource "aws_subnet" "public" {
  for_each                = { for k, az in local.azs : az => local.public_subnets[k] }
  availability_zone       = each.key
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-${var.environment}-public-${each.key}"
  }
}

resource "aws_subnet" "private" {
  for_each          = { for k, az in local.azs : az => local.private_subnets[k] }
  vpc_id            = aws_vpc.main.id
  availability_zone = each.key
  cidr_block        = each.value

  tags = {
    Name = "${var.project_name}-${var.environment}-private-${each.key}"
  }
}
