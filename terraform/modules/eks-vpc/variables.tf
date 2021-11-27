variable "eks_vpc_block" {
  type = string
  description = "The vpc CIDR block is needed example 10.0.0.0/16"
}

variable "eks_private_subnets_prefix_list" {
  type = list(string)
  description = "The VPC'S private subnet that is needed for EKS cluster"
}

variable "eks_public_subnets_prefix_list" {
  type = list(string)
  description = "The VPC'S public subnet that is needed for EKS cluster"
}

variable "clusters_name_prefix" {
  type = string
  description = "The EKS cluster name example my-project"
  default = "aws"
}

variable "common_tags" {
  type = map(string)
  description = "Common tag you generally use example project, environment etc"
}
