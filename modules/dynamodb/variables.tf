variable "environment" {
  type = string
}

variable "table_name" {
  type    = string
  default = "ToggleMasterAnalytics"
}

variable "hash_key" {
  type    = string
  default = "id"
}

variable "range_key" {
  type    = string
  default = "timestamp"
}

variable "attributes" {
  type = list(object({
    name = string
    type = string
  }))
  default = [
    {
      name = "id"
      type = "S"
    },
    {
      name = "timestamp"
      type = "S"
    }
  ]
}

variable "billing_mode" {
  type    = string
  default = "PAY_PER_REQUEST"
}

variable "tags" {
  type    = map(string)
  default = {}
}