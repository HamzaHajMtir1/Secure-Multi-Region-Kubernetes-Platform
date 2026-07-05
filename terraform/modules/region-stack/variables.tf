
variable "region" {}
variable "environment" {}
variable "node_count" { default = 1 }
variable "db_password" { sensitive = true }