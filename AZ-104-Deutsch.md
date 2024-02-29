
[AZ-104 Prüfungsvorbereitung Playlist](https://www.youtube.com/playlist?list=PLi0MTIjZai_w3XzmNKEtmHH9podU_r3sh)

[AZ-104 Study Guide: Azure Administrator](https://www.thomasmaurer.ch/2020/03/az-104-study-guide-azure-administrator/)  

[Tom Wechlser GitHub](https://github.com/tomwechsler)  
[Tom Wechlser GitHub - AZ-104](https://github.com/tomwechsler/Azure_Administrator_Associate)  
[Tom Wechlser GitHub - Azure_PowerShell_Administration](https://github.com/tomwechsler/Azure_PowerShell_Administration)  
[Tom Wechlser GitHub - Azure_Cloud_Shell](https://github.com/tomwechsler/Azure_Cloud_Shell)


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