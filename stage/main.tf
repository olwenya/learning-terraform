module "webserver-cluster" {
  source = "../modules/webserver-cluster"
  image_id = "0fb653ca2d3203ac1"
}

provider "aws" {
 region = "us-east-2" 
}

output "cluster_alb_dns_name" {
  value = module.webserver-cluster.alb_dns_name
}

