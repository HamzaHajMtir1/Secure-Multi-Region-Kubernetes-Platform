module "secondary" {
  source      = "../../modules/region-stack"
  region      = "norwayeast"
  environment = "secondary"
  db_password = var.db_password
}