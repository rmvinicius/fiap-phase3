variable "environment" {
  type = string
}

variable "cluster_name" {
  type    = string
  default = "eks-dev-01"
}

variable "cluster_version" {
  type    = string
  default = "1.35"
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "node_groups" {
  type = list(object({
    name         = string
    instance_type = string
    desired_size  = number
    min_size      = number
    max_size      = number
  }))
  default = []
}