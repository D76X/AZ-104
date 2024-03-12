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
