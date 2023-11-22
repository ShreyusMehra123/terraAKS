# Static Public IP Address for NAT Gateway
resource "azurerm_public_ip" "natgwip" {
  name                = "${local.resource_name_prefix}-natgw-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

#NAT Gateway for AKS Node Pools Subnet
resource "azurerm_nat_gateway" "natgw" {
  name                    = "${local.resource_name_prefix}-natgw-${var.resource_group_location}"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 4
}

#NAT - Public IP Association
resource "azurerm_nat_gateway_public_ip_association" "natgwapip" {
  nat_gateway_id       = azurerm_nat_gateway.natgw.id
  public_ip_address_id = azurerm_public_ip.natgwip.id
}

#NAT - Subnets Association
resource "azurerm_subnet_nat_gateway_association" "natsubnet" {
  subnet_id      = azurerm_subnet.internal.id
  nat_gateway_id = azurerm_nat_gateway.natgw.id
}


