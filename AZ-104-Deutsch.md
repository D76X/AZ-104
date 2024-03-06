
[AZ-104 Prüfungsvorbereitung Playlist](https://www.youtube.com/playlist?list=PLi0MTIjZai_w3XzmNKEtmHH9podU_r3sh)

[AZ-104 Study Guide: Azure Administrator](https://www.thomasmaurer.ch/2020/03/az-104-study-guide-azure-administrator/)  

[Tom Wechlser GitHub](https://github.com/tomwechsler)  
[Tom Wechlser GitHub - AZ-104](https://github.com/tomwechsler/Azure_Administrator_Associate)  
[Tom Wechlser GitHub - Azure_PowerShell_Administration](https://github.com/tomwechsler/Azure_PowerShell_Administration)  
[Tom Wechlser GitHub - Azure_Cloud_Shell](https://github.com/tomwechsler/Azure_Cloud_Shell)


---


[06_Create Azure_VNet.ps1](https://github.com/tomwechsler/Azure_PowerShell_Administration/blob/master/06_Create%20Azure_VNet.ps1)  

```
Set-Location c:\
Clear-Host

Install-Module -Name Az -Force -AllowClobber -Verbose

Connect-AzAccount
Get-AzContext
Get-AzSubscription
Set-AzContext -Subscription 83bedf1c-859c-471d-831a-fae20a378f44
#Create a resource group
New-AzResourceGroup -Name myResourceGroup -Location WestEurope

#Create the virtual network
$virtualNetwork = New-AzVirtualNetwork `
  -ResourceGroupName myResourceGroup `
  -Location WestEurope `
  -Name myVirtualNetwork `
  -AddressPrefix 192.168.0.0/16

#Add a subnet
$subnetConfig = Add-AzVirtualNetworkSubnetConfig `
  -Name default `
  -AddressPrefix 192.168.0.0/24 `
  -VirtualNetwork $virtualNetwork

#Associate the subnet to the virtual network
$virtualNetwork | Set-AzVirtualNetwork

#Create virtual machines
New-AzVm `
    -ResourceGroupName "myResourceGroup" `
    -Location "WestEurope" `
    -VirtualNetworkName "myVirtualNetwork" `
    -SubnetName "default" `
    -Name "myVm1" `
    -AsJob

Get-Job

New-AzVm `
    -ResourceGroupName "myResourceGroup" `
    -Location "WestEurope" `
    -VirtualNetworkName "myVirtualNetwork" `
    -SubnetName "default" `
    -Name "myVm2"

#Connect to a VM from the internet
Get-AzPublicIpAddress `
  -Name myVm1 `
  -ResourceGroupName myResourceGroup `
  | Select IpAddress

Get-AzPublicIpAddress `
  -Name myVm2 `
  -ResourceGroupName myResourceGroup `
  | Select IpAddress
```


---

[Add_Tags_RG.ps1](https://github.com/tomwechsler/Azure_PowerShell_Administration/blob/master/Add_Tags_RG.ps1)  

```
Set-Location C:\
Clear-Host
Install-Module -Name Az -Force -AllowClobber -Verbose

#Log into Azure
Connect-AzAccount

#Select the correct subscription
Get-AzSubscription -SubscriptionName "MSDN Platforms" | Select-AzSubscription

#Tags
(Get-AzResourceGroup -Name tw-rg01).Tags

(Get-AzResource -ResourceName tw-winsrv -ResourceGroupName tw-rg01).Tags

Set-AzResourceGroup -Name tw-rg01 -Tag @{ costcenter="1987"; ManagedBy="Bob" }

$tags = (Get-AzResourceGroup -Name tw-rg01).Tags
$tags.Add("Status", "Approved")
Set-AzResourceGroup -Tag $tags -Name tw-rg01

$r = Get-AzResource -ResourceName tw-winsrv -ResourceGroupName tw-rg01
Set-AzResource -Tag @{ Dept="IT"; Environment="Test" } -ResourceId $r.ResourceId -Force

$r = Get-AzResource -ResourceName tw-winsrv -ResourceGroupName tw-rg01
$r.Tags.Add("Status", "Approved")
Set-AzResource -Tag $r.Tags -ResourceId $r.ResourceId -Force
```

---

### [Folge 8 - Benutzerdefinierte RBAC](https://www.youtube.com/watch?v=1EAUzEQqpfc)

[4_Create_Custom_Role_tw.ps1](https://github.com/tomwechsler/Azure_PowerShell_Administration/blob/master/14_Create_Custom_Role_tw.ps1)  

```
# räume Sie das Bildschirm auf
﻿Clear-Host
# setze Sie den Fokus auf dem Laufwerk c:\
Set-Location c:\

# How to prevent error "WARNING: Unable to acquire token for tenant 'tenantid'" when running Powershell scripts in Azure
# https://stackoverflow.com/questions/58762844/how-to-prevent-error-warning-unable-to-acquire-token-for-tenant-tenantid-wh
# When i am trying to connect to my azure portal through powershell iam getting the error: WARNING: Unable to acquire token for tenant
# https://learn.microsoft.com/en-us/answers/questions/162802/when-i-am-trying-to-connect-to-my-azure-portal-thr
# Connect-AzAccount
# Get-AzSubscription

# der folgende Befehl funktioniert:
Connect-AzAccount -Subscription d..5b -TenantId 9..bc

# das Context läßt sich ganz einfach überprüfen
Get-AzContext

# Wir brauchen Informationen zu Providers, die die Objekte sind, dass 
# fähig sein etwas auf Azure zu machen. Es gibt, beispielweise Provider um virtuelle Maschinen
# oder auch Netzwerke usw. zu erstellen.
# In dem folgendedn Beispiel wir lenken die Ausgabe des Befehls in eine formattierte Tabelle
# 'Microsoft.Support/*' meint alle Befehlen und Funktionen die im Zusammenhang mit ITSM 
# Systeme und Benutzerunterstützung stehen.

Get-AzProviderOperation 'Microsoft.Support/*' | FT Operation, Description -AutoSize

# wir könnte die Definition eine neue Rolle auf eine bestehende Rolle basieren,
# deshalb möchten wir zuerst die entsprechende Json-Datei herunterladen und auf 
# einem lokalen Verzeichnis abspeichern.
# Wir erreichen diesen Ziel durch den folgende Befehl:
Get-AzRoleDefinition -Name "Reader" | ConvertTo-Json | Out-File "C:\Temp\AZ-104\Reader.json"

# Sie können diese Datei bearbeiten um alle nötigen Informationen zu hinzufügen, 
# außerdem sollen Sie die id erlöschen und IsCustom auf "true" setzen, 
# dann Sie können die anderen Werten hinzufügen, die die neue Rolle bestimmen. 

New-AzRoleDefinition -InputFile "C:\Temp\AZ-104\Reader-Custom.json"

# alle von die Custom-Rollen bekommen
Get-AzRoleDefinition | ? {$_.IsCustom -eq $true} | FT Name, IsCustom

# eine Rolle beim Name bekommen un die Asgabe des Befehls auf dem
# Bildschirm lenken
Get-AzRoleDefinition "Reader supprt Tickets"

# eine Rolle beim Id erlöchem
Remove-AzRoleDefinition -Id "a1...89t"


```

```

Get-AzRoleDefinition | ft
 
$customrole = Get-AzRoleDefinition "Virtual Machine Contributor"
$customrole.Id = $null
$customrole.Name = "Virtual Machine Starter"
$customrole.Description = "Provides the ability to start a virtual machine."
$customrole.Actions.Clear()
$customrole.Actions.Add("Microsoft.Storage/*/read")
$customrole.Actions.Add("Microsoft.Network/*/read")
$customrole.Actions.Add("Microsoft.Compute/*/read")
$customrole.Actions.Add("Microsoft.Compute/virtualMachines/start/action")
$customrole.Actions.Add("Microsoft.Authorization/*/read")
$customrole.Actions.Add("Microsoft.Resources/subscriptions/resourceGroups/read")
$customrole.Actions.Add("Microsoft.Insights/alertRules/*")
$customrole.AssignableScopes.Clear()
$customrole.AssignableScopes.Add("/subscriptions/<ihre Subscription ID>")
 
New-AzRoleDefinition -Role $customrole 
```

---

### [Folge 5 - PowerShell - Benutzer und Gruppen](https://www.youtube.com/watch?v=mAGH6NjCbdQ)   

---

#### PowerShell: Gruppe erstellen

[11_GroupOperations_tw.ps1](https://github.com/tomwechsler/Azure_PowerShell_Administration/blob/master/11_GroupOperations_tw.ps1)  

```
Get-AzureADGroup -SearchString "Administrator"   
Get-AzureADGroup -Filter "DisplayName eq 'Administrator'"
```

> einen Benutzer als Besitzer einer Gruppe hinzufügen

```
Clear-Host
Set-Location c:\

#Log into Azure
Connect-AzureAD

#Get all the groups in Azure AD Tenant
Get-AzureADGroup

#Create a new group
$group = @{
    DisplayName = "Fred Group"
    MailEnabled = $false
    MailNickName = "FredGroup"
    SecurityEnabled = $true
}

$fredGroup = New-AzureADGroup @group
Get-AzureADGroup -Filter "DisplayName eq 'Fred Group'" 

#Update the group description
Set-AzureADGroup -ObjectId $fredGroup.ObjectId -Description "Group for Fred to use."

#Set Fred as the owner
$fred = Get-AzureADUser -Filter "DisplayName eq 'Fred Prefect'"

Add-AzureADGroupOwner -ObjectId $fredGroup.ObjectId -RefObjectId $fred.ObjectId
Get-AzureADGroupOwner -ObjectId $fredGroup.ObjectId

#Fred is Owner but not a member!
# Der Benutzer Fred ist der Besitzer der Gruppe aber er ist keines Mitglied
Get-AzureADUserMembership -ObjectId $fred.ObjectId 

```

> einen Benutzer als Mitglied zu einer Gruppe hinzufügen

```
$tim = Get-AzureADUser -Filter "DisplayName eq 'Tim Jones'"
$tim
$tim | Format-List

Get-AzureADGroupMember -ObjectId $fredGroup.ObjectId
Add-AzureADGroupMember -ObjectId $fredGroup.ObjectId -RefObjectId $tim.ObjectId
Get-AzureADGroupMember -ObjectId $fredGroup.ObjectId

```

> vielen Benutzer gleichzeitich als Mitglieder zu einer Gruppe hinzufügen

```

#Add users to the group
$users = Get-AzureADUser -Filter "State eq 'SO'"

foreach($user in $users){
    Add-AzureADGroupMember -ObjectId $newGroup.ObjectId -RefObjectId $user.ObjectId
}

$group = Get-AzureADGroup -SearchString "Fred Group"

#Get all members and the owner
Get-AzureADGroupMember -ObjectId $group.ObjectId
```

> dynamic grouppe

```

#AzureADPreview Only
$dynamicGroup = @{
    DisplayName = "Marketing Group"
    MailEnabled = $false
    MailNickName = "MarketingGroup"
    SecurityEnabled = $true
    Description = "Dynamic group for Marketing"
    GroupTypes = "DynamicMembership"
    MembershipRule = "(user.department -contains ""Marketing"")"
    MembershipRuleProcessingState = "On"
}

New-AzureADMSGroup @dynamicGroup


```

---

#### PowerShell: einen Benutzer erstellen

[10_UserOperations_tw.ps1](https://github.com/tomwechsler/Azure_PowerShell_Administration/blob/master/10_UserOperations_tw.ps1)  


> ein Benutzer hinzufügen

```
Clear-Host
Set-Location c:\

#Log into Azure
Connect-AzureAD

$domain = "davidespanoxgmaiL.onmicrosoft.com"
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "agxsFX72xwsSAi"

#Find an existing user
Get-AzureADUser -SearchString "FR"
Get-AzureADUser -Filter "State eq 'SO'"

#Creating a new user
$user = @{
    City = "Bolzano"
    Country = "Italy"
    Department = "Information Technology"
    DisplayName = "Fred Prefect"
    GivenName = "Fred"
    JobTitle = "Azure Administrator"
    UserPrincipalName = "frPrefect@$domain"
    PasswordProfile = $PasswordProfile
    PostalCode = "39040"
    State = "BZ"
    StreetAddress = "Kappelleweg"
    Surname = "Prefect"
    TelephoneNumber = "455-233-22"
    MailNickname = "FrPrefect"
    AccountEnabled = $true
    UsageLocation = "IT"
}

$newUser = New-AzureADUser @user

$newUser | Format-List
Get-AzureADUser -SearchString "Fred Prefect"
Get-AzureADUser -Filter "DisplayName eq 'Fred Prefect'"

```

> einen zweite Benutzer hinzufügen

```
$user = @{
    City = "Bolzano"
    Country = "Italy"
    Department = "Information Technology"
    DisplayName = "Tim Jones"
    GivenName = "Time"
    JobTitle = "User"
    UserPrincipalName = "timJones@$domain"
    PasswordProfile = $PasswordProfile
    PostalCode = "39040"
    State = "BZ"
    StreetAddress = "Kappelleweg"
    Surname = "Jones"
    TelephoneNumber = "455-233-23"
    MailNickname = "timJones"
    AccountEnabled = $true
    UsageLocation = "IT"
}

$newUser = New-AzureADUser @user
$newUser | Format-List
Get-AzureADUser
Get-AzureADUser -SearchString "Tim Jones"
Get-AzureADUser -Filter "DisplayName eq 'Tim Jones'"
Get-AzureADUser -Filter "DisplayName eq 'Fred Prefect'" | Select-Object DisplayName, State, Department

```

---

[10_UserOperations_tw.ps1](https://github.com/tomwechsler/Azure_PowerShell_Administration/blob/master/10_UserOperations_tw.ps1)  

#### PowerShell: mit PowerShell Moduln arbeiten

```
Get-Help Get-InstalledModule
Get-InstalledModule 
Get-InstalledModule -Name 'Az'
Install-Module -Name AzureAD -AllowClobber -Force -Verbose
# Update-Module -Name SpeculationControl -RequiredVersion 1.0.14
```

#### PowerShell: auf Azure AD authentifizieren

```
# username and password to login to AzureAD
# https://stackoverflow.com/questions/58552071/connect-to-azure-ad-from-powershell-without-prompt
# getting into Azure AD or Azure using password based credentials may no lonher work
# since MFA has been set as a default nad may result in ADXXX errors
$Credential = Get-Credential #
Connect-AzureAD $Credential

# just use this and log in to Azure AD from the prompt with a user that has the
# roles that you need to perform the operations of interest.
Connect-AzureAD 

# VERIFY
Get-AzureADUser
```

---