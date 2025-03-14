provider "azurerm" {
  features {}
  subscription_id = "1fe49dcb-216b-4a9c-a412-afa7742cee3d"
}
terraform {
  backend "azurerm" {
    resource_group_name  = "delete-mt-karna"
    storage_account_name = "kadirst0325"
    container_name       = "con"
    key                  = "prod.terraform.tfstate"
  }
}
