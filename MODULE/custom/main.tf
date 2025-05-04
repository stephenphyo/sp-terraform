module "mod01" {
  source = "./modules/mod01"
  vpc = {
    "vpc-01" : "10.1.0.0/16"
  }
}

module "mod02" {
  source = "./modules/mod02"
  vpc = {
    "vpc-02" : "10.2.0.0/16"
  }
}

output "mod01-vpcs" {
  value = module.mod01.vpcs_id
}

output "mod02-vpcs" {
  value = module.mod02.vpcs_id
}
