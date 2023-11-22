# Azure Kubernetes Service 
resource "azurerm_kubernetes_cluster" "aks" {
  name                      = "${local.resource_name_prefix}-k8s-${var.resource_group_location}"
  kubernetes_version        = var.kubernetes_version
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name
  dns_prefix                = "${local.resource_name_prefix}-k8s"
  automatic_channel_upgrade = "stable"
  sku_tier                  = "Standard"

  # auto_scaler_profile {
  #   # balance_similar_node_groups = true
  #   max_node_provisioning_time = 5
  # }

  default_node_pool {
    name                = "system"
    node_count          = var.system_node_count
    vm_size             = "Standard_F8s_v2"
    type                = "VirtualMachineScaleSets"
    zones               = [1, 2, 3]
    enable_auto_scaling = true
    min_count           = var.system_min_node_count
    max_count           = var.system_max_node_count
    max_pods            = 110
    scale_down_mode     = "Delete"
    vnet_subnet_id      = azurerm_subnet.internal.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet"
    network_policy    = "calico"
  }

  tags = local.common_tags
}

# User Nodepool
resource "azurerm_kubernetes_cluster_node_pool" "aks_user_pool" {
  name                  = var.user_node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = "Standard_D2s_v3"
  node_count            = var.user_node_count
  enable_auto_scaling   = false
  zones                 = [1, 2, 3]
  max_pods              = 100
  vnet_subnet_id        = azurerm_subnet.internal.id
  tags                  = local.common_tags
}