resource "aws_eip" "nat-eip" {
  for_each = toset(local.azs)
  domain   = "vpc"

  tags = {
    Name = "${var.project_name}-${var.environment}-nat-eip-${each.key}"
  }
}

resource "aws_nat_gateway" "nat-gw" {
  for_each      = toset(local.azs)
  allocation_id = aws_eip.nat-eip[each.key].id
  subnet_id     = aws_subnet.public[each.key].id

  tags = {
    Name = "${var.project_name}-${var.environment}-nat-gw-${each.key}"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}
