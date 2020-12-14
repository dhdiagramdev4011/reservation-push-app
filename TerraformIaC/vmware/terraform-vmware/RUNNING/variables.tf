### list

# variable "list_example" {
#     description = "An example of a list in Terraform"
#     type = "list"
#     default = [1,2,3]
# }

# ## map
# variable "map_example" {
#     description = "An example of a map in Terraform"
#     type = "map"

#     default = {
#         key1 = "value1"
#         key2 = "value2"
#         key3 = "value3"
#     }
# }

### server_port input


variable "server_port" {
    description = "The port the server will use for HTTP requests"
}

