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

# listen wir auf alle RGruppen in diese Subscription 
Get-AzResourceGroup | Select-Object -Property ResourceGroupName, ResourceId 

# -------------------------------------------------------------
# mit Azure CLI: 

# einen RG erstellen
az group create --name $rg --location $loc

# listen wir auf alle RGruppen in diese Subscription 
# Get-AzResourceGroup | Select-Object -Property ResourceGroupName, ResourceId 

# TSV output format
# https://learn.microsoft.com/en-us/cli/azure/format-output-azure-cli?tabs=bash 
# <tsv>
az group list --output tsv
az group list --output tsv --query '[].[name, id]'   # besser für die Bearbeitung
# <table>
az group list --output table --query '[].[name, id]' # bessere Ausgabe

# -------------------------------------------------------------------------------------------

# JMESPath queries

# https://learn.microsoft.com/en-us/cli/azure/query-azure-cli?tabs=concepts%2Cbash
# https://www.azurecitadel.com/cli/jmespath/
az group list --output json --query "[?name == 'az-104-rg']"

# Funktione anwenden
# https://stackoverflow.com/questions/76189228/cant-use-contains-filtering-query-in-azure-cli
az group list --query "[?contains(name,'az-104')].{Name: name}" 
az group list --output table --query "[?contains(name,'az-104')].{Name: name, Id: id}" 

# -------------------------------------------------------------

# GREP > nur in BASH !
az group list --output table --query '[].[name, id]' | grep 104 | cut -f4

# -------------------------------------------------------------

Set-Location c:\
Clear-Host

Install-Module -Name Az -Force -AllowClobber -Verbose

#Log into Azure
Connect-AzAccount

#Select the correct subscription
Get-AzSubscription -SubscriptionName "MSDN Platforms" | Select-AzSubscription
Get-AzContext

#Create a resource group
New-AzResourceGroup -Name myResourceGroupAG -Location "westeurope"

#Create network resources
$agSubnetConfig = New-AzVirtualNetworkSubnetConfig `
  -Name myAGSubnet `
  -AddressPrefix 10.0.1.0/24

$backendSubnetConfig = New-AzVirtualNetworkSubnetConfig `
  -Name myBackendSubnet `
  -AddressPrefix 10.0.2.0/24

New-AzVirtualNetwork `
  -ResourceGroupName myResourceGroupAG `
  -Location WestEurope `
  -Name myVNet `
  -AddressPrefix 10.0.0.0/16 `
  -Subnet $agSubnetConfig, $backendSubnetConfig

New-AzPublicIpAddress `
  -ResourceGroupName myResourceGroupAG `
  -Location WestEurope `
  -Name myAGPublicIPAddress `
  -AllocationMethod Static `
  -Sku Standard

#Create the IP configurations and frontend port
$vnet   = Get-AzVirtualNetwork -ResourceGroupName myResourceGroupAG -Name myVNet
$subnet = Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name myAGSubnet
$pip    = Get-AzPublicIPAddress -ResourceGroupName myResourceGroupAG -Name myAGPublicIPAddress 

$gipconfig = New-AzApplicationGatewayIPConfiguration `
  -Name myAGIPConfig `
  -Subnet $subnet

$fipconfig = New-AzApplicationGatewayFrontendIPConfig `
  -Name myAGFrontendIPConfig `
  -PublicIPAddress $pip

$frontendport = New-AzApplicationGatewayFrontendPort `
  -Name myFrontendPort `
  -Port 80

#Create the backend pool
$backendPool = New-AzApplicationGatewayBackendAddressPool `
  -Name myAGBackendPool

$poolSettings = New-AzApplicationGatewayBackendHttpSetting `
  -Name myPoolSettings `
  -Port 80 `
  -Protocol Http `
  -CookieBasedAffinity Enabled `
  -RequestTimeout 30

#Create the listener and add a rule
$defaultlistener = New-AzApplicationGatewayHttpListener `
  -Name myAGListener `
  -Protocol Http `
  -FrontendIPConfiguration $fipconfig `
  -FrontendPort $frontendport

$frontendRule = New-AzApplicationGatewayRequestRoutingRule `
  -Name rule1 `
  -RuleType Basic `
  -HttpListener $defaultlistener `
  -BackendAddressPool $backendPool `
  -BackendHttpSettings $poolSettings

#Create the application gateway
$sku = New-AzApplicationGatewaySku `
  -Name Standard_v2 `
  -Tier Standard_v2 `
  -Capacity 2

New-AzApplicationGateway `
  -Name myAppGateway `
  -ResourceGroupName myResourceGroupAG `
  -Location WestEurope `
  -BackendAddressPools $backendPool `
  -BackendHttpSettingsCollection $poolSettings `
  -FrontendIpConfigurations $fipconfig `
  -GatewayIpConfigurations $gipconfig `
  -FrontendPorts $frontendport `
  -HttpListeners $defaultlistener `
  -RequestRoutingRules $frontendRule `
  -Sku $sku

#Backend servers
$appgw = Get-AzApplicationGateway -ResourceGroupName myResourceGroupAG -Name myAppGateway
$backendPool = Get-AzApplicationGatewayBackendAddressPool -Name myAGBackendPool -ApplicationGateway $appgw
$vnet   = Get-AzVirtualNetwork -ResourceGroupName myResourceGroupAG -Name myVNet
$subnet = Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name myBackendSubnet
$cred = Get-Credential

for ($i=1; $i -le 2; $i++)
{
  $nic = New-AzNetworkInterface `
    -Name myNic$i `
    -ResourceGroupName myResourceGroupAG `
    -Location WestEurope `
    -Subnet $subnet `
    -ApplicationGatewayBackendAddressPool $backendpool
  $vm = New-AzVMConfig `
    -VMName myVM$i `
    -VMSize Standard_DS2_v2
  Set-AzVMOperatingSystem `
    -VM $vm `
    -Windows `
    -ComputerName myVM$i `
    -Credential $cred
  Set-AzVMSourceImage `
    -VM $vm `
    -PublisherName MicrosoftWindowsServer `
    -Offer WindowsServer `
    -Skus 2016-Datacenter `
    -Version latest
  Add-AzVMNetworkInterface `
    -VM $vm `
    -Id $nic.Id
  Set-AzVMBootDiagnostic `
    -VM $vm `
    -Disable
  New-AzVM -ResourceGroupName myResourceGroupAG -Location WestEurope -VM $vm
  Set-AzVMExtension `
    -ResourceGroupName myResourceGroupAG `
    -ExtensionName IIS `
    -VMName myVM$i `
    -Publisher Microsoft.Compute `
    -ExtensionType CustomScriptExtension `
    -TypeHandlerVersion 1.4 `
    -SettingString '{"commandToExecute":"powershell Add-WindowsFeature Web-Server; powershell Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername)"}' `
    -Location WestEurope
}

#Test the application gateway
Get-AzPublicIPAddress -ResourceGroupName myResourceGroupAG -Name myAGPublicIPAddress

#Open the Browser!

#Clean Up
Remove-AzResourceGroup -Name myResourceGroupAG -Force


# ----------------------------------------------------------------------
# Achtung: vergessen sie nicht am Schluss das Aufräumen!
az group delete --name $rg -Force
# ----------------------------------------------------------------------
