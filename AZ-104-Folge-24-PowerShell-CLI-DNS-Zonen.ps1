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
# JMESPath queries
az group list --output table --query "[?contains(name,'$rg')].{Name: name, Id: id}" 

# -------------------------------------------------------------

$dnszonename = "tom.pip.xyz"

New-AzDnsZone -Name $dnszonename -ResourceGroupName $rg

New-AzDnsRecordSet -Name www -RecordType A -ZoneName $dnszonename `
-ResourceGroupName $rg `
-Ttl 3600 `
-DnsRecords (New-AzDnsRecordConfig -IPv4Address "10.10.10.10")

Get-AzDnsRecordSet -ZoneName $dnszonename -ResourceGroupName $rg

# -RecordType ns > bedeutet Name Server, es gibt vielen Types von RS
Get-AzDnsRecordSet -ZoneName $dnszonename -ResourceGroupName $rg -RecordType ns

# verifizieren wir es, dass die neue Zone, durch eine der Name Servers, die für 
# diese Zone auf Azure zu Verfügung gestanden haben, aufgelöst werden kann
nslookup www.tom.pip.xyz ns1-36.azure-dns.com

# ----------------------------------------------------------------------
# Achtung: vergessen sie nicht am Schluss das Aufräumen!
az group delete --name $rg -Force
# ----------------------------------------------------------------------

