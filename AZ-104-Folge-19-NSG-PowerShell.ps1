# den Login ausführen und an Azure AD sich anmelden
az login
az account show
#az account list --all # die Ausgabe wird als Json
#az account list --all --output table # with headers
az account list --all --output tsv # without headers
az account set --subcription "Visual Studio Professional with MSDN"

Get-AzNetworkSecurityGroup | Select-Object -Property Name, ResourceGroupName 

# einen RG erstellen
$rg='az-104-rg'
$loc='westeurope'


# -------------------------------------------------------------
# mit Azure CLI: 

# einen RG erstellen
az group create --name $rg --location $loc

# einen VNet mit einem Subbnetz erstellen 
# https://learn.microsoft.com/en-us/azure/virtual-network/quick-create-cli
$ntw1='ntw1'
az network vnet create --name $ntw1 `
--resource-group $rg `
--address-prefixes 10.0.0.0/16 `
--subnet-name subnet1 `
--subnet-prefixes 10.0.3.0/24

# -------------------------------------------------------------

# NSG Regeln erstellen
# die nidrigste Priorität die wir auswählen können ist 100
# 100 meint, dass die Regel an erste Stelle Regel abgearbeitet wird
# merken es hier bitte, dass 'Internet' ein sogennante Service Tag ist

# den Zugriff durch RDP erlauben
$rule1 = New-AzNetworkSecurityRuleConfig -Name AllowRDP -Description "allow RDP" `
-Access Allow -Protocol Tcp `
-Direction Inbound -Priority 300 `
-SourceAddressPrefix Internet -SourcePortRange * `
-DestinationAddressPrefix * -DestinationPortRange 3389

# den Zugriff über HTTP erlauben
$rule2 = New-AzNetworkSecurityRuleConfig -Name AllowWebTraffic -Description "allow HTTP(S)" `
-Access Allow -Protocol Tcp `
-Direction Inbound -Priority 400 `
-SourceAddressPrefix Internet -SourcePortRange * `
-DestinationAddressPrefix * -DestinationPortRange 80, 443

# einen NSG erstellen
$nsg = New-AzNetworkSecurityGroup -Name "nsg-frontend" -ResourceGroupName $rg `
-Location $loc `
-SecurityRules $rule1, $rule2

# ----------------------------------------------------------------------

# Überprüfung
Get-AzNetworkSecurityGroup | Select-Object -Property Name, ResourceGroupName

# ----------------------------------------------------------------------
# einen NSG einem VNet zuweisen

$vNet1 = Get-AzVirtualNetwork -Name $ntw1

$vNet1Subnetz1 = Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $vNet1

Set-AzVirtualNetworkSubnetConfig -Name $vNet1Subnetz1.Name `
-VirtualNetwork $vNet1 `
-AddressPrefix $vNet1Subnetz1.AddressPrefix `
-NetworkSecurityGroup $nsg

# das Update zu dem VNet übergeben
$vNet1 | Set-AzVirtualNetwork

# überprüfung der Zuweisung des NSG zu dem Subnetz
(Get-AzVirtualNetwork -Name $ntw1).Subnets 
(Get-AzVirtualNetwork -Name $ntw1).Subnets[0].NetworkSecurityGroup 

# ----------------------------------------------------------------------
# Achtung: vergessen sie nicht am Schluss das Aufräumen!
az group delete --name $rg
# ----------------------------------------------------------------------
