module "webserver-cluster" {
  source = "../modules/webserver-cluster"
  image_id = "0453ec754f44f9a4a"
}

provider "aws" {
 region = "us-east-1" 
}

output "cluster_alb_dns_name" {
  value = module.webserver-cluster.alb_dns_name
}

