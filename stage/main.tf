module "webserver-cluster" {
  source = "../modules/webserver-cluster"
  image_id = "0aa8fc2422063977a"
}

provider "aws" {
 region = "us-east-2" 
}

output "cluster_alb_dns_name" {
  value = "https://${module.webserver-cluster.alb_dns_name}"
}

