##Resource Group Variables##
variable "vmrgname"   { type = string }
variable "ciregion"   { type = string }
variable "vnetrgname" { type = string }

##Tag Variables##
variable "createdthru" { type = string }
variable "owner"       { type = string }
variable "supportteam" { type = string }
variable "env"         { type = string }
variable "appowner"    { type = string }

##Vnet and Subnet Variables##
variable "vnetname"  { type = string }
variable "vnetaddr"  { type = list   }
variable "sbt01name" { type = string }
variable "sbt01addr" { type = list   }
variable "sbt02name" { type = string }
variable "sbt02addr" { type = list   }

##NSG Variables##
variable "pusunsg" { type = string }
variable "prsunsg" { type = string }


##VM Sizes##
variable "vmsize" {
  type = map 
  default = {
    "bsmll24"  = "Standard_B2s"
    "bmed28"   = "Standard_B2ms"
    "blar416"  = "Standard_B4ms"
    "bxlar832" = "Standard_B8ms"
    "bxxl1664" = "Standard_B16ms"
  }
}

/*
variable "vmmap" {
  type = map(object({
    name = string
    vmsize = string
    ddsize = string
    ossku = string
  }))
  default = {
    "vm1" = {
      name = "tstwvm01"
      vmsize = "Standard_B2s"
      ddsize = "8"
      ossku  = "2019-Datacenter"
    }
    "vm2" = {
      name = "tstwvm02"
      vmsize = "Standard_B2ms"
      ddsize = "8"
      ossku = "2019-Datacenter"
    }
    "vm3" = {
      name = "tstwvm03"
      vmsize = "Standard_B2s"
      ddsize = "4"
      ossku = "2016-Datacenter"
    }
  }
}*/