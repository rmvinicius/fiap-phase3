variable "environment" {
  type = string
}

variable "dynamodb_table_name" {
  type    = string
  default = "ToggleMasterAnalytics"
}

variable "dynamodb_billing_mode" {
  type    = string
}

variable "dynamodb_read_capacity" {
  type    = number
}

variable "dynamodb_write_capacity" {
  type    = number
}


variable "dynamodb_hash_key" {
  type    = string
  default = "id"
}

variable "dynamodb_range_key" {
  type    = string
  default = "timestamp"
}

variable "dynamodb_attributes" {
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

