locals {
  env_vars = yamldecode(file("${"dev-environment.yaml"}"),
  )
}

terraform {
    source = "git::git@github.com:Omqarrr/terraform-sample.git//modules/ec2?ref=${local.tag}"
}

inputs = {
  ami_id  = local.env_vars.locals.ami_id
  instance_type = local.env_vars.locals.instance_type
  location = local.env_vars.locals.location
  env = local.env_vars.locals.env
  tags = {
    Name = "Terragrunt EC2"
  }
}

include {
  path = find_in_parent_folders()
}