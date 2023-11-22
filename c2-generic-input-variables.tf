#Generic Input Variables
#Business Division
variable "business_divsion" {
  description = "Business Division in the large organisation this Infrastructure belongs"
  type        = string
  default     = "application"
}
#Enviroment Variables
variable "environment" {
  description = "Enviroment Variable used as a prefix"
  type        = string
  default     = "dev"
}
#Azure Resource Group Name
variable "resource_group_name" {
  description = "Resource Group Name"
  default     = "rg-default"
}
#Azure Resources Location
variable "resource_group_location" {
  description = "Region in which Azure Resources to be created"
  default     = "centralindia"
}
#Azure Kubernetes Cluster Version
variable "kubernetes_version" {
  description = "Kubernetes Version"
  default     = "1.26.6"
}
#Azure System Node Count
variable "system_node_count" {
  description = "Number of desired Nodes in System Pool"
  default     = 1
}
#Azure System Minimum Node Count
variable "system_min_node_count" {
  description = "Number of minimum nodes in System Pool"
  default     = 1
}
#Azure System Maximum Node Count
variable "system_max_node_count" {
  description = "Number of maximum nodes in System Pool"
  default     = 2
}
#Azure User Node Pool
variable "user_node_pool_name" {
  description = "Name of Node Pool"
  default     = "userpool"
}
#Azure Userpool Node Count
variable "user_node_count" {
  description = "Number of desired Nodes in User Pool"
  default     = 1
}
# #Azure Userpool Minimum Node Count
# variable "user_min_node_count" {
#   description = "Number of minimum nodes in User Pool"
#   default = 1
# }
# #Azure Userpool Maximum Node Count
# variable "user_max_node_count" {
#   description = "Number of maximum nodes in User Pool"
#   default = 2
# }