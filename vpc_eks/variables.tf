variable "group_name" {}
variable "account_short_name" {}
variable "eks_version" {}
variable "region" {}
variable "vpc_cidr" {}
variable "public_subnets" {}
variable "private_subnets" {}

variable "node_groups" {
  type = any
}
