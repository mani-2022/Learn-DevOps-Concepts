locals {

  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

  public_subnets = {
    "us-east-1a" = "10.0.1.0/24"
    "us-east-1b" = "10.0.2.0/24",
    "us-east-1c" = "10.0.3.0/24"
  }
  private_subnets = {
    "us-east-1a" = "10.0.10.0/24",
    "us-east-1b" = "10.0.20.0/24",
    "us-east-1c" = "10.0.30.0/24"

  }
}
