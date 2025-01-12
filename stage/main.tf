module "webserver-cluster" {
  source = "../modules/webserver-cluster"
  image_id = "0aa8fc2422063977a"
  asg_min_size = 1
  instance_type = "t2.micro"
}

provider "aws" {
 region = "us-east-2" 
}

output "cluster_alb_dns_name" {
  value = module.webserver-cluster.alb_dns_name
}

