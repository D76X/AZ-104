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

#Search for the resource groups
Get-AzResourceGroup | Format-Table

#Whats in a specific resource group
Get-AzResource -ResourceGroupName tw-azuredemo-rg | Format-Table

#Some variables
$RGName = "tw-azuredemo-rg"
$VnetName = "tw-vnet-workload"
$Location = "westeurope"
$VMName = "twsrv2021"
$credential = Get-Credential

#We need all infos about the virtual network
$VirtualNetwork = (Get-AzVirtualNetwork -Name $VnetName -ResourceGroupName $RGName)

#Let's have a look at the variable
$VirtualNetwork

#Create a network interface
$nic = New-AzNetworkInterface `
    -ResourceGroupName $RGName `
    -Name "twsrv2021-nic" `
    -Location $Location `
    -SubnetId $VirtualNetwork.Subnets[0].Id

#Define your VM
$vmConfig = New-AzVMConfig -VMName $VMName -VMSize "Standard_D2s_v4"

#Create the rest of your VM configuration
$vmConfig = Set-AzVMOperatingSystem -VM $vmConfig `
    -Windows `
    -ComputerName $VMName `
    -Credential $credential `
    -ProvisionVMAgent `
    -EnableAutoUpdate
$vmConfig = Set-AzVMSourceImage -VM $vmConfig `
    -PublisherName "MicrosoftWindowsServer" `
    -Offer "WindowsServer" `
    -Skus "2016-Datacenter" `
    -Version "latest"

#Attach the network interface that you previously created
$vmConfig = Add-AzVMNetworkInterface -VM $vmConfig -Id $nic.Id

#Create your VM
New-AzVM -VM $vmConfig -ResourceGroupName $RGName -Location $Location


# ----------------------------------------------------------------------
# Achtung: vergessen sie nicht am Schluss das Aufräumen!
az group delete --name $rg -Force
# ----------------------------------------------------------------------


