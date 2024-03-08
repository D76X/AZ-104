# den Login ausführen und an Azure AD sich anmelden
az login
az account show
#az account list --all # die Ausgabe wird als Json
#az account list --all --output table # with headers
az account list --all --output tsv # without headers
az account set --subcription "Visual Studio Professional with MSDN"

# einen RG erstellen
$rg='az-104-rg'
$loc='westeurope'
az group create --name $rg --location $loc

# einen VNet erstellen und ihn in einen RG ablegen
# Quickstart: Use the Azure CLI to create a virtual network
# https://learn.microsoft.com/en-us/azure/virtual-network/quick-create-cli

# Die 10.0.0.0/24 spezifiziert die erste IP-Adresse und die Größe des Subnetzes 
# in das Netzwerk dessen Netzbereich startet mit der IP-Adresse 10.0.0.0/16. 
# Es ist empfehlenswert, dass in eine produktive Umgebung die erste Menge von 
# IP-Addresse (10.0.0.0/16) nie zu einem Subnetz zugewiesen wirt, deshalb soll 
# man nie einen Subnetz zu erstellen, dass in Bezug zu diesem Beispiel 
# mit 10.0.0.0/24 startet.  
# Der erste Menge IP-Adresse von 10.0.0.0/24 wird üblicherweise für die 
# Erstellung von bestimmten Subnetze von Azure verwendet, man soll diese 
# Menge IP-Adresse frei bleiben lassen. 

$ntw1='ntw1'
az network vnet create --name $ntw1 `
--resource-group $rg `
--address-prefix 10.0.0.0/16 `
--subnet-name subnet1 `
--subnet-prefixes 10.0.1.0/24 `
--location $loc

# ----------------------------------------------------------------------

# Die Bereitstellung ein Netzwerk mit PowerShell durchführen
# https://github.com/tomwechsler/Azure_PowerShell_Administration/blob/master/06_Create%20Azure_VNet.ps1

# Connect-AzAccount
# Get-AzSubscription
# Set-AzContext -Subscription 83bedf1c-859c-471d-831a-fae20a378f44
Get-AzContext

New-AzResourceGroup -Name $rg -Location $loc

# wir setzen einen vershiedene private IP-Addressebereich 192.168.0.0/16 für diese 
# zweite Netzerk als der wir für ntw1 genützt haben d.h.10.0.0.0/16, ebenfalls wird
# das erste Subnetz in ntw1 nicht von 192.168.0.0/24 gestartet, sondern wird es von
# 192.168.1.0/24 starten.
$ntw2='ntw2'
$virtualNetwork = New-AzVirtualNetwork `
  -ResourceGroupName $rg `
  -Location $loc `
  -Name $ntw2 `
  -AddressPrefix 192.168.0.0/16

 $subnetConfig = Add-AzVirtualNetworkSubnetConfig `
  -Name default `
  -AddressPrefix 192.168.1.0/24 `
  -VirtualNetwork $virtualNetwork

# Associate the subnet to the virtual network
# den Subnetz wird mit ihrem Netzwerk assoziiert
# wir müssen hier sämtliche Informationen über das Netzwerk übegeben
$virtualNetwork | Set-AzVirtualNetwork

# ----------------------------------------------------------------------

#VNet-Peering


# ----------------------------------------------------------------------

$virtualNetwork1 = Get-AzVirtualNetwork -Name $ntw1 -ResourceGroupName $rg
$virtualNetwork2 = Get-AzVirtualNetwork -Name $ntw2 -ResourceGroupName $rg

# Der Behfel ‘Add-AzVirtualNetworkPeering’ mindestens zweimal verwendet müss, 
# die este Mal um die Verbindung von VNet1 zu VNet2 zu erzeugen, die zweite Mal 
# um die gleiche Verbindung aber in die umgekehrte Reihenfolge zu erschaffen 
# d.h. von VNet2 zu VNet1.

# VNet1 zu VNet2
Add-AzVirtualNetworkPeering `
  -Name myVirtualNetwork1-myVirtualNetwork2 `
  -VirtualNetwork $virtualNetwork1 `
  -RemoteVirtualNetworkId $virtualNetwork2.Id

# Confirm that the peering state
# PeeringState = Initiated
Get-AzVirtualNetworkPeering `
  -ResourceGroupName $rg `
  -VirtualNetworkName $virtualNetwork1.Name `
  | Select PeeringState

# VNet2 zu VNet1
Add-AzVirtualNetworkPeering `
  -Name myVirtualNetwork1-myVirtualNetwork2 `
  -VirtualNetwork $virtualNetwork2 `
  -RemoteVirtualNetworkId $virtualNetwork1.Id

# Confirm that the peering state
# PeeringState = Connected
Get-AzVirtualNetworkPeering `
  -ResourceGroupName $rg `
  -VirtualNetworkName $virtualNetwork1.Name `
  | Select PeeringState

# Confirm that the peering state
# PeeringState = Connected
Get-AzVirtualNetworkPeering `
  -ResourceGroupName $rg `
  -VirtualNetworkName $virtualNetwork2.Name `
  | Select PeeringState


# ----------------------------------------------------------------------

# VNet-Peering mit Azure CLI
# https://learn.microsoft.com/en-us/azure/virtual-network/quick-create-cli
$ntw3='ntw3'
az network vnet create --name $ntw3 `
--resource-group $rg `
--address-prefixes 10.0.0.0/16 `
--subnet-name subnet1 `
--subnet-prefixes 10.0.3.0/24


$ntw4='ntw4'
az network vnet create --name $ntw4 `
--resource-group $rg `
--address-prefixes 10.1.0.0/16 `
--subnet-name subnet1 `
--subnet-prefixes 10.1.5.0/24

# die ID suchen von unsere Netzwerke suchen
# man muss auf die Folgende achten: wenn das Script ist in das CloudShell ausgeführt muss \
# man die Variablenamen nicht mit $ voranstellen
$vNet3Id=$(az network vnet show --resource-group "$rg" --name "$ntw3" --query id --out tsv)
$vNet4Id=$(az network vnet show --resource-group "$rg" --name "$ntw4" --query id --out tsv)

‡ https://learn.microsoft.com/en-us/cli/azure/network/vnet/peering?view=azure-cli-latest
# das Peering vnet3 zu vnet4
az network vnet peering create --name pring-vnet3-vnet4 `
--resource-group $rg `
--vnet-name $ntw3 `
--remote-vnet $vNet4Id

# "Initiated"
az network vnet peering show --name pring-vnet3-vnet4 `
--resource-group $rg `
--vnet-name $ntw3 `
--query peeringState

# die Gegenseite des VNet-Peerings
az network vnet peering create --name pring-vnet4-vnet3 `
--resource-group $rg `
--vnet-name $ntw4 `
--remote-vnet $vNet3Id

# "Connected"
az network vnet peering show --name pring-vnet3-vnet4 `
--resource-group $rg `
--vnet-name $ntw3 `
--query peeringState

# Achtung: vergessen sie nicht am Schluss das Aufräumen!
az group delete --name $rg
# ----------------------------------------------------------------------

