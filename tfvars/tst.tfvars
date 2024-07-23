##Resource Group Values##
vmrgname   = "tstvmrg"
ciregion   = "centralindia"
vnetrgname = "tstvnetrg"

##Tag Values##
createdthru  = "Terraform"
owner        = "Santosh Reddy"
supportteam  = "CloudOps"
env          = "Test"
appowner     = "xyz"

##VNet and Subnet Values##
vnetname   = "tstvnet"
vnetaddr   = ["10.1.0.0/16", "10.2.0.0/16"]
sbt01name  = "Public_Subnet"
sbt01addr  = ["10.1.0.0/28"]
sbt02name  = "Private_Subnet"
sbt02addr  = ["10.1.0.16/28"]

##NSG Values##
pusunsg = "tstvnet_pusu_nsg"
prsunsg = "tstvnet_prsu_nsg"
