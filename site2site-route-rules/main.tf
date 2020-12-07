variable "gateway_id" {
    type = string
}

variable "route_tables" {
    type = list(string)
}

variable "destination_cidr_block" {
    type = string
    default = "192.168.0.0/16"
}

resource "aws_route" "r" {
    for_each = toset(var.route_tables)
    destination_cidr_block = var.destination_cidr_block
    gateway_id             = var.gateway_id
    route_table_id         = each.value
}