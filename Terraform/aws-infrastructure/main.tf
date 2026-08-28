module "vpc" {
  source = "./modules/vpc"

  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
  environment  = var.environment
  aws_region   = var.aws_region
}

module "security-group" {
  source       = "./modules/security-groups"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  environment  = var.environment
}

module "ec2" {
  source               = "./modules/ec2"
  project_name         = var.project_name
  environment          = var.environment
  private-subnet_ids   = module.vpc.private-subnet_ids
  public-subnet_ids    = module.vpc.public-subnet_ids
  application_sg_id    = module.security-group.application_sg_id
  aws_bastion_sg_id    = module.security-group.aws_bastion_sg_id
  iam_instance_profile = module.iam.iam_instance_profile
}

module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.vpc.vpc_id
  project_name      = var.project_name
  environment       = var.environment
  public-subnet_ids = module.vpc.public-subnet_ids
  alb_sg_id         = module.security-group.alb_sg_id
  aws_private_id    = module.ec2.aws_private_id
}

module "rds" {
  source             = "./modules/rds"
  private-subnet_ids = module.vpc.private-subnet_ids
  project_name       = var.project_name
  environment        = var.environment
  database_sg_id     = module.security-group.database_sg_id
  db_name            = var.db_name
  db_password        = var.db_password
  db_username        = var.db_username
}

module "s3" {
  source       = "./modules/s3"
  project_name = var.project_name
  environment  = var.environment
}

module "iam" {
  source            = "./modules/iam"
  environment       = var.environment
  project_name      = var.project_name
  s3_bucket_arn     = module.s3.s3_bucket_arn
  aws_db_secret_arn = module.secrets.aws_db_secret_arn
  aws_ecr_repo_arn  = module.ecr.aws_ecr_repo_arn
}

module "secrets" {
  source       = "./modules/secrets"
  project_name = var.project_name
  environment  = var.environment
  db_name      = var.db_name
  db_username  = var.db_username
  db_password  = var.db_password
}

module "ecr" {
  source       = "./modules/ecr"
  project_name = var.project_name
  environment  = var.environment
}

module "eks" {
  source             = "./modules/eks"
  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = module.vpc.vpc_id
  private-subnet_ids = module.vpc.private-subnet_ids
  node_desired_size  = var.node_desired_size
  node_disk_size     = var.node_disk_size
  node_instance_type = var.node_instance_type
  node_max_size      = var.node_max_size
  node_min_size      = var.node_min_size
}
