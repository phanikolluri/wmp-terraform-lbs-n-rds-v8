module "databases" {
  source = "./modules/rds"
  for_each = var.databases
  env = var.env
  subnets = var.subnets
  allocated_storage = each.value["allocated_storage"]
}

module "apps" {
  depends_on = [module.databases]
  source    = "./modules/component-with-alb"
  for_each = var.apps
  component = each.key
  env  = var.env
  subnets = var.subnets
  dns_domain = var.dns_domain
  ports = each.value["ports"]
  instance_type = each.value["instance_type"]
  asg = each.value["asg"]
  vpc_id = var.vpc_id
  lb = each.value["lb"]
  postgres_rds_address = module.databases["postgresql"].postgres_rds_address

}













