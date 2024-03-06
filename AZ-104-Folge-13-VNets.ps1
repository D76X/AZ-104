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
az group create --name rg --location loc

# einen VNet erstellen und ihn in einen RG ablegen
# https://learn.microsoft.com/en-us/azure/virtual-network/quick-create-cli
$ntw1='ntw1'
az network vnet create -name ntw1 `
--resource-group rg `
--address-prefix 10.0.0.0/16 `
--subnet-name subnet1 `
--subnet-prefixes 10.0.0.0/24 





