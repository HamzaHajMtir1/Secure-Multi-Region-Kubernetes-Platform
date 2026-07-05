
module "primary" {
  source      = "../../modules/region-stack"
  region      = "swedencentral"
  environment = "primary"
  db_password = var.db_password
}