##Public Global variables
/*variable "globals" {
  description = "Variables globales estaticas: app_code, env_name, env_code, provisioned_by y rsgr_sequential. Valor permitido: module.app.globals"
  type = object({
    app_code        = string
    env_name        = string
    env_code        = string
    provisioned_by  = string
    rsgr_sequential = string
  })

  validation {
    condition     = length(var.globals.app_code) == 4
    error_message = "Application Code must be a 4 letters string."
  }
  validation {
    condition     = contains(["JENKINS-V2", "jenkins", "tfe"], var.globals.provisioned_by)
    error_message = "Variables provisioned_by permited values are jenkins & tfe."
  }
}
*/
variable "locations_code" {
  description = "Lista que especifica los códigos de las regiones del recurso. Ejemplos: [\"eu2\"] | [\"eu2\",\"cu1\"]"
  type        = string
}

variable "resource_sequential" { 
  description = "Especifica el correlativo del recurso a desplegar por el modulo. Default: 01"
  type        = string
  default     = "01"
}

variable "tags" {
  description = "Mapa que especifica los tags personalizado del recurso. Ejemplo: {tag01=\"valor01\"}"
  type        = map(any)
  default     = {}
}
variable "name_rg" { 
  description = "Especifica el nombre del resource gorup"
  type        = string
  default     = "01"
}
variable "name_stac" { 
  description = "Especifica el nombre del storage account"
  type        = string
}

variable "name_keavult" { 
  description = "Especifica el nombre del keavult"
  type        = string
}
variable "name_replication" { 
  description = "Especifica la replicacion"
  type        = string
}
variable "name_sku_kv" { 
  description = "Especifica sku"
  type = string
}
#Variables locales
/*
  mlocation = {
    eu2 = "eastus2"
    eu = "eastus"
  }

  # definicion de tags no variables
  tags = {

    Aplicacion  = upper(var.globals.app_code)
    colaborativo   = "TIVIT-CLOUD"
    provisioned_by = "tfe"
    lbsVersion    = "1.0"
    moduleVersion = "1.0"
  }

  rsgr_code = "RG"
 }
##Context
*/
data "azurerm_subscription" "current" {}
data "azurerm_client_config" "current" {}