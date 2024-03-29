# AZ-104 Practice Test 201 Questions

---

## Q9X:


---

### Answer:

---

### References:

---

## Q90:

You are an Azure admin and deploy Azure resource with Bicep.
You want to use Lamba functions to hadle an array.
Yiu need to convert an array to an object with a custom key function
and optional custom value function to produce teh follwoing output.

`{"MrFunny":{"name":"MrFunny","age":2},"MrNaughty":{"name":"MrNaughty","age":3},}`

which L;amba function should you use?

```
var cats = [
  {
    name: 'MrFunny'
    age: 2
  }
  {
    name: 'MrNaughty'
    age: 3
  }
]

output twocats object = OPTIONS (cats, entry=>entry.name)
```

---

### Answer:

---

### References:


---

## Q89:

You are an Azure admin for an eCommerce organization.
You deploy Azure resources and have created a Bicep file as shown below.

```

resource primaryDnsZone 'Microsoft.Network/dnszones@2018-05-01' = {
  name: 'myZone'
  location: 'global'  
}

resource otherResource 'Microsoft.Example/examples@2023-05-01' = {
  name: 'egResorce'
   properties: {
    // get read-only DNS zone property
    nameSrvers: PrimaryDnsZone.properies.nameServers
  }  
}

resource otherZone 'Microsoft.Network/dnszones@2023-06-01' = {
  name: 'demoZone2'
  location: 'global'  
  dependsOn: [PrimaryDnsZone]
}

```

For each statement select Yes/No

- the resource named otherResource is implicitly dependent on PrimaryDnsZome
- the resource named otherZoe is implicitly dependent on PrimaryDnsZome
- Azure Resource Manager deploys the PrimaryDnsZone and otherZone resources in parallel

---

### Answer:

---

### References:

---

## Q88:

Your organization uses Azure Advisor to optimize the Azure deployments.
You want to set up an alert for new recommendation from teh Azure Advisor using Bicep.
You need to define teh Azure resources in teh Bicep file named `main.bicep`

Which two resources should you use?

`Microsoft.Insights/activityLogAlerts`
`Microsoft.Insights/alertrules`
`Microsoft.Insights/actionGroups`
`Microsoft.Insights/dataCollectionRules`
`Microsoft.Insights/metricAlerts`


---

### Answer:
`Microsoft.Insights/activityLogAlerts`
`Microsoft.Insights/actionGroups`

---

### References:

[Quickstart: Create Azure Advisor alerts on new recommendations using Bicep](https://learn.microsoft.com/en-us/azure/advisor/advisor-alerts-bicep?tabs=CLI)    

[Introduction to Azure Advisor](https://learn.microsoft.com/en-us/azure/advisor/advisor-overview)  

---

## Q87:

An RG was deplyed from an ARM template.
Resouirces have since been added to the RG and some also modified through the Azure Portal.

You need to create a new ARM template based on the curremnt state of teh RG.

Which PowerShell cmflet should you use?

- Export-AzResourceGroup
- Save-AzResourceGroupDeploymentTemplate
- New-AzResourceGroupDeployment
- Save-AzDeploymentTemplate

---

### Answer:
- Export-AzResourceGroup

This cmdlet capture the deployment state of the RG as it is and produces a 
ARM templatethat replicates the resources as they are presently ion the RG. 

The remaining options do not apply:

`Save-AzResourceGroupDeploymentTemplate`
This saves the RG deployment and not teh current RG.

---

### References:

[Export-AzResourceGroup](https://learn.microsoft.com/en-us/powershell/module/az.resources/export-azresourcegroup?view=azps-11.4.0)  

captures the specified resource group as a template and saves it to a JSON file.This can be useful in scenarios where you have already created some resources in your resource group, and then want to leverage the benefits of using template backed deployments. This cmdlet gives you an easy start by generating the template for your existing resources in the resource group. There might be some cases where this cmdlet fails to generate some parts of the template. Warning messages will inform you of the resources that failed. The template will still be generated for the parts that were successful.

[Save-AzResourceGroupDeploymentTemplate](https://learn.microsoft.com/en-us/powershell/module/az.resources/save-azresourcegroupdeploymenttemplate?view=azps-11.4.0)  
aves a resource group deployment template to a JSON file.

[New-AzResourceGroupDeployment](https://learn.microsoft.com/en-us/powershell/module/az.resources/new-azresourcegroupdeployment?view=azps-11.4.0)  

adds a deployment to an existing resource group. This includes the resources that the deployment requires. An Azure resource is a user-managed Azure entity, such as a database server, database, website, virtual machine, or Storage account.

---

## Q86:

You are preparing a private deployment template that will be saved to an Azure SA.
You must make sure that access to the template is protected by a SAS token.

Complete the command.

```
$templateuri = OPTIONS-1 `
-Container private `
-Blob sas.json `
-Permission r `
-ExpiryTime (Get-Date).AddHours(2.0) `
-FullUri

New-AzResourceGroupDeployment -ResourceGroupName RG1 `
OPTIONS-2 $templateuri

```

OPTIONS-1:
New-AzStorageBlobSASToken
New-AzBlobShareSASToken
New-AzStorageContainerStoredAcessPolicy

OPTIONS-2:
-TemplateUri
-TemplateFile
-TemplateParameterFile


---

### Answer:

```
$templateuri = New-AzStorageBlobSASToken `
-Container private `
-Blob sas.json `
-Permission r `
-ExpiryTime (Get-Date).AddHours(2.0) `
-FullUri

New-AzResourceGroupDeployment -ResourceGroupName RG1 `
-TemplateUri $templateuri

```

---

### References:

[New-AzStorageBlobSASToken](https://learn.microsoft.com/en-us/powershell/module/az.storage/new-azstorageblobsastoken?view=azps-11.4.0)    
generates a Shared Access Signature (SAS) token for an Azure storage blob.



[Create SAS tokens for your storage containers](https://learn.microsoft.com/en-us/azure/ai-services/translator/document-translation/how-to-guides/create-sas-tokens?tabs=Containers)   

---

## Q85:

You plan to deploy 15 identical VMs to Azure.
All the VMs must be based on an existing VM.

Choose the best deployment strategy.

- create a VM in Azure use the CLI to copy that 14 times
- create a VM in Azure use the Powershell to copy that 14 times
- create a ARM template and use Powershell to deploy it to Azure

---

### Answer:
- create a ARM template and use Powershell to deploy it to Azure
obvious answer.


---

### References:

---

## Q84:

You create an ARM template based on an existing VM.
You plan to deply 50 news based on this template.
Each VM should be deplyed with a unique admin password.

You need to modify the ARM template to reference an admin psw.
The psw should not be stored in plain text amd access to it must be secure.

What should you use to store the psw?

- Azure KV and access policy
- Recovery Services vaule and backup policy
- Multiple ARM ciopies and embedded passwords
- premioum files shares and access policy

---

### Answer:
- Azure KV and access policy
obvious answer.

---

### References:

[Tutorial: Integrate Azure Key Vault in your ARM template deployment](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-use-key-vault)   

---

## Q83:

You download  an ARM template created from an existing VM.
You plan to use this template to deploy 50 new VMs.

You need to modify teh template to reference an admin password.
The psw must not be stored in clear text.

What should you do first?

- create and store the psw in the resource template
- create and store the psw in an Axure KV and create an access policy
- create and store the psw in a Recovery Services vault and create a Backup Policy
- create and store the psw in a separate template and create a link from teh source template


---

### Answer:
- create and store the psw in an Axure KV and create an access policy

This is the obvious answer all other cannot apply.


---

### References:

[Recovery Services vaults overview](https://learn.microsoft.com/en-us/azure/backup/backup-azure-recovery-services-vault-overview)  

A Recovery Services vault is a storage entity in Azure that houses data. 

The data is typically:

- copies of data
- configuration information for virtual machines (VMs)
- config info for workloads, servers, or workstations. 
- to hold backup data for various Azure services such as IaaS VMs (Linux or Windows) and SQL Server in Azure VMs

Recovery Services vaults support:

- System Center DPM
- Windows Server
- Azure Backup Server
- and more. 

Recovery Services vaults make it easy to organize your backup data, while minimizing management overhead.

> Key features:

- Enhanced capabilities to help secure backup data: 
With Recovery Services vaults, Azure Backup provides security capabilities to protect cloud backups. The security features ensure you can secure your backups, and safely recover data, even if production and backup servers are compromised. Learn more

- Central monitoring for your hybrid IT environment: 
ith Recovery Services vaults, you can monitor not only your Azure IaaS VMs but also your on-premises assets from a central portal. Learn more

- Azure role-based access control (Azure RBAC): 
Azure RBAC provides fine-grained access management control in Azure. Azure provides various built-in roles, and Azure Backup has three built-in roles to manage recovery points. Recovery Services vaults are compatible with Azure RBAC, which restricts backup and restore access to the defined set of user roles. Learn more

- Soft Delete: 
With soft delete, even if a malicious actor deletes a backup (or backup data is accidentally deleted), the backup data is retained for 14 additional days, allowing the recovery of that backup item with no data loss. The additional 14 days of retention for backup data in the "soft delete" state don't incur any cost to you. Additionally, Azure Backup provides Enhanced soft delete, an improvement to the soft delete feature. With enhanced soft delete, you can customize soft delete retention period and make soft delete always-on, thus protecting it from being disabled by any malicious actors. Learn more about Soft delete and Enhanced soft delete.

- Cross Region Restore: 
Cross Region Restore (CRR) allows you to restore Azure VMs in a secondary region, which is an Azure paired region. By enabling this feature at the vault level, you can restore the replicated data in the secondary region any time, when you choose. This enables you to restore the secondary region data for audit-compliance, and during outage scenarios, without waiting for Azure to declare a disaster (unlike the GRS settings of the vault). Learn more.

- Data isolation: 
With Azure Backup, the vaulted backup data is stored in Microsoft-managed Azure subscription and tenant. External users or guests have no direct access to this backup storage or its contents, which ensures the isolation of backup data from the production environment where the data source resides. This robust approach ensures that even in a compromised environment, existing backups can't be tampered or deleted by unauthorized users.

---

## Q82:

You add a resource group deployment from a ARM template that alredy exists.
The template is stored on a web server repo.
You have already created the RG named RG1.

You need to deply the resources from the RGD.
`$ResourceTamplate` is the location of the of the ARM template file on the web server.

Complete the command.

`OPTIONS-1 -ResourceGroupName "RG1" OPTIONS-2 $ResourceTamplate`

OPTIONS-1:
New-AzResource
New-AzResourceGroup
New-AzResourceGroupDeployment

OPTIONS-2:
-TemplateFile
-TemplateObject
-TemplateUri

---

### Answer:
`New-AzResourceGroupDeployment -ResourceGroupName "RG1" -TemplateUri $ResourceTamplate`

---

### References:

[Deploy resources with ARM templates and Azure PowerShell](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-powershell)   

[New-AzResourceGroupDeployment](https://learn.microsoft.com/en-us/powershell/module/az.resources/new-azresourcegroupdeployment?view=azps-11.4.0&viewFallbackFrom=azps-3.6.1)  


> the meaning of teh param: TemplateObject 
> Example 2: Use a custom template object and parameter file to create a deployment

This command creates a new deployment by using a custom and a template file on disk that has been converted to an in-memory hashtable. 

```
$TemplateFileText = [System.IO.File]::ReadAllText("D:\Azure\Templates\EngineeringSite.json")
$TemplateObject = ConvertFrom-Json $TemplateFileText -AsHashtable

New-AzResourceGroupDeployment -ResourceGroupName "ContosoEngineering" -TemplateObject $TemplateObject -TemplateParameterFile "D:\Azure\Templates\EngSiteParams.json"
```


---

## Q81:

You want to create multiple VMs.
You download an ARM template from the portal.
You need to modify the parameter file shown in the exhibit.
You must ensure it has a reference to teh password.
The psw must be encrypted while it is stored.

<img src="./Q81-exhibit.png">

Complete the parameter file.

```
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "adminLogin": {
      "value": "exampleadmin"
    },
    "adminPassword": {
      "reference": {
        "OPTIONS-1: keyVault | storageAccount": {
          "id": "/subscriptions/<subscription-id>/resourceGroups/<rg-name>/providers/Microsoft.KeyVault/vaults/<vault-name>"
        },
        "OPTIONS-2: secretName | keyName | password ": "ExamplePassword"
      }
    },
  }
}
```

---

### Answer:

```
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "adminLogin": {
      "value": "exampleadmin"
    },
    "adminPassword": {
      "reference": {
        "keyVault": {
          "id": "/subscriptions/<subscription-id>/resourceGroups/<rg-name>/providers/Microsoft.KeyVault/vaults/<vault-name>"
        },
        "secretName": "ExamplePassword"
      }
    }
  }
}
```

---

### References:

[Create Resource Manager parameter file](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/parameter-files)    

[Use Azure Key Vault to pass secure parameter value during deployment](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/key-vault-parameter?tabs=azure-cli)  


In the following parameter file, the key vault secret must already exist, 
and you provide a static value for its resource ID.

> Reference secrets with static ID:

```
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "adminLogin": {
      "value": "exampleadmin"
    },
    "adminPassword": {
      "reference": {
        "keyVault": {
          "id": "/subscriptions/<subscription-id>/resourceGroups/<rg-name>/providers/Microsoft.KeyVault/vaults/<vault-name>"
        },
        "secretName": "ExamplePassword"
      }
    },
    "sqlServerName": {
      "value": "<your-server-name>"
    }
  }
}
```

---

> Reference secrets with dynamic ID:

In some scenarios, you need to reference a key vault secret that varies based on the current deployment. 
Or you may want to pass parameter values to the template rather than create a reference parameter in the parameter file. 
The solution is to dynamically generate the resource ID for a key vault secret 
**by using a linked template**.

In your parent template, you add the nested template and pass in a parameter that contains the dynamically generated resource ID. 

<img src="./Q81-1.png">

```
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
      "location": {
        "type": "string",
        "defaultValue": "[resourceGroup().location]",
        "metadata": {
          "description": "The location where the resources will be deployed."
        }
      },
      "vaultName": {
        "type": "string",
        "metadata": {
          "description": "The name of the keyvault that contains the secret."
        }
      },
      "secretName": {
        "type": "string",
        "metadata": {
          "description": "The name of the secret."
        }
      },
      "vaultResourceGroupName": {
        "type": "string",
        "metadata": {
          "description": "The name of the resource group that contains the keyvault."
        }
      },
      "vaultSubscription": {
        "type": "string",
        "defaultValue": "[subscription().subscriptionId]",
        "metadata": {
          "description": "The name of the subscription that contains the keyvault."
        }
      }
  },
  "resources": [
    {
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2020-10-01",
      "name": "dynamicSecret",
      "properties": {
        "mode": "Incremental",
        "expressionEvaluationOptions": {
          "scope": "inner"
        },
        "template": {
          "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
          "contentVersion": "1.0.0.0",
          "parameters": {
            "adminLogin": {
              "type": "string"
            },
            "adminPassword": {
              "type": "securestring"
            },
            "location": {
              "type": "string"
            }
          },
          "variables": {
            "sqlServerName": "[concat('sql-', uniqueString(resourceGroup().id, 'sql'))]"
          },
          "resources": [
            {
              "type": "Microsoft.Sql/servers",
              "apiVersion": "2021-11-01",
              "name": "[variables('sqlServerName')]",
              "location": "[parameters('location')]",
              "properties": {
                "administratorLogin": "[parameters('adminLogin')]",
                "administratorLoginPassword": "[parameters('adminPassword')]"
              }
            }
          ],
          "outputs": {
            "sqlFQDN": {
              "type": "string",
              "value": "[reference(variables('sqlServerName')).fullyQualifiedDomainName]"
            }
          }
        },
        "parameters": {
          "location": {
            "value": "[parameters('location')]"
          },
          "adminLogin": {
            "value": "ghuser"
          },
          "adminPassword": {
            "reference": {
              "keyVault": {
                "id": "[resourceId(parameters('vaultSubscription'), parameters('vaultResourceGroupName'), 'Microsoft.KeyVault/vaults', parameters('vaultName'))]"
              },
              "secretName": "[parameters('secretName')]"
            }
          }
        }
      }
    }
  ]
}
```


---

## Q80:

You deploy several new VMs to your Azure SUB.
All VM are in teh same RG named RG1.
The VMs are based on a common ARM template stored in GitHub.

You need to automate this operation.

Which two command can you use?

- az deployment group create
- New-AzResourceGroupDeployment
- New-AzVM
- az vm create

---

### Answer:
- az deployment group create
- New-AzResourceGroupDeployment
this is the obvious answer.

The remaining commands deploy a single VM and would not automate the deployment through the ARM template.

---

### References:

[How to create a Linux virtual machine with Azure Resource Manager templates](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/create-ssh-secured-vm-from-template)    

[Quickstart: Create a Linux virtual machine with the Azure CLI on Azure](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-cli)   

[Quickstart: Create a Linux virtual machine in Azure with PowerShell](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-powershell)  

---

## Q79:

You have a RG named `apr-rg` with several resources.

You need to add a SA to this RG.
You decide to use an ARM template to deploy the SA and the cmdlet `AzResourceGroupDeployment`.

The ARM template does not contain any linked or nested templates.

After the successful deployment, you find that all resource but teh new SA 
have been removed from the RG.

What happened?

- the ARMT mode was icremental
- the ARMT mode was complete
- you did not use the -mode param of `AzResourceGroupDeployment`
- you used the -mode complete param of `AzResourceGroupDeployment`
---

### Answer:
- you used the -mode complete param of `AzResourceGroupDeployment`

This is the obvious answer. 
The modes complte vs. incremental have already been discussed in details in a 
previous question. 

The following do not apply:
- the ARMT mode was icremental
- the ARMT mode was complete

because the ARM template does not contain any linked or nested templates and therefore the 
mode parameter should not be present in the template.


---

### References:

[Microsoft.Resources deployments](https://learn.microsoft.com/en-us/azure/templates/microsoft.resources/deployments?pivots=deployment-language-arm-template#resource-format-1)  

The deployments resource type can be deployed to:

Resource groups - See resource group deployment commands
Subscriptions - See subscription deployment commands
Management groups - See management group deployment commands
Tenants - See tenant deployment commands

```
{
  "type": "Microsoft.Resources/deployments",
  "apiVersion": "2022-09-01",
  "name": "string",
  "location": "string",
  "tags": {
    "tagName1": "tagValue1",
    "tagName2": "tagValue2"
  },
  "scope": "string",
  "properties": {
    "debugSetting": {
      "detailLevel": "string"
    },
    "expressionEvaluationOptions": {
      "scope": "string"
    },
    "mode": "string",
    "onErrorDeployment": {
      "deploymentName": "string",
      "type": "string"
    },
    "parameters": {},
    "parametersLink": {
      "contentVersion": "string",
      "uri": "string"
    },
    "template": {},
    "templateLink": {
      "contentVersion": "string",
      "id": "string",
      "queryString": "string",
      "relativePath": "string",
      "uri": "string"
    }
  },
  "resourceGroup": "string",
  "subscriptionId": "string"
}
```


- mode : 'Complete' / 'Incremental'  (required)
The mode that is used to deploy resources. This value can be either Incremental or Complete. In Incremental mode, resources are deployed without deleting existing resources that are not included in the template. In Complete mode, resources are deployed and existing resources in the resource group that are not included in the template are deleted. Be careful when using Complete mode as you may unintentionally delete resources.	


---

## Q78:

You have a ARM template to create a Windows VM.
The ARM template has been obtained from an existing RG with a single VM using the 
automation script option.

You want to reause this template for other deployments.
You need all the resources in the RG to be in the same location.

What should you do?

- use New-AzResourceGroup with -Location to create the RG in the desirged location. Then use AzResourceGroupDeployment with the new RG.

- use The Azure Portal to create the RG in the desired Location. Then use AzResourceGroupDeployment with the new RG.

- edit the template file and update the location param with the value `[resourceGroup().location]`

- edit the parameters file and ass a new parameter named `location` of type string with the default value `[resourceGroup().location]`

---

### Answer:

- edit the template file and update the location param with the value `[resourceGroup().location]`

The following suggested solution could also:
- edit the parameters file and ass a new parameter named `location` of type string with the default value `[resourceGroup().location]`
Howwever, you would also need to update the ARM template with the new `[parameters('location')]` where required.

The remaining options are obviously not suitable to this case.

---

### References:

---

## Q77:

Your company has a LOB app that uses several Azure resources.
These resources are all in the same RG.
After the first deplyment more resources for are added to the same RG via the deployments.

You need to create a template to redeploy the resources required by teh LOB app.

What should you do?

- use Get-AzResourceGroupDeployment
- use Get-AzResourceGroupDeploymentOperation
- use Export-AzResourceGroup
- use Save-Get-AzResourceGroupDeploymentTemplate


---

### Answer:
- use Export-AzResourceGroup

---

### References:

[Export-AzResourceGroup](https://learn.microsoft.com/en-us/powershell/module/az.resources/export-azresourcegroup?view=azps-11.4.0&viewFallbackFrom=azps-2.6.0)    

Captures a resource group as a template and saves it to a file.
This can be useful in scenarios where you have already created some resources in your resource group, and then want to leverage the benefits of using template backed deployments. 

 There might be some cases where this cmdlet fails to generate some parts of the template. Warning messages will inform you of the resources that failed. 
 The template will still be generated for the parts that were successful.

---

[Get-AzResourceGroupDeployment](https://learn.microsoft.com/en-us/powershell/module/az.resources/get-azresourcegroupdeployment?view=azps-11.4.0&viewFallbackFrom=azps-2.6.0)    
gets the deployments in an Azure resource group. 


[Get-AzResourceGroupDeploymentOperation](https://learn.microsoft.com/en-us/powershell/module/az.resources/get-azresourcegroupdeploymentoperation?view=azps-11.4.0&viewFallbackFrom=azps-2.6.0)  
lists all the operations that were part of a deployment to help you identify and give more information about the exact operations that failed for a particular deployment. 

It can also show the response and the request content for each deployment operation. 
This is the same information provided in the deployment details on the portal. 
It can potentially log and expose secrets like passwords used in the resource property or listKeys operations that are then returned when you retrieve the deployment operations. 

---

[Manage Azure resources by using Azure PowerShell](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resources-powershell)  


---

## Q76:

company1 has varous workloads runnign on Azure.
In order to acces apps hosted on Azure all users of company1 autheticate to the
`company1.com` tenant with Microsoft Entra. 
**Microsoft Entra Connect Sync** is used with the on-porm AD.

company2 own the Azure tenant `company2.com`.

company2 signs an agreement with company1.
Five users from company2 need access to a number of apps hosted on `company1.com`.
company2 users should laso be able to use SSO to access `company1.com` resources
useing their `company2.com` credentials.

You need to implement a solution quickly and at no costs.

What should you do?

- enable B2C authetication to allow the five uses from company2 to use their outlook.com email addresses to access the app on  `company1.com`

- add five company2 users principal namens UPNs as guest users on the `company1.com` tenant

- configure ADFS at company1 to federate thet five company2 users to a utheticate with the company2 AD

- create user accounts for the five users from company2 in the company1 on-prem AD



---

### Answer:
- add five company2 users principal namens UPNs as guest users on the `company1.com` tenant

adding these 5 UPN to `company1.com` as guest and sending them an invitation provides them 
with SSO and it is the easiest solution.

The remaining options do not apply:

- enable B2C authetication to allow the five uses from company2 to use their outlook.com email addresses to access the app on `company1.com`
This is not a goood solution because if any of these users left company2 theyy would still be able to access `company1.com`. They are not customers by themself the agreement is between
the companies and you want that if any of this fives are removed from `company2.com`
then their identities become invalid also in `company1.com`.

- configure ADFS at company1 to federate thet five company2 users to a utheticate with the company2 AD
This is possible but fairly complex and expensive.

- create user accounts for the five users from company2 in the company1 on-prem AD
This would work also but it brakes the requirement that the five users need to use
SSO therefore they want to be able to autheticate to `company1.com` with the same
credentials used on `company2.com`.

---

### References:

[B2B collaboration overview](https://learn.microsoft.com/en-us/entra/external-id/what-is-b2b)  
B2B collaboration is a feature within Microsoft Entra External ID that lets you invite guest users to collaborate with your organization. 
With B2B collaboration, you can securely share your company's applications and services with external users.
You maintain control over your own corporate data.
Work safely and securely with external partners, large or small, even if they don't have Microsoft Entra ID or an IT department.

> Invitation & Redemption process:
A simple invitation and redemption process lets partners use their own credentials to access your company's resources.
**You can also enable self-service sign-up user flows** to let external users sign up for apps or resources themselves.
Once the external user has redeemed their invitation or completed sign-up, they're represented in your directory as a user object.

The user type for these B2B collaboration users is typically set to "guest" and their user principal name contains the `#EXT#` identifier.

> Collaborate with any partner using their identities:

With Microsoft Entra B2B, the partner uses their own identity management solution, 
so **there's no external administrative overhead for your organization**. 
**Guest users sign in to your apps and services with their own work, school, or social identities**.

- The partner uses their own identities and credentials, **whether or not they have a Microsoft Entra account**
- You don't need to manage external accounts or passwords.
- You don't need to sync accounts or manage account lifecycles.

> Manage B2B collaboration with other organizations and clouds:

- B2B collaboration is enabled by default
- comprehensive admin settings let you control your inbound and outbound B2B collaboration with external partners and organizations

---

[Microsoft Entra Connect Sync: Understand and customize synchronization](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sync-whatis)   

---

## Q75:

You deploy a LOB app and all the resources for the app are deployed to a single RG.
The resources where added in different phases.

You need to export teh current configuration of the LOB app resources to an ARM template.
The ARM template will be used to teh deploy the LOB app infrastructure in a different
testing enviroment.

The ARM template uses the `complete` deployment mode.

Select Ye/No for each statement.

- you need to export the ARM template from the latest deployment
- each deployment contains only the resources that have been added in that deployment
- that parameters file contains teh values used during that deployment
- the template contains thet scripts needed to deply the template


---

### Answer:


- you need to export the ARM template from the latest deployment
No
The latest deployment contains only the resources that have been deplyed within the latest 
deployment. In order to get the ARM template to deploy all the resources you must export 
the ARM template from the RG.

- each deployment contains only the resources that have been added in that deployment
Yes

- that parameters file contains teh values used during that deployment
Yes

- the template contains thet scripts needed to deply the template
No

---

### References:

[Use Azure portal to export a template](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/export-template-portal)   

[Understand the structure and syntax of ARM templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/syntax)  

[Azure Resource Manager deployment modes](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deployment-modes)  

When deploying your resources, you specify that the deployment is either 

- incremental update 
- complete update

**For both modes**, Resource Manager tries to create all resources specified in the template. **If the resource already exists** in the resource group and 
**its settings are unchanged, no operation is taken for that resource**.

**If you change the property values for a resource, the resource is updated with those new values.**

**If you try to update the location or type of an existing resource, the deployment fails with an error.** 
 Instead, deploy a new resource with the location or type that you need.

> Complete mode
In complete mode, Resource Manager deletes resources that exist in the resource group but aren't specified in the template.  

> Incremental mode
In incremental mode, Resource Manager leaves unchanged resources that exist in the resource group but aren't specified in the template. Resources in the template are added to the resource group.

[Manage Azure resources by using Azure CLI](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resources-cli)    

---

## Q74:

Your organization uses Azure Blobs for storing data.
You enabke blob versioning for the SA.
You need to determine which write operations create a new version.

Which 4 write ops create a new version?

- Put Page
- Put Blob
- Put Block List
- Put Block From URL
- Append Block
- Set Blob Metadata
- Copy Blob

---

### Answer:

- Put Blob
- Put Block List
- Copy Blob
- Set Blob Metadata

- Put Blob
this creates a new block, page or append blob or it updates the content of
an existing block blob. Any metadata on the blob will be overwritten.

- Put Block List
writes a blob by soecifying the list of bloch IDs that make up the blob.
It allows to update a blob by uploading only those blocks that have changed
and then committing the new blocks and the old one together as a new version.

- Copy Blob
this copies a whole blob to a target SA

- Set Blob Metadata
metadata as a list of name-value pairs can be attached to a blob and it is 
part of a version of the blob

These ops do not create a new version of teh blob:
- Put Page
- Put Block From URL
- Append Block

---

### References:


---

## Q73:

You are the Azure admin at your company that uses AFS to store files.
You need to permanently delete an AFS that has been soft deleted.

```
Update-AzStorageFileServiceProperty `
-ResourceGroupName $rg
-StorageAccountName $sa
-EnableShareDeleteRetentionPolicy $false
```

Which statement is correct reagrding this command?

- the PS command undeletes the file share
- the PS command only disables soft delete on the SA
- the PS command does not disable soft delete on the SA
- the PS command disables soft delete on teh SA and permanently deletes an AFS that has been soft deleted

---

### Answer:
- the PS command only disables soft delete on the SA
The clue is the following: `-EnableShareDeleteRetentionPolicy $false`

---

### References:

[az storage account file-service-properties](https://learn.microsoft.com/en-us/cli/azure/storage/account/file-service-properties?view=azure-cli-latest)  

```
az storage account file-service-properties update --account-name
                                                  [--add]
                                                  [--auth-methods]
                                                  [--channel-encryption]
                                                  [--delete-retention-days]
                                                  [--enable-delete-retention {false, true}]
                                                  [--enable-smb-multichannel {false, true}]
                                                  [--force-string]
                                                  [--kerb-ticket-encryption]
                                                  [--remove]
                                                  [--resource-group]
                                                  [--set]
                                                  [--versions]
```


[Enable soft delete on Azure file shares](https://learn.microsoft.com/en-us/azure/storage/files/storage-files-enable-soft-delete?tabs=azure-portal)   

```
$resourceGroupName = "<resource-group>"
$storageAccountName = "<storage-account>"

Update-AzStorageFileServiceProperty `
    -ResourceGroupName $resourceGroupName `
    -StorageAccountName $storageAccountName `
    -EnableShareDeleteRetentionPolicy $true `
    -ShareRetentionDays 7

# You can use the following command to disable soft delete on your storage account.
Update-AzStorageFileServiceProperty `
    -ResourceGroupName $resourceGroupName `
    -StorageAccountName $storageAccountName `
    -EnableShareDeleteRetentionPolicy $false
```

---

## Q72:

You work for a company that uses on-prem Windows servers for file sharing.
You plan to migrate to Azure File Share and map the AFS to on-prem servers.

The following is the current on-prem situation:


| Server Name | OS WS:Windows Server | OPTION |
| ----------- | -------------------- | ------ |
| server1     | WS2022  | ? |
| server2     | WS2022  | ? |
| server3     | WS2016  | ? |
| server4     | WS2019  | ? |
| server5     | WS2012 R2  | ? |

Choose the correct option for each server:

OPTIONS:
1. support file mapping
2. requires upgrading

---

### Answer:

| Server Name | OS WS:Windows Server | OPTION |
| ----------- | -------------------- | ------ |
| server1     | WS2022  | 1 |
| server2     | WS2022  | 1 |
| server3     | WS2016  | 2 |
| server4     | WS2019  | 1 |
| server5     | WS2012 R2  | 2 |

Windows Server >= 2019 support file mapping while earlier versions require upgrading
in order to be able to mount a Azure File Share.

---

### References:

[Planning for an Azure Files deployment](https://learn.microsoft.com/en-us/azure/storage/files/storage-files-planning)   

You can deploy Azure Files in two main ways: 
1. by directly mounting the serverless Azure file shares 
2. or by caching Azure file shares on-premises using Azure File Sync.

> Direct mount of an Azure file share: 
Because Azure Files provides either Server Message Block (SMB) or Network File System (NFS) access, you can mount Azure file shares on-premises or in the cloud using the standard SMB or NFS clients available in your OS. Because Azure file shares are serverless, deploying for production scenarios doesn't require managing a file server or NAS device. This means you don't have to apply software patches or swap out physical disks.

> Available protocols

Azure Files offers two industry-standard file system protocols for mounting Azure file shares: 

1. the Server Message Block (SMB) protocol (SMBv3)
2. and the Network File System (NFS) protocol

allowing you to choose the protocol that is the best fit for your workload.


---

[What is Azure File Sync?](https://learn.microsoft.com/en-us/azure/storage/file-sync/file-sync-introduction)  

Azure File Sync enables you to centralize your organization's file shares in Azure Files, while keeping the flexibility, performance, and compatibility of a Windows file server.

While some users might opt to keep a full copy of their data locally, Azure File Sync additionally has the ability to transform Windows Server into a quick cache of your Azure file share

 You can use any protocol that's available on Windows Server to access your data locally, including SMB, NFS, and FTPS. You can have as many caches as you need across the world.

---

## Q71:

You work for a company with an Azure subscription.
The company wants to start using Azure Premium File Shares to replace on-premise file servers.

You currently have three Azure SAs as shown below.

| SA        | SA Type | 
| --------- | ------- | 
| storage1  | GPv2    | 
| storage2  | GPv1    | 
| storage3  | GPv2    | 


Currently, none of teh existing SAa allows you to provision a premium file share,
but your manager has asked you to provision one in the most cost-effective way possible.

Select Yes/No.

- you should convert storage1 & storage3 to Premium SAa
- you should convert storage2 to Premium SAa
- you should create a new premium SA

---

### Answer:

- you should convert storage1 & storage3 to Premium SAa
No
- you should convert storage2 to Premium SAa

No
- you should create a new premium SA:
Yes


In order to provision a Premium Azure File Sahre you must have a Premium SA.
It is not possible to convert GPv1/2 SAs to Premium.
---

### References:

[Upgrade to a general-purpose v2 storage account](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-upgrade?tabs=azure-portal)    

Upgrading to a general-purpose v2 storage account from your general-purpose v1 or Blob storage accounts is straightforward. 
There's no downtime or risk of data loss associated with upgrading to a general-purpose v2 storage account. 

---

## Q70:

You work for an organization that uses **Azure Virtual Desktop (AVD)**  to facilitate remote working.

Your users have only local profiles, but you need to implement `FSLogix` to allow them to
have netwoek profiles.

You create an Azure File Share that stores user profiles and you configure the relevant
file path onto each Windows 10 session host in teh AVD pool.

During testing of this solution you find that users log in via `FSLogix` temporary 
profile instead of a network profile. However, admins can successfully mount the file
share on the same session host.

What is the source of this problem?

- Azure File Share netwrork settings are too restrictive
- users do not have teh permission to access the Azure File Share
- teh session host firewall blocks the user profiles from loading
- local profiles already exist for the users

---

### Answer:
- users do not have teh permission to access the Azure File Share

Users taht log into the session host need R/W permissions to teh Azure File Share.
This is to allow a profile to be created and updated very time they log off.
If a user does nto have the R/W permission thne theyr are logged in with a local profile
on the Windows 10 session host and this does not save any changes made on the session.

This is also why teh admin can instead log on the session hist via the File Share.
It also proves that it is not teh firewall tha blocks the communication to teh Azure File Share
and the loading of teh profiles.

- local profiles already exist for the users
this cannot be teh case as the users have logged on for the first time and therefore there
could not be already profiles for them on the Windows host.

---

### References:

[Troubleshooting issues with old, temporary, or local profiles](https://learn.microsoft.com/en-us/fslogix/troubleshooting-old-temp-local-profiles)  

[Troubleshooting FSLogix Temporary Profile Creation](https://www.parallels.com/blogs/ras/fslogix-temporary-profile/)   


---

## Q69:

Your organization wants to start using Azure Blob Storage and specifically the cool tier
in order to migrate archived data.

You need to complete a draft script:

Resource Group Name : RG1
Storage Account Name: sa1

You also need to create a contaniner named `contaniner1`.
You must complete the script and test it by uploading a file named `file1.xtx` to the cool tier.

```
$rg = "rg1"
$san = "sa1"
$cn = "container1"

$ctx = OPTIONS -StorageAccountName $sa -UseConnectedAccount
OPTIONS -Name $cn -Context $ctx
OPTIONS -Container $cn `
-File "file1.xtx" `
-Blob "file1.xtx" `
-Context $ctx `
-StandardBlobTier cool
```

OPTIONS:
Get-AzStorageAccount
New-AzStorageContext
New-AzStorageContainer
Set-AzStorageBlobContent

---

### Answer:

```
$rg = "rg1"
$san = "sa1"
$cn = "container1"

$ctx = New-AzStorageContext -StorageAccountName $sa -UseConnectedAccount
New-AzStorageContainer -Name $cn -Context $ctx
Set-AzStorageBlobContent -Container $cn `
-File "file1.xtx" `
-Blob "file1.xtx" `
-Context $ctx `
-StandardBlobTier cool
```

---

### References:

[New-AzStorageContext](https://learn.microsoft.com/en-us/powershell/module/az.storage/new-azstoragecontext?view=azps-11.4.0&viewFallbackFrom=azps-8.2.0)  

```
# Example 1: Create a context by specifying a storage account name and key
New-AzStorageContext -StorageAccountName "ContosoGeneral" -StorageAccountKey "< Storage Key for ContosoGeneral ends with == >"

# Example 2: Create a context by specifying a connection string
New-AzStorageContext -ConnectionString "DefaultEndpointsProtocol=https;AccountName=ContosoGeneral;AccountKey=< Storage Key for ContosoGeneral ends with == >;"

# Example 3: Create a context for an anonymous storage account
New-AzStorageContext -StorageAccountName "ContosoGeneral" -Anonymous -Protocol "http"

# Example 6: Get multiple containers# 
$Context01 = New-AzStorageContext -Local 
$Context02 = New-AzStorageContext -StorageAccountName "ContosoGeneral" -StorageAccountKey "< Storage Key for ContosoGeneral ends with == >"
($Context01, $Context02) | Get-AzStorageContainer

# Example 9: Create a context by using an SAS token
$SasToken = New-AzStorageContainerSASToken -Name "ContosoMain" -Permission "rad"
$Context = New-AzStorageContext -StorageAccountName "ContosoGeneral" -SasToken $SasToken
$Context | Get-AzStorageBlob -Container "ContosoMain"


# Example 10: Create a context by using the OAuth Authentication
Connect-AzAccount
$Context = New-AzStorageContext -StorageAccountName "myaccountname" -UseConnectedAccount

...
...

```

---

## Q68:

You work at a company that hosts resource in Azure including a File Share.
You are aseked to create a new VNet and a Azure File Share to be connected 
to a new Windows Server 2019 VM  that must also be provisioned by you.

You successfully provisioned:

- the VNet
- the Windows Server 2019 VM
- the File Share

However, when you try to add the Azure File Share to the Windows Server you 
get the error:

`System Error 67 has occured`

You need to fix this error on the Winodws Server.

What should you do?

- unblock TCP 445
- check that permission is configure correctly
- unblock port 2049
- enable New Technology LAN Manager version 1 (NTLMv1)

---

### Answer:
- unblock TCP 445

The error: `System Error 67 has occured`
is returned on Windows Server when TCP 445 is blocked.
This prevents the Windows Server to communicate over SMB v3.0 to the Azure File Share.

This was discussed wellin previous questions.

The other options are not relevant in this case:

`NTLMv1` should be already disabled on WS2019 if you enabled you would get the error:
`System Error 53 has occured`
when tryong to mount the SAzur File share.
Azure file share only support `NTLMv2`

**TCP 2049** is used on Windows Server for **Network File Share (NFS)** protocol and not SMB.

---

### References:

[Troubleshoot Azure Files](https://learn.microsoft.com/en-us/troubleshoot/azure/azure-storage/files/files-troubleshoot?tabs=powershell)     

[Create an SMB Azure file share](https://learn.microsoft.com/en-us/azure/storage/files/storage-how-to-create-file-share?tabs=azure-portal)   

---

## Q67:

Your company has on-prem infrastructure and plans to move to IaaS in Azure.
You plan to migrate the erachice data to Azure Blob Storage and you have used
Azure Storage Explorer to complete an initial bulk upload.

You need to creat a lifecycle management policy using Powershell to move data
that has not been modified for teh last 30 days to teh hot tier to the cool tier.

Complete the Powershell script.

```
$rg = "RG1"
$san = "storage1"

$action = OPTIONS `
-BaseBlobAction TierToCool -daysAfterModificationGreaterThan 30

$filter = OPTIONS -PrefixMatch ef,gh -BlobType blockBlob

$rule = OPTIONS -name test-rule -Action $action -Filter $filter 

OPTIONS -StorageAccountName $san -Rule $rule
```

OPTIONS:
New-AzStorageAccountManagementPolicyFilter
New-AzStorageAccountManagementPolicyRule
New-AzStorageAccountManagementPolicyAction
Add-AzStorageAccountManagementPolicyAction
New-AzStorageAccountManagementPolicy
Set-AzStorageAccountManagementPolicy
New-AzStorageAccountKey
New-AzStorageBlobInventoryPolicy
Set-AzStorageBlobContent

---

### Answer:

```
$rg = "RG1"
$san = "storage1"

$action = Add-AzStorageAccountManagementPolicyAction `
-BaseBlobAction TierToCool -daysAfterModificationGreaterThan 30

$filter = New-AzStorageAccountManagementPolicyFilter -PrefixMatch ef,gh -BlobType blockBlob

$rule = New-AzStorageAccountManagementPolicyRule -name test-rule -Action $action -Filter $filter 

Set-AzStorageAccountManagementPolicy -StorageAccountName $san -Rule $rule
```

`Add-AzStorageAccountManagementPolicyAction`
`New-AzStorageAccountManagementPolicyFilter`
`New-AzStorageAccountManagementPolicyRule`
`Set-AzStorageAccountManagementPolicy`

create a policy action
create a filter for the policy action
create a lifecycle rule for that action and with that filter
set this policy action on the storage account

---

### References:


[Configure a lifecycle management policy](https://learn.microsoft.com/en-us/azure/storage/blobs/lifecycle-management-policy-configure?tabs=azure-portal)   


---

## Q66:

Your company hosts resources in Azure, including data in Azure Blob Storage.
In the hot tier there is 20 TB of data.
This data is rarely accessed and teh Finance Director has expressed concern about its 
monthly cost.

You must move the data that has not been modified over the previous month to the 
archive tier.
Minimize admin effort.

What should you do?

- create and schedule an automated AzCopy script
- use Azure Data Box
- use a lifecycle management policy 
- manually move data once a month


---

### Answer:
- use a lifecycle management policy 

This is the obvouos answer to this question.


---

### References:

[Configure a lifecycle management policy](https://learn.microsoft.com/en-us/azure/storage/blobs/lifecycle-management-policy-configure?tabs=azure-portal)   

---

## Q65:

Your company implements block blod storage in a GPv2 SA.
It is seldome necessary to access the data after initial input, 
but it is occasionally required.
Storage costs should be kept to a minimum.

You propose the following rule to move the data directly to the archive immediately after 
being written to teh storage:

```
{
  "rules": [
    {
      "enabled": true,
      "name": "archive-rule",
      "type": "Lifecycle",
      "definition": {
        "actions": {          
          "baseBlob": {            
            "tierToArchive": {
              "daysAfterModificationGreaterThan": 0,               
            },            
          }
        },
        "filters": {
          "blobTypes": ["blockBlob"],
          "prefixMatch": ["archivecontainer"]
        }
      }
    }
  ]
}
```

The IT manager wants to know how long it will take to make archive data available
for access should the case be.

- up to 24 h
- up to 15 h
- up to 15 days
- immediately

---

### Answer:
- up to 15 h

This detail was mentioned in one of teh previous answer to a question that 
had archiving to a SA as its theme.

[Blob rehydration from the archive tier](https://learn.microsoft.com/en-us/azure/storage/blobs/archive-rehydrate-overview?tabs=azure-portal)    

---

### References:


---

## Q64:

Your company implements block blod storage in a GPv2 SA.
It also emply the follwoing **rule** to optimize costs.

```
{
  "rules": [
    {
      "enabled": true,
      "name": "sample-rule",
      "type": "Lifecycle",
      "definition": {
        "actions": {
          "version": {
            "delete": {
              "daysAfterCreationGreaterThan": 90
            }
          },
          "baseBlob": {
            "tierToCool": {
              "daysAfterModificationGreaterThan": 30
            },
            "tierToArchive": {
              "daysAfterModificationGreaterThan": 90,
              //"daysAfterLastTierChangeGreaterThan": 7
            },
            "delete": {
              "daysAfterModificationGreaterThan": 356
              //"daysAfterModificationGreaterThan": 2555
            }
          }
        },
        "filters": {
          "blobTypes": [
            "blockBlob"
          ],
          "prefixMatch": [
            "sample-container2/myblob"
            //"sample-container/blob1"
          ]
        }
      }
    }
  ]
}
```

For each statement choose Yes/No.

- previous blob version are deleted after 90 days afer creation

- rehydrating a blob from archive with Copy Blob operation resets that day after modification counter to zero

- you should transition blobs from cool to hot tier to optimize performance


---

### Answer:


- previous blob version are deleted after 90 days afer creation
Yes
```
"actions": {
          "version": {
            "delete": {
              "daysAfterCreationGreaterThan": 90
            }
          },
```

- rehydrating a blob from archive with Copy Blob operation resets that day after modification counter to zero
No: the Copy Blob operation creates a separate copy of teh blob and does not reset the 
mofification counter on the original blob.

- you should transition blobs from cool to hot tier to optimize performance
yes: this ALSO reset the day after modification counter to zero if any changes are made to teh blob contents.


---

### References:

[Configure a lifecycle management policy](https://learn.microsoft.com/en-us/azure/storage/blobs/lifecycle-management-policy-configure?tabs=azure-portal)  

[Optimize costs by automatically managing the data lifecycle](https://learn.microsoft.com/en-us/azure/storage/blobs/lifecycle-management-overview)   

---

## Q63:

You create a FileStorage Premium Account and a Premium tier Azure Fiel Share.
You plan to mount the file share directly on-prem using `SMB 3.0` protocol.

You must ensure that teh network is configured to support mounting an Azure File Share
on-prem.
Minimize the admin effort.

What should you do?

- create an Express Route circuit
- install and configure Azure File Sync
- configure TCP 443 as open in the on-prem firewall
- configure TCP 445 as open in the on-prem firewall
---

### Answer:
- configure TCP 445 as open in the on-prem firewall

This was discussed in one of the precious questions.
`SMB 3.0` protocol use TCP 445 and this port must be available therefore it must not 
be block either from the ISP nor from the company firewall in order to be able to mount 
a Azure File Sahre within the on-prem perimeter.

The other options are not relevant.

---

### References:


---

## Q62:

Your organization has 2 TB of data in on-premise storage that they want to move
to a SA on Azure.

You must identify the solution that best meets the following requirements:

- data will need to be stored for many years
- data will be rarely accessed
- data should be available for immediate access when the need arises
- minimize the cost of data storage 

Which SA Access tier should you recommend?

- hot
- cool
- archive
---

### Answer:
- cool

The **archive tier** has lower costs than the cool tier. However, with the archive tier
it may take **up to 15 hours to make the data availabkle should the need be**.

---

### References:

[Blob rehydration from the archive tier](https://learn.microsoft.com/en-us/azure/storage/blobs/archive-rehydrate-overview?tabs=azure-portal)  

While a blob is in the archive access tier, 
**it's considered to be offline, and can't be read or modified**. 
In order to read or modify data in an archived blob, you must first rehydrate the blob to an online tier, either the hot or cool tier. 

There are two options for rehydrating a blob that is stored in the archive tier:

1. Copy an archived blob to an online tier: 
You can rehydrate an archived blob by copying it to a new blob in the hot or cool tier with the Copy Blob operation. 
Microsoft recommends this option for most scenarios.

2. Change an archived blob's access tier to an online tier: 
You can rehydrate an archived blob to the hot or cool tier by changing its tier using the Set Blob Tier operation.

Microsoft recommends archiving larger blobs for optimal performance when rehydrating.
Rehydrating a large number of small blobs may require extra time due to the processing overhead on each blob. 
A maximum of 10 GiB per storage account may be rehydrated per hour with priority retrieval.

---

## Q61:

You need to create an Azure File Share in your company Azure subscription.
This share contains resource files that the admin of your Azure IaaS-hosted
Microsoft Windows servers need to perform their daily activities.
The share will be in an existing SA.

You must ensure that the file share is mounted on the servers and persisted
accross reboots.

Select 6 actions in the right order.

- execute CMDKEY on the Windows servers
- execute `Set-AzStorageAccount`
- execute `Get-AzStorageAccount`
- execute `Get-AzStorageAccountKeys`
- execute `New-AzStorageAccount`
- execute `New-AzStorageContext`
- execute `New-AzStorageShare`
- execute `New-PSDrive` on the Windows servers
- execute `Get-PSDrive` on the Windows servers

---

### Answer:

- execute `New-AzStorageAccount`
- execute `Get-AzStorageAccountKeys`
- execute `New-AzStorageContext`
- execute `New-AzStorageShare`
- execute CMDKEY on the Windows servers
- execute `New-PSDrive` on the Windows servers

The first 4 commands create the File Share on the SA.
After the FS is available on Azure any VM on Azure can access provided it holds the
access key and its path.

- execute CMDKEY on the Windows servers
allows to permanently store the credentials and map

---

[New-PSDrive](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-psdrive?view=powershell-7.4)   
Creates temporary and persistent drives that are associated with a location in an item data store.
reates temporary and persistent drives that are mapped to or associated with a location in a data store, such as:

- a network drive
- a directory on the local computer
- a registry key
- persistent Windows mapped network drives that are associated with a file system location on a remote computer.

```
# Example 1: Create a temporary drive mapped to a network share
New-PSDrive -Name "Public" -PSProvider "FileSystem" -Root "\\Server01\Public"

...other examples are available ...

```

---

### References:

[Mount SMB Azure file share on Window](https://learn.microsoft.com/en-us/azure/storage/files/storage-how-to-use-files-windows)  

Azure file shares can be seamlessly used in Windows and Windows Server.

**In order to use an Azure file share via the public endpoint outside of the Azure region** 
it's hosted in, such as on-premises or in a different Azure region, 
the **OS must support SMB 3.x**. 

Older versions of Windows that support only SMB 2.1 can't mount Azure file 
shares via the public endpoint.

> Prerequisites:
**Ensure port 445 is open**: : The SMB protocol requires TCP port 445 to be open.
check if your firewall or ISP is blocking port 445 by using the `Test-NetConnection` cmdlet.

> Using an Azure file share with Windows:

either: 
- mount it which means assigning it a drive letter or mount point path
- or access it via its UNC path.

> Access:

1. **use the storage account key to access the file share**
2. [Azure File Sync](https://learn.microsoft.com/en-us/azure/storage/file-sync/file-sync-planning)  

**Shared access signature (SAS) tokens aren't currently supported for mounting Azure file shares**.

A common pattern for lifting and shifting line-of-business (LOB) applications that expect an SMB file share to Azure is to use an Azure file share as an alternative for running a dedicated Windows file server in an Azure VM. One important consideration for successfully migrating an LOB application to use an Azure file share is that many applications run under the context of a dedicated service account with limited system permissions rather than the VM's administrative account. Therefore, you must ensure that you mount/save the credentials for the Azure file share from the context of the service account rather than your administrative account.

> Mount the Azure file share from the Azure Portal:

The Azure portal provides a PowerShell script that you can use to mount your file share 
directly to a host **using the storage account key**. 
Unless you're mounting the file share using identity-based authentication, 
we recommend using this provided script.

> Mount the Azure file share with File Explorer:

3. Select the drive letter and enter the UNC path to your Azure file share.
e UNC path format is :
`\\<storageAccountName>.file.core.windows.net\<fileShareName>`

4. Authenticate:
Select More choices > Use a different account. 
- Under Email address use the storage account name
- and use a storage account key as the password. 

> Access an Azure file share via its UNC path:

You don't need to mount the Azure file share to a drive letter to use it. 
You can directly access your Azure file share using the UNC path by entering 
the following into File Explorer. 
**You'll be asked to sign in with your network credentials**.
**Sign in with the Azure subscription under which you've created the storage account and file share.**

`\\storageaccountname.file.core.windows.net\myfileshare`

you can add the credentials using the following command:

```
cmdkey /add:StorageAccountName.file.core.windows.net /user:localhost\StorageAccountName /pass:StorageAccountKey
```

---

[Azure File Sync](https://learn.microsoft.com/en-us/azure/storage/file-sync/file-sync-planning)  

This is an alternative to using Azure File Shares directly by mounting them to the machine where these shares must be accessed, its main goal is centralization and caching of several Azure File Shares.

In this way it may be easier to manage in that there is only a central share that work as a
chache of several Azure File Shares and therefore its easier to maintain and manage.

Azure File Sync is a service that allows you to cache several Azure file shares on an on-premises Windows Server or cloud VM.

Azure File Sync enables you to centralize your organization's file shares in Azure Files, while keeping the flexibility, performance, and compatibility of an on-premises file server. Azure File Sync transforms an on-premises (or cloud) Windows Server into a quick cache of your Azure file share.

---

[Get-PSDrive](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-psdrive?view=powershell-7.4)  

The Get-PSDrive cmdlet gets the drives in the current session. 
You can get a particular drive or all drives in the session.

This cmdlet gets the following types of drives:

- Windows logical drives on the computer including drives mapped to network shares.

- Drives exposed by PowerShell providers 
(such as the Certificate:, Function:, and Alias: drives) and the HKLM: and HKCU: drives that are exposed by the Windows PowerShell Registry provider.

- Session-specified temporary drives and persistent mapped network drives
that you create by using the New-PSDrive cmdlet.


---

## Q60:

You have joined  a pharmaceutical organization as an Azure admin.
the organization has a large number of SAs.

You must perform the following tasks:

1. an audit of the existing SAs
2. disable the cration of new SA that allows cross-tenant object replication
3. disable the cross-tenant object replication on all existing SAs
4. validate the implementation as per the org's corporate standards and SLA

You review the following Policy Definition:

```
{
  "properties": {
    "displayName": "...",
    "policyType": "BuiltIn",
    "mode": "All | Indexed | Supported",
    "parameters": {
      "tagName": {
        "type": "String",        
      },
      "tagValue": {
        "type": "String",        
      }
    },
    "policyRule": {
      "if": {
          "allOf": {
            "field": "type",        
            "equals": "Microsoft.Storage/storageAccounts"
          },
          {
            "not": {
            "field": "Microsoft.Storage/storageAccounts/allowCrossTenantReplication",        
            "equals": "false"
          },
        }
      },
      "then": {
        "effect": "deny"
        //"effect": "append | audit | deny"
        
      }
    }
  },  
  "type": "Microsoft.Authorization/policyDefinitions",
  "name": "policyDefinition01"
}
```

For each of the following statements select Yes/No:

- the policy prevents a user from creating a SA that allows cross-tenant object replication

- the policy allow a user to make any configuration changes to an existing SA that currently allows cross-tenant object replication

- if the SA currently partecipates in one or more cross-tenant replication policies, you will not be able to disallow cross-tenant object replication until you delete those policies

---

### Answer:

- the policy prevents a user from creating a SA that allows cross-tenant object replication
Yes

- the policy allow a user to make any configuration changes to an existing SA that currently allows cross-tenant object replication
No

- if the SA currently partecipates in one or more cross-tenant replication policies, you will not be able to disallow cross-tenant object replication until you delete those policies
Yes


---

### References:

[Prevent object replication across Microsoft Entra tenants](https://learn.microsoft.com/en-us/azure/storage/blobs/object-replication-prevent-cross-tenant-policies?tabs=portal)  

Object replication asynchronously copies block blobs from a container 
in one storage account (source) to a container in another storage account (destination).
When **you configure an object replication policy**, you specify the source account and 
container and the destination account and container.

After the policy is configured, Azure Storage **automatically** copies the results of:
- create
- update
- delete 

operations on a source object to the destination object.

> cross-tenant replication:
An authorized user can configure an object replication policy where the source account is in one Microsoft Entra tenant and the destination account is in a different tenant if cross tenant replication is allowed across Microsoft Entra tenants.

> disallow cross-tenant replication:
 If your security policies require that you restrict object replication to storage accounts that reside within the same tenant only, you can disallow the creation of policies where the source and destination accounts are in different tenants. 

**By default, cross-tenant object replication is disabled** for all new storage accounts 
created after Dec 15, 2023, unless you explicitly allow it.

> Remediate cross-tenant object replication:

set the `AllowCrossTenantReplication` property for the storage account to `false`.

> case1: `AllowCrossTenantReplication` = `false`.
If a storage account does not currently participate in any cross-tenant object replication policies, then setting the AllowCrossTenantReplication property to false prevents future configuration of cross-tenant object replication policies with this storage account as 
the source or destination. 

> case2: `AllowCrossTenantReplication` = `false`.
if a storage account currently participates in one or more cross-tenant object replication policies, then setting the AllowCrossTenantReplication property to false 
**is not permitted until you delete the existing cross-tenant policies**.

**When cross-tenant object replication is disallowed** for a storage account, then any new object replication policies that you create with that account 
**must include the full Azure Resource Manager IDs for the source and destination account**.
**Azure Storage requires the full resource ID to verify whether the source and destination** **accounts reside within the same tenant**.

> Rewuired roles to set `AllowCrossTenantReplication` = `false`

- The Azure Resource Manager Owner role
- The Azure Resource Manager Contributor role
- The Storage Account Contributor role

**These roles do not provide access to data in a storage account via Microsoft Entra ID**.

However, they include the 
`Microsoft.Storage/storageAccounts/listkeys/action`
which grants access to the account access keys.

> Use Azure Policy to audit for compliance:

If you have a large number of storage accounts, you may want to perform an audit to make sure that those accounts are configured to prevent cross-tenant object replication.
**To audit a set of storage accounts for their compliance, use Azure Policy.**
**Create a policy with an Audit effect**.

```
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.Storage/storageAccounts"
      },
      {
        "not": {
          "field":"Microsoft.Storage/storageAccounts/allowCrossTenantReplication",
          "equals": "false"
        }
      }
    ]
  },
  "then": {
    "effect": "audit"
  }
}
```


---

The following have already been discussed in one of the precious questions:

[Object replication for block blobs](https://learn.microsoft.com/en-us/azure/storage/blobs/object-replication-overview)  

[Configure object replication for block blobs](https://learn.microsoft.com/en-us/azure/storage/blobs/object-replication-configure?tabs=portal)    


---

## Q59:

You rae a cloud engineer in a global company with offices around the world.
The organization uses Azure to hist its infrastructure including file shares.
It use Premium-ZRS accounts as well as Azure Files workloads.

The company is planning to open new offices in the Azure Europe UK South Region.

You need to decide which option fro Azure Storage should be used based on
Micorsoft recommendantion.

- LRS with 3 replications
- LRS with 2 replications
- ZRS with 2 replications
- ZRS with 3 replications

---

### Answer:
- ZRS with 3 replications
This is the most robust option.

The LRS is not suitable and it is not recommended as it cannot match the
durability of ZRS in case of a world wide scenario like this one.

---

### References:

---

## Q58:

You work for a company that has a Azure sbscription and 
a separate SA for each department.

A member of the Marketing team has downloaded Azure Storage Explorer
as they want to upload some old files into Azure Blob Storage.
When they attempt to log in to Storage Explorer they get the 
following error:

`Read: List/Get Storage Account(s) permission issue`

The user has Contributor Access to the SA.
You must provide them the necessary access to the subscription in order 
to resove this error and apply the principle of least privilege.

What role should you assign to teh user at the subscription level?

- Owner
- Reader
- Contributor
- Storage Blob Data Reader


---

### Answer:
- Reader

**The user has Contributor Access to the SA**.
This arror is caused because this user lack sufficient permissions at the
subscription level.
The need to be able to **list all the storage accounts in teh subscription**.

---

### References:

[Azure Storage Explorer troubleshooting guide](https://learn.microsoft.com/en-us/troubleshoot/azure/azure-storage/storage-explorer-troubleshooting?tabs=Windows)   

---

## Q57:

A company is in teh process of migrating its resources from on-prem to Azure.

The Marketing team needs to migrate 15 GB of data 
from a file server to premium file storage.

They need to use a tool with a friendly GUI.

You must deploy a tool that support both: 
- the types of migration
- the requirements from teh Marketing team

Which tool do you choose?

- AzCopy
- Azure Storage Explorer
- PowerShell
- Azure Data Box

---

### Answer:
- Azure Storage Explorer

The following cannot be used:
- Azure Data Box

This is not a software tool, istead ot is a **physical device**
that is sent by Microsoft to your on-premise snd then set up in order to
import large amount of data into Azure.
**Micorsoft recommends using Data Box for cases over 40 TB of data**.

The following are obviouslu unsuitable:
- AzCopy
- Azure Storage Explorer
- PowerShell

---

### References:

[What is Azure Data Box?](https://learn.microsoft.com/en-us/azure/databox/data-box-overview)  

Here are the various scenarios where Data Box can be used to export data from Azure.

- Disaster recovery 
when a copy of the data from Azure is restored to an on-premises network. In a typical disaster recovery scenario, a large amount of Azure data is exported to a Data Box. Microsoft then ships this Data Box, and the data is restored on your premises in a short time.

- Security requirements
when you need to be able to export data out of Azure due to government or security requirements. For example, Azure Storage is available in US Secret and Top Secret clouds, and you can use Data Box to export data out of Azure.

- Migrate back to on-premises or to another cloud service provider
when you want to move all the data back to on-premises, or to another cloud service provider, export data via Data Box to migrate the workloads.

> Scebarios:

- Onetime migration - when a large amount of on-premises data is moved to Azure.
Moving a media library from offline tapes into Azure to create an online media library.
Migrating your VM farm, SQL server, and applications to Azure.
Moving historical data to Azure for in-depth analysis and reporting using HDInsight.

- Initial bulk transfer
when an initial bulk transfer is done using Data Box (seed) followed by incremental transfers over the network.

For example, backup solutions partners such as Commvault and Data Box are used to move initial large historical backup to Azure. Once complete, the incremental data is transferred via network to Microsoft Azure Storage.

- Periodic uploads
when large amount of data is generated periodically and needs to be moved to Azure. For example in energy exploration, where video content is generated on oil rigs and windmill farms.

---

## Q56:

Your aorganization hosts resources as IaaS Azure and on-premise.
You have an existig **Azure File Network File System v4.1 (NFSv4.1)** share.
This uses LRS.

The company wants to inprove redundancy of teh file share and has asked
you to migrate the existing files from LRS to ZRS.

What should you do?

- perform manual migration
- migration via Azure Portal
- request live migration
- use PowerShell

---

### Answer:
- perform manual migration

use either of the two supported migration options from LRS to a ZRS storage:
- manual migration 
- request live migration

However, `live migration` is not supported for **(NFSv4.1)**. 

---

### References:

[Change the redundancy configuration for a storage account](https://learn.microsoft.com/en-us/azure/storage/common/redundancy-migration?tabs=portal)  

> Options for changing the replication type:

> Manual migration:
You must perform a manual migration if:

You want to migrate your storage account to a different region.
Your storage account is a block blob account.
Your storage account includes data in the archive tier and rehydrating the data isn't desired.

With a manual migration, you copy the data from your existing storage account to a new storage account. To perform a manual migration, you can use one of the following options:

- AzCopy:
Copy data by using an existing tool such as AzCopy, one of the Azure Storage client libraries, or a reliable non-Microsoft tool.

- Hadoop or HDInsight:
If you're familiar with Hadoop or HDInsight, you can attach both the source storage account and destination storage account to your cluster. Then, parallelize the data copy process with a tool like DistCp.

---


## Q55:

An organization is in the process of migrating its reources iniot Azure
from on-premise.
You plan to use AzCopy to migrate Blob Storage blobs.
Company policy forbids using SAS tokens.

You must use another authorization option that is suported by AzCopy 
to accomplish the migration of blobs to Blob Storage.

- Microsoft Entra Domain Services
- Microsoft Entra ID
- AD Domain Services
- anonymous public read


---

### Answer:
- Microsoft Entra ID

In one of teh previous questions it iis discussed that the following
are the authorization method that are supported with AzCopy to copy
blobs to a Blob Storage:
- Microsoft Entra ID
- SAS

All the remining options for authorization are not supported with AzCopy:
- Microsoft Entra Domain Services
- AD Domain Services
- anonymous public read

---

### References:



---

## Q54:

You create a new SA named `mysa` in RG1.

Requirements:
- support hot, cool and archive tiers
- support automatic blob lifecycle
- provide fault tollerance against Azure-wide failure
- minimize costs

Complete the command:

```
az storageaccount create - n mysa -g RG1 \
--kind OPTIONS-1 --sku OPTIONS-2
```

OPTIONS-1:
Storage
StorageV2
BlockBlobStorage

OPTIONS-2:
Premium_LRS
Premium_ZRS
Standard_LRS
Standard_ZRS
Standard_GRS

---

### Answer:

```
az storageaccount create - n mysa -g RG1 \
--kind StorageV2 --sku Standard_GRS
```

`--kind StorageV2`:
StorageV2 is the best option in this case to create a GPv2 SA.
The GPv2 supports hot, cood and archive tiers 
AND
automatic lifecycle management setup.

**GPv1** would not be suitable here as it does not suppoert storage tiers.

`-sku Standard_GRS`:
copies your data synchronously three times 
**within a single physical location in the primary region**. 
It then copies your data asynchronously to a single physical location in the secondary region. Within the secondary region, your data is copied synchronously three times.

The `Premium_ZRS` would also work but it is more expensive than `Standard_GRS`
therefore it does not minimize costs.

---

### References:

[Optimize costs by automatically managing the data lifecycle](https://learn.microsoft.com/en-us/azure/storage/blobs/lifecycle-management-overview?tabs=azure-portal)  

> Lifecycle management policy definition
A lifecycle management policy is a collection of rules in a JSON document. 

```
{
  "rules": [
    {
      "name": "rule1",
      "enabled": true,
      "type": "Lifecycle",
      "definition": {...}
    },
    {
      "name": "rule2",
      "type": "Lifecycle",
      "definition": {...}
    }
  ]
}
```

> Example:

Tier blob to cool tier 30 days after last modification
Tier blob to archive tier 90 days after last modification
Delete blob 2,555 days (seven years) after last modification
Delete previous versions 90 days after creation

```
{
  "rules": [
    {
      "enabled": true,
      "name": "sample-rule",
      "type": "Lifecycle",
      "definition": {
        "actions": {
          "version": {
            "delete": {
              "daysAfterCreationGreaterThan": 90
            }
          },
          "baseBlob": {
            "tierToCool": {
              "daysAfterModificationGreaterThan": 30
            },
            "tierToArchive": {
              "daysAfterModificationGreaterThan": 90,
              "daysAfterLastTierChangeGreaterThan": 7
            },
            "delete": {
              "daysAfterModificationGreaterThan": 2555
            }
          }
        },
        "filters": {
          "blobTypes": [
            "blockBlob"
          ],
          "prefixMatch": [
            "sample-container/blob1"
          ]
        }
      }
    }
  ]
}
```

> Rule filters:
Filters limit rule actions to a subset of blobs within the storage account.
If more than one filter is defined, a logical AND runs on all filters.

> Rule actions:
Actions are applied to the filtered blobs when the run condition is met.

> Lifecycle policy runs:
The platform runs the lifecycle policy once a day. 
it can take up to 24 hours for changes to go into effect and for the first execution to start.
The time taken for policy actions to complete depends on the number of blobs evaluated and operated on.

---

## Q53:

You plan to configure object replication between SAs in two different regions.
You must enusre that Azure SA features are configured to support object replication.
Minimize admin effort.

Change Feed: OPTIONS
Blob vesrioning: OPTIONS

OPTIONS:
Destination account only
source account only
source & destination account 

---

### Answer:

Change Feed: source account only
Blob vesrioning: source & destination account

> Change Feed: source account only
The **change feed provides transaction log support** for changes made 
**in the source account** to:
- blobs 
- blobs metadata

This change log feed is:
- ordered
- durable
- immutable
- read-only

it enables **robust block blob replication** from source to destination SA.

> Blob vesrioning: source & destination account

This is necessary to automatically maintain previous versions of blob objects.
It provides a path to restore previous versions of a blob.

---

### References:

[Object replication for block blobs](https://learn.microsoft.com/en-us/azure/storage/blobs/object-replication-overview)  

Object replication asynchronously copies block blobs between a source storage account and a destination account. 
Object replication asynchronously copies block blobs in a container according to rules that you configure. 

- contents of the blob
- any versions associated with the blob
- and the blob's metadata and properties 

are all copied from the source container to the destination container

**There's currently no SLA on how long it takes to replicate data**
to the destination account. 


> Scenarios:

- Minimizing latency. 
Object replication can reduce latency for read requests by enabling clients to consume data from a region that is in closer physical proximity.

- Increase efficiency 
for compute workloads. With object replication, compute workloads can process the same sets of block blobs in different regions.

- Optimizing data distribution. 
You can process or analyze data in a single location and then replicate just the results to additional regions.

- Optimizing costs. 
After your data has been replicated, you can reduce costs by moving it to the archive tier using life cycle management policies.

> Prerequisites:
Object replication requires that the following Azure Storage features are also enabled:

1. Change feed: 
Must be enabled on the source account. 

2. Blob versioning: 
Must be enabled on both the source and destination accounts. 

> Costs:
Enabling change feed and blob versioning may incur additional costs.
There is no cost to configure object replication. 
This includes the task of enabling change feed, enabling versioning, as well as adding replication policies. 
However, object replication incurs costs on read and write transactions against the source and destination accounts, as well as egress charges for the replication of data from the source account to the destination account and read charges to process change feed.

> Encryption:
Object replication is supported for accounts that are encrypted with either: 
- microsoft-managed keys 
- or customer-managed keys. 

Object replication isn't supported for blobs in the source account that are encrypted with a customer-provided key.
Customer-managed failover isn't supported for either the source or the destination account in an object replication policy.

> Blob versioning is required on both sides:
Object replication requires that blob versioning is enabled on both the source and destination accounts. 

> If your storage account has object replication policies in effect:
you cannot disable blob versioning for that account. 
You must delete any object replication policies on the account before disabling blob versioning.

> Deleting a blob in the source account:
When a blob in the source account is deleted, the current version of the blob becomes a previous version, and there's no longer a current version. 

> Blob tiering and replication:
Object replication is supported when the source and destination accounts are in the hot or cool tier. 

> Immutable blobs:
Immutability policies for Azure Blob Storage include:
- time-based retention policies 
- and legal holds

When an immutability policy is in effect on the destination account, object replication may be affected!

> Failure 1
> If a container-level immutability policy is in effect for a container in the destination account: 
and an object in the source container is updated or deleted, then the operation on the source container may succeed, but replication of that operation to the destination container will fail. 

> Failure 2
> If a version-level immutability policy is in effect for a blob version in the destination account:
and a delete or update operation is performed on the blob version in the source container, then the operation on the source object may succeed, but replication of that operation to the destination object will fail. 

> Object replication policies and rules
When you configure object replication, you create a replication policy that specifies the source storage account and the destination account. 

A replication policy includes one or more rules that specify a source container and a destination container and indicate which block blobs in the source container will be replicated.

> Policy requirements:

**You must then associate that replication policy with the source account by using the policy ID**

**The policy ID on the source and destination accounts must be the same in order for replication to take place.**

**A source account can replicate to no more than two destination accounts, with one policy for each destination account.**

**an account may serve as the destination account for no more than two replication policies.**

> Regions, Subscriptions, Tenants:

The source and destination accounts may be in the same region or in different regions.
They may also reside in the same subscription or in different subscriptions.
source and destination accounts may reside in different Microsoft Entra tenants.

> Replication rules for a replication policy:

You can specify up to 1000 replication rules for each replication policy. 
You can specify up to 1000 replication rules for each replication policy. Each replication rule defines a single source and destination container, and each source and destination container can be used in only one rule, meaning that a maximum of 1000 source containers and 1000 destination containers may participate in a single replication policy.

When you create a replication rule, by default only new block blobs that are subsequently added to the source container are copied. You can specify that both new and existing block blobs are copied, or you can define a custom copy scope that copies block blobs created from a specified time onward.

**The source and destination containers must both exist before you can specify them in a rule.**
**After you create the replication policy, write operations to the destination container aren't permitted. they will fail eith (409)**

> An object replication policy is defined by JSON file

```
{
  "properties": {
    "policyId": "default",
    "sourceAccount": "/subscriptions/<subscriptionId>/resourceGroups/<resource-group>/providers/Microsoft.Storage/storageAccounts/<storage-account>",
    "destinationAccount": "/subscriptions/<subscriptionId>/resourceGroups/<resource-group>/providers/Microsoft.Storage/storageAccounts/<storage-account>",
    "rules": [
      {
        "ruleId": "",
        "sourceContainer": "<source-container>",
        "destinationContainer": "<destination-container>",
        "filters": {
          "prefixMatch": [
            "b"
          ],
          "minCreationTime": "2021-08-028T00:00:00Z"
        }
      }
    ]
  }
}
```

---

[Configure object replication for block blobs](https://learn.microsoft.com/en-us/azure/storage/blobs/object-replication-configure?tabs=portal)  

> Configure object replication with access to both storage accounts

`Set-AzStorageObjectReplicationPolicy`:

```
...
...

# Create the same policy on the source account.
Set-AzStorageObjectReplicationPolicy -ResourceGroupName $rgName `
    -StorageAccountName $src
    AccountName `
    -InputObject $destPolicy
```
> Configure object replication using a JSON file
If you don't have permissions to the source storage account or if you want to use more than 10 container pairs, then you can configure object replication on the destination account and provide a JSON file that contains the policy definition to another user to create the same policy on the source account.
For example, if the source account is in a different Microsoft Entra tenant from the destination account, then you can use this approach to configure object replication.

```
$object = Get-Content -Path C:\temp\json.txt | ConvertFrom-Json
Set-AzStorageObjectReplicationPolicy -ResourceGroupName $rgName `
    -StorageAccountName $srcAccountName `
    -PolicyId $object.PolicyId `
    -SourceAccount $object.SourceAccount `
    -DestinationAccount $object.DestinationAccount `
    -Rule $object.Rules
```

---

[Change feed support in Azure Blob Storage](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-change-feed?tabs=azure-portal)    

The purpose of the change feed is to provide transaction logs of all the changes that occur to the blobs and the blob metadata in your storage account. 
Client applications can read these logs at any time, either in streaming or in batch mode.
Each change generates exactly one transaction log entry, so you won't have to manage multiple log entries for the same change. 
The change feed enables you to build efficient and scalable solutions that process change events that occur in your Blob Storage account at a low cost.

Change feed records are stored as blobs in a special container in your storage account.
Change events are appended to the change feed as records in the Apache Avro format specification.
You can process these logs asynchronously, incrementally or in-full. 
Any number of client applications can independently read the change feed, in parallel, and at their own pace.

Analytics applications such as Apache Drill or Apache Spark can consume logs directly as Avro files **without having to write a custom application**.

> Scenarios:
> Change feed support is well-suited for scenarios that process data based on objects that have changed. 

- Update a secondary index:
synchronize with a cache, search-engine, or any other content-management scenarios.

- Extract business analytics insights and metrics:
based on changes that occur to your objects, either in a streaming manner or batched mode.

- Store, audit, and analyze changes to your objects, over any period of time:
for security, compliance or intelligence for enterprise data management.

- Build solutions to backup, mirror, or replicate object state in your account for disaster management or compliance.

- Build connected application pipelines that react to change events or schedule executions based on created or changed object.

> [Reacting to Blob storage event](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-event-overview)   
Changes are written and made available in your change feed log 
**within an order of a few minutes of the change**. 
If your application has to react to events much quicker than this, 
consider using **Blob Storage events** instead. 

Consume the change feed
The change feed produces several metadata and log files. These files are located in the $blobchangefeed container of the storage account. The $blobchangefeed container can be viewed either via the Azure portal or via Azure Storage Explorer.

Your client applications can consume the change feed by using the blob change feed processor library that is provided with the change feed processor SDK. To learn how to process records in the change feed, see Process change feed logs in Azure Blob Storage.

> Consume the change feed
The change feed produces several metadata and log files. These files are located in the `$blobchangefeed` container of the storage account. 
The `$blobchangefeed` container can be viewed either via the Azure portal or via Azure Storage Explorer.

**Your client applications can consume the change feed** by using 
**the blob change feed processor library** that is provided with the 
**change feed processor SDK**. 

To learn how to process records in the change feed, see:
[Process change feed logs in Azure Blob Storage](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-change-feed-how-to)  

---

[Blob versioning](https://learn.microsoft.com/en-us/azure/storage/blobs/versioning-overview)    

[Store business-critical blob data with immutable storage](https://learn.microsoft.com/en-us/azure/storage/blobs/immutable-storage-overview)  

[Reacting to Blob storage event](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-event-overview)    

[Process change feed logs in Azure Blob Storage](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-change-feed-how-to)  

---

## Q52:

Your company is migrating data stored on-premise file servers to Azure File Shares.
You create a File Storage account.
Due to company policy they can only use UK South region.

You must configure SA replication to optimise availability.

Which redundancy option should you configure?

- LRS : Locally Redundant Storage
- GZRS: Geo-zone Redundant Storage
- ZRS : Zone Redundant Storage
- GRS : Geo Redundant Storage




---

### Answer:
- ZRS : Zone Redundant Storage
Any Azure Region such as UK South can have 2 or more Availability Zones 
which can be used for redundancy of some services such as SA.
The ZRS options for SA makes three copies accross the available Zones
for teh region.

The remaining options:

- LRS : Locally Redundant Storage
The LRS options for SA makes three copies accross the same Data Center
and it is therefore NOT na high-availability option.

The G(Z)RS option provide availability also in case of regional outage.
- GRS : Geo Redundant Storage
copies your data synchronously three times 
**within a single physical location in the primary region**. 
It then copies your data asynchronously to a single physical location in the secondary region. Within the secondary region, your data is copied synchronously three times.

- GZRS: Geo-zone Redundant Storage
The GZRS adds on top of GRS **data durability**.
**copies your data synchronously across three Azure availability zones in the primary region**. 
It then copies your data asynchronously to a single physical location in the secondary region. Within the secondary region, your data is copied synchronously three times.

---

### References:

[Azure Storage redundancy](https://learn.microsoft.com/en-us/azure/storage/common/storage-redundancy)  

[Azure Files geo-redundancy for large file shares](https://learn.microsoft.com/en-us/azure/storage/files/geo-redundant-storage-for-large-file-shares?tabs=portal)   

Azure Files geo-redundancy for large file shares significantly improves capacity 
and performance for standard SMB file shares when using geo-redundant storage (GRS) 
and geo-zone redundant storage (GZRS) options.

Azure Files has offered 100 TiB standard SMB shares for years with locally redundant storage (LRS) and zone-redundant storage (ZRS). 

However, geo-redundant file shares had a 5 TiB capacity limit and were sometimes throttled 
due to IO operations per second (IOPS) and throughput limits. Now, geo-redundant standard 
SMB file shares support up to 100 TiB capacity with significantly improved IOPS and throughput limits.

---

## Q51:

You create a new storage account named DevStore for 
- Azure Blob Storage
- and Azure File Storage

You plan to use **AzCopy** to copy data from Blob Storage (BS)
and File Storage (FS) in other storage accounts to the SA DevStore.

You have access to the SA access keys for DevStore.
You also have a valid Microsoft Entra user account and SAS with access 
to the source data.

You need to identify the authorization methods you can use to copy 
the data to DevStore.

Blob Storage: OPTIONS
File Storage: OPTIONS

OPTIONS:
Microsoft Entra ID only
Access Keys only
SAS only
Microsoft Entra ID and SAS only
Access Keys only and SAS only
Microsoft Entra ID , Access Keys and SAS 


---

### Answer:

Blob Storage: Microsoft Entra ID and SAS only
File Storage: SAS only

---

### References:

[Get started with AzCopy](https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10)  

[Transfer data with AzCopy and file storage](https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-files)  

For commands that target files and directories, you can now provide authorization credentials by using Microsoft Entra ID and omit the SAS token from those commands. 


---

[Authorize AzCopy](https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10#authorize-azcopy)  

You can provide authorization credentials by using:

- Microsoft Entra ID
- or by using a Shared Access Signature (SAS) token.

> Option 1: Use Microsoft Entra ID

By using Microsoft Entra ID, you can provide credentials once 
instead of having to append a SAS token to each command.

> Option 2: Use a SAS token
You can append a SAS token to each source or destination URL 
that use in your AzCopy commands.

This example command recursively copies data from a local directory to a blob container. 
A fictitious SAS token is appended to the end of the container URL.

```
azcopy copy "C:\local\path" "https://account.blob.core.windows.net/mycontainer1/?sv=2018-03-28&ss=bjqt&srt=sco&sp=rwddgcup&se=2019-05-01T05:01:17Z&st=2019-04-30T21:01:17Z&spr=https&sig=MGCXiyEzbtttkr3ewJIh2AR8KrghSy1DGM9ovN734bQF4%3D" --recursive=true
```

---

## Q50:

You have two subscriptions named subA and subB.
subA has a SA with a file share named share1.
subB has a SA with a file share named share2.
Both file shares were created to serve different regions with the primary source of records being share1.

Over a period time, employees create a number of temporary files and provide updates to the original files from share1 in share2.
Some new files have been added to share2 also.

You must ensure that share1 and share2 have the most up-to-date information
and that temporary files are cleaned up.
Minimize the admin effort. 

- delete share2 filesaud use ZzCopy to copy files from share1 into share2

- use AzCopy with the sync option to sync files from share1 to share2, specifying share1 as the source and the setting `--delete-destination` flag set to true

- create a new container named share3 and copy files from share1 to share3. Replace files from share2 in share3 using Storage Explorer and delete share2

- use Micorsoft Storage Explorer to compare, copy and delete files is share1 and share2

---

### Answer:

- use AzCopy with the sync option to sync files from share1 to share2, specifying share1 as the source and the setting `--delete-destination` flag set to true

The `--delete-destination` flag set to true causes the temporary files that 
have been created in share2 and that are not present in share1 to be deleted
when the sync from share1 to share2 is performed.

The sync options ensure that only the most recent version that is the latest
update of any file shared between share1 and share2 is retained in both shares.

Any other otions do not apply.


---

### References:

[Get started with AzCopy](https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10)  

[Transfer data with AzCopy and file storage](https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-files)  

[azcopy copy](https://learn.microsoft.com/en-us/azure/storage/common/storage-ref-azcopy-copy?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json)  

[azcopy sync](https://learn.microsoft.com/en-us/azure/storage/common/storage-ref-azcopy-sync?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json)

[Synchronize files](https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-files#synchronize-files)   

You can synchronize the contents of:

- a local file system with a file share 
- or the contents of a file share with another file share.
- the contents of a directory in a file share with the contents of a directory that is located in another file share.

**Synchronization is one way**: you choose which of these two endpoints is the source and which one is the destination. 
**AzCopy sync is supported but not fully recommended for Azure Files**,
doesn't support differential copies at scale, and some file fidelity might be lost. 

By default, the sync command compares file names and last modified timestamps. 
You can override that behavior to use **MD5 hashes** instead of last modified timestamps by using the `--compare-hash` flag. 

Set the `--delete-destination` optional flag to a value of `true` or `prompt` to delete files in the destination directory if those files no longer exist in the source directory.

> When to use the AzCopy copy instead of sync command:
If you plan to set the `--delete-destination` flag to `prompt` or `false`, **consider using the copy command instead of the sync command** and set the `--overwrite` parameter to `ifSourceNewer`. 

> Use --compare-hash if possible:
If you don't plan to use the --compare-hash flag, then the machine on which you run the sync command should have an accurate system clock because the last modified times are critical in determining whether a file should be transferred. 
If your system has significant clock skew, avoid modifying files at the destination too close to the time that you plan to run a sync command.

> AzCopy Server to Server API AND LOAD CONCERNS:

AzCopy uses server-to-server APIs to synchronize data between storage accounts. 
That means that data is copied directly between storage servers.
However, AzCopy does set up and monitor each transfer, and for larger storage accounts (For example, accounts that contain millions of blobs), AzCopy might require a substantial amount of compute resources to accomplish these tasks. 
**Therefore, if you are running AzCopy from Virtual Machine (VM)**
**make sure that the VM has enough cores/memory to handle the load**.



---

## Q49:

Your company uses Micorsoft Entra ID and Azure File Shares.
You use the standard file shares (GPv2) with Geo-Zone Redundant Storage (GZRS).

You need to configure identity-based authentication for Server Message Block (SMB) access.

The following are requirements:

R1. You should be able to use MEID for authentication of hybrid users
R2. Your users should be able to access Azure File Shares over the internet
R3. Your users do not require a line-of-sight to domain controllers

What should you do?

- use Active Directory (AD) Kerberos authentication for Linux clients using on-prem AD DS or Micorsoft Entra DS
- use Kerberos authentication for hybrid identities
- use Microsoft Entra Domain Service authentication
- use on-prem Active Domain Services (AD DS) authentication

---

### Answer:
- use Kerberos authentication for hybrid identities

Azure File Share can use domain services **either on-premise or in Azure** 
to support identity-based access to Azure file shares over SMB (Server Message Block).

In this scenario, **Hybrid Users / Identities** in AD-DS  **that are synched to MEID** using the
lightweight agent **ME-Connect sync** or **ME-Connect Cloud sync** sync.

The **ME-Connect Cloud** is provided as an agent that can be istalled from the **Micorsoft Entra Admin Cebter**.

This set-up allows users from the on-prem environemnts who do not have line-of-sight to domain
controllers from **Microsoft hybrid joined** and **Micorsoft Entra-joined** VMs to access
Azure File Shares over the internet.

The remaining options do not apply:

- use on-prem Active Domain Services (AD DS) authentication

This option DOES NOT ALLOW:
- authentication for hybrid identities
- users to access Azure File Share over the internet who do not have line-of-sight to domain controllers (Microsoft Entra Hybrid joined & Microsoft Entra-joined VMs)

- use Microsoft Entra Domain Service authentication:
This is not a viable option because it requires line-of-sight to domain controllers (Microsoft Entra Hybrid joined & Microsoft Entra-joined VMs) 

- use Active Directory (AD) Kerberos authentication for Linux clients using on-prem AD DS or Micorsoft Entra DS
Linux client can use Kerberos based auth but require line-of-sight to domain controllers (Microsoft Entra Hybrid joined & Microsoft Entra-joined VMs) 

---

### References:

[Overview of Azure Files identity-based authentication options for SMB access](https://learn.microsoft.com/en-us/azure/storage/files/storage-files-active-directory-overview)   

Azure file shares can use domain services, either on-premises or in Azure, to support 
identity-based access to Azure file shares over SMB.

Enabling identity-based access for your Azure file shares allows you:
- to replace existing file servers with Azure file shares without replacing your existing directory service
- maintaining seamless user access to shares.

> Microsoft Entra Domain Services

Microsoft Entra Domain Services provides managed domain services such as domain join, group policies, LDAP, and Kerberos/NTLM authentication. These services are fully compatible with Active Directory Domain Services. 

> On-premises Active Directory Domain Services (AD DS)

On-premises Active Directory Domain Services (AD DS) **integration with Azure Files** provides the methods for storing directory data while making it available to network users and administrators. 
**Security is integrated with AD DS through logon authentication and access control to objects in the directory**. 
With a single network logon, administrators can manage directory data and organization throughout their network, 
and authorized network users can access resources anywhere on the network. 
AD DS is commonly adopted by enterprises in on-premises environments or on cloud-hosted VMs, and AD DS credentials
 are used for access control. 

> Supported authentication scenarios:

Azure Files supports identity-based authentication over SMB through the following methods.
You can only use one method per storage account.

- On-premises AD DS authentication: 
**On-premises AD DS-joined or Microsoft Entra Domain Services-joined Windows machines** 
can access Azure file shares with on-premises Active Directory credentials that are synched to Microsoft Entra ID over SMB. 
**Your client must have unimpeded network connectivity to your AD DS**. 
If you already have AD DS set up on-premises or on a VM in Azure where your devices are domain-joined to your AD, 
you should use AD DS for Azure file shares authentication.

- Microsoft Entra Domain Services authentication: 
**Cloud-based, Microsoft Entra Domain Services-joined Windows VMs** 
can access Azure file shares with Microsoft Entra credentials. 
In this solution, Microsoft Entra ID runs a traditional Windows Server AD domain on behalf of the customer, 
which is a child of the customer’s Microsoft Entra tenant.

- Microsoft Entra Kerberos for hybrid identities: 
Using Microsoft Entra ID for authenticating hybrid user identities allows Microsoft Entra users 
to access Azure file shares using Kerberos authentication. 
This means your end users:
**can access Azure file shares over the internet without requiring network connectivity to domain controllers**
**from Microsoft Entra hybrid joined and Microsoft Entra joined VMs**. 
Cloud-only identities aren't currently supported.

- AD Kerberos authentication for Linux clients: 
Linux clients can use Kerberos authentication over SMB for Azure Files using on-premises AD DS 
or Microsoft Entra Domain Services.

---

[What is Microsoft Entra Domain Services?](https://learn.microsoft.com/en-us/entra/identity/domain-services/overview)   

[Kerberos Authentication Overview](https://learn.microsoft.com/en-us/windows-server/security/kerberos/kerberos-authentication-overview)   


[Microsoft SMB Protocol and CIFS Protocol Overview](https://learn.microsoft.com/en-us/windows/win32/fileio/microsoft-smb-protocol-and-cifs-protocol-overview)    


---

[What is Microsoft Entra Cloud Sync?](https://learn.microsoft.com/en-us/entra/identity/hybrid/cloud-sync/what-is-cloud-sync)    

Microsoft Entra Cloud Sync is a new offering from Microsoft designed to meet and accomplish your hybrid 
identity goals for synchronization of users, groups, and contacts to Microsoft Entra ID.
**It accomplishes this by using the Microsoft Entra cloud provisioning agent instead of the**
**Microsoft Entra Connect application**.

**it can be used alongside Microsoft Entra Connect Sync** and it provides the following benefits:

- Simplified installation with light-weight provisioning agents: 
The agents act as a bridge from AD to Microsoft Entra ID, with all the sync configuration managed in the cloud.

- Multiple provisioning agents can be used to simplify high availability deployments: 
particularly critical for organizations relying upon password hash synchronization from AD to Microsoft Entra ID.

- Support for large groups with up to 50,000 members. 
It's recommended to use only the OU scoping filter when synchronizing large groups.


- Support for synchronizing to a Microsoft Entra tenant from a multi-forest disconnected Active Directory forest environment:
The common scenarios include merger & acquisition (where the acquired company's AD forests are isolated from the parent company's AD forests), and companies that have historically had multiple AD forests.

> How is Microsoft Entra Cloud Sync different from Microsoft Entra Connect Sync?

With Microsoft Entra Cloud Sync, provisioning from AD to Microsoft Entra ID is orchestrated in Microsoft Online Services.
An organization only needs to deploy, in their on-premises or IaaS-hosted environment, a **light-weight agent** that acts as a bridge between Microsoft Entra ID and AD. 
**The provisioning configuration is stored in Microsoft Entra ID** and managed as part of the service.

---

[What is Microsoft Entra Connect?](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/whatis-azure-ad-connect)    
Microsoft Entra Connect is an on-premises Microsoft application.

---

## Q48:

You are an Azure admin for a manufacturing organization.
You are suing SAS to configure control over the SA.

You create a SAP (Storage Access Policy) as an additional level of control over SAS
on the server side for File Shares.

You need to modify a SAP.

What should you do?

- execute a Set Share ACL operation with the SMB protocol
- execute a Set Share ACL operation 
- execute a Set Container ACL operation with public access for blobs only

---

### Answer:
- execute a Set Share ACL operation with the SMB protocol

---

### References:

[Define a stored access policy](https://learn.microsoft.com/en-us/rest/api/storageservices/define-stored-access-policy)  

[Set Share ACL](https://learn.microsoft.com/en-us/rest/api/storageservices/set-share-acl)    
The Set Share ACL operation sets a stored access policy for use with shared access signatures.

```
Request Syntax:  
PUT https://myaccount.file.core.windows.net/myshare?restype=share&comp=acl HTTP/1.1  
  
Request Headers:  
x-ms-version: 2015-02-21  
x-ms-date: <date>  
Authorization: SharedKey myaccount:V47F2tYLS29MmHPhiR8FyiCny9zO5De3kVSF0RYQHmo=  
```

```
<?xml version="1.0" encoding="utf-8"?>  
<SignedIdentifiers>  
  <SignedIdentifier>   
    <Id>unique-64-character-value</Id>  
    <AccessPolicy>  
      <Start>start-time</Start>  
      <Expiry>expiry-time</Expiry>  
      <Permission>abbreviated-permission-list</Permission>  
    </AccessPolicy>  
  </SignedIdentifier>  
</SignedIdentifiers>
```
---

## Q47:

You manage an ASP.Net Core App named app1 that runs in Azure App Service.

The app connects to a SA named sotrage1 that uses an access key stored in an app settings.
Both app1 and storage1 are provisioned in a RG1.

For security reasons, you need to regenerate the storage1 access keys
without interrupting the connection with app1.

How should you complete the command?

```
key=$(az storage account keys list --resoyrce-group rg1 --account-name storage1 OPTIONS-1)
az webapp config appsettings set --resource-group rg1 --name app1 --settings STORAGE_ACCOUNT_KEY=$key

az storage account keys renew --resource-group rg1 - --account-name storage1 OPTIONS-2

key=$(az storage account keys list --resoyrce-group rg1 --account-name storage1 OPTIONS-3)
az webapp config appsettings set --resource-group rg1 --name app1 --settings STORAGE_ACCOUNT_KEY=$key

az storage account keys renew --resource-group rg1 - --account-name storage1 OPTIONS-4

```

OPTIONS-1,..,4:
--key primary
--key secondary
--query[0].value
--query[1].value

---

### Answer:

```
# take key2 first
key=$(az storage account keys list --resoyrce-group rg1 --account-name storage1 query[1].value)

# swap the key1 with key2 in the app 
az webapp config appsettings set --resource-group rg1 --name app1 --settings STORAGE_ACCOUNT_KEY=$key

# regenerate key1
az storage account keys renew --resource-group rg1 - --account-name storage1 --key primary

# take the new key1 that you have jusr regenerated
key=$(az storage account keys list --resoyrce-group rg1 --account-name storage1 query[0].value)

# swap the key2 with the new key1 in the app 
az webapp config appsettings set --resource-group rg1 --name app1 --settings STORAGE_ACCOUNT_KEY=$key

# regenerate key2
az storage account keys renew --resource-group rg1 - --account-name storage1 --key secondary

```

---

### References:

`az storage account keys list`
`az webapp config appsettings set`
`az storage account keys renew`

[Manage storage account access keys](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage?tabs=azure-cli)  


---

## Q46:

You need to give a user temporary R/W permissions to a new blob by using a SAS
without using the Azure Portal.

You have a Storage Account in place.

Which six actions should you perform in sequence?

- connect to your SA
- create a blob container
- create a RG
- create a storage access policy for the container
- get a SAS for the blob and specify start/expiry & permissions
- open Azure Storage Explorer
- upload the blob to the container
- use HTTPS to provide access to the blob

---

### Answer:

- open Azure Storage Explorer
- connect to your SA
- create a blob container
- upload the blob to the container
- get a SAS for the blob and specify start/expiry & permissions
- use HTTPS to provide access to the blob

---

### References:

---

---

## Q45:

You have two SA keys: 
- key1
- key2

Your apps and services use key1.
You maintain key2 as a backup key.

You are concerned that both keys may have been compromised.
You want to regenerate the keys without interrupting access to the SA.

Which 5 actions should you perfrom in a sequence?

- update the connection string in all relevant apps and services to use key2
- verify that all apps and services are running correctly using the new key
- update the connection string in all relevant apps and services to use key1
- create a new key3 using the Azure Portal 
- regenerate key2 using the Azure Portal 
- regenerate key1 using the Azure Portal 


---

### Answer:

- regenerate key2 using the Azure Portal 
- update the connection string in all relevant apps and services to use key2
- regenerate key1 using the Azure Portal 
- update the connection string in all relevant apps and services to use key1
- verify that all apps and services are running correctly using the new key


---

### References:

[Manage storage account access keys](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage?tabs=azure-portal&source=docs)  


[Security recommendations for Blob storage](https://learn.microsoft.com/en-us/azure/storage/blobs/security-recommendations)  

---

## Q44:

You have a SA named salesstorage in a subscription named SalesSubscription.
You create a container in a blob storage named salescontainer.

You create a the SAS shown in the exhibit.

<img src="./Q44-exhibit.png">


You try to carry out actions from several computers at different times using 
the SAS key1 configurations shown in the exhibit.

What level of access would be available in each scenario?

OPTIONS:
Connection failure with read access
Connection failure with read, write and list access
Connection success with read, write and list access


| CONFIGURATION | Value            | Action           | Action Result  | 
| -------------------------------- | ---------------- | -------------- |
| 151.112.10.6  | 04032020 11 AM   | Connect to SA    | ?              |
| 151.112.11.6  | 04032020 12 AM   | Connect to SA    | ?              |
| 151.112.10.6  | 10032020 10 AM   | Create container | ?              |
| 151.112.10.6  | 10032020 12 AM   | Read File Share  | ?              |


---

### Answer:


| CONFIGURATION | Value            | Action           | Action Result  | 
| -------------------------------- | ---------------- | -------------- |
| 151.112.10.6  | 04032020 11 AM   | Connect to SA    | Connection success with read, write and list access  |
| 151.112.11.6  | 04032020 12 AM   | Connect to SA    | Connection failure with read, write and list access  |
| 151.112.10.6  | 10032020 10 AM   | Create container | Connection failure with read, write and list access  |
| 151.112.10.6  | 10032020 12 AM   | Read File Share  | Connection failure with read, write and list access  |

The allowed IP address range is: 151.112.10.1 -  151.112.10.255

Therefore any operation from 151.112.11.6 is not granted by the SAS generated according
to the exhibit.

`| 151.112.10.6  | 10032020 10 AM   | Create container | Connection failure with read, write and list access  |`

This happens because the SAS is configured to prowide R/W/List permissions on Blob.
This set of permisisons DOES NOT INCLUDE the CREATE CONTAINER operation on the SA!

`| 151.112.10.6  | 10032020 12 AM   | Read File Share  | Connection failure with read, write and list access  |`

This happens because the SAS is configured to grant R/W/List on blobs and NOT File(s) in a File Share.

---

### References:

[Grant limited access to Azure Storage resources using shared access signatures (SAS)](https://learn.microsoft.com/en-us/azure/storage/common/storage-sas-overview)  


---

## Q43:

You create a BLOB (Binary Large Object) storage acount `reportstorage99`
that contains achival reports from past corporate board meetings.


A board member requests access to a specific report.
This member does not have a Microsoft Entra user account.
Moreover, they have access only to a web browser on his Google Chromebook device.

You need to provide the boiard member with a **least-privilege access** to the 
requested report while maintaining security compliance and minimizing admin effort.

What should you do?

- Copy the report to Azure Files Service share and provide the board member with a Powershell connection script
- Generate a SAS token for the report and share the URL eith the board member
- Create the MEID-Account for the board member and grant him RABC access to the SA
- Deply a P2S (point-to-site) VPN connection on the Chromebook and grant the member the RABAC access to the report

---

### Answer:
- Generate a SAS token for the report and share the URL eith the board member
This is the obvious answer.
In particular SAS is the ONLy way that a SA allows access to a INDIVIDUAL resource,
RBAC cannot be used to cover this scenario!
In addition the RBAC solutions present  much hiher admin effort.

The P2S (point-to-site) VPN connection on the Chromebook would not be possible as 
**P2S is supported only on Windows!** --> THIS MIGHT NO LONGER BE THE CASE!

---

### References:

[Grant limited access to Azure Storage resources using shared access signatures (SAS)](https://learn.microsoft.com/en-us/azure/storage/common/storage-sas-overview)  

[About Point-to-Site VPN](https://learn.microsoft.com/en-us/azure/vpn-gateway/point-to-site-about)  

A Point-to-Site (P2S) VPN gateway connection lets you create a secure connection to your virtual network from an individual client computer. A P2S connection is established by starting it from the client computer. This solution **is useful for telecommuters who want to connect to Azure VNets from a remote location**, 
such as from home or a conference. 

**P2S VPN is also a useful solution to use instead of S2S VPN when you have only a few clients** 
that need to connect to a VNet. This article applies to the Resource Manager deployment model.

> What protocol does P2S use?

- OpenVPN Protocol
- Secure Socket Tunneling Protocol (SSTP)
- IKEv2 VPN

---

## Q42:

Your company develops a .NET app that stores part of the information
in an Azure Storage Account.
This app will be installed on end users' computers.

You need to ensure that he information stored in the SA is accessed in a secure way.
You ask the developers to use SAS when accessing info on te SA.
Yo must make the required configurations on the SA to follow security best 
practices and enable access to teh SA with immediate effect.

Select Yes / No.

- You need to configure a store access policy
- you should set the SAS start time to now
- you should validate data that has been writteng using SAS
- one option for revoking a SAS is by deleting a storage access policy

>  call the Set ACL (Access Control List) operation for the resource:

- Set Container ACL
- Set Queue ACL
- Set Table ACL
- Set Share ACL

with a request body that specifies the terms of the access policy. 

```
<?xml version="1.0" encoding="utf-8"?>  
<SignedIdentifiers>  
  <SignedIdentifier>
    <Id>unique-64-char-value</Id>  
    <AccessPolicy>  
      <Start>start-time</Start>  
      <Expiry>expiry-time</Expiry>  
      <Permission>abbreviated-permission-list</Permission>  
    </AccessPolicy>  
  </SignedIdentifier>  
</SignedIdentifiers>
```

> Modify or revoke a stored access policy:

To modify the parameters of a stored access policy, you can call the access control list (ACL) operation for the resource type to replace the existing policy. In that operation, specify a new start time, expiry time, or set of permissions.

**To revoke a stored access policy** you can:

- delete it
- rename it by changing the signed identifier
- or change the expiry time to a value in the past.



---

### Answer:

- You need to configure a store access policy
Yes

- you should set the SAS start time to now
No
There might be differences between the host time and the client time.
It is recommended to set the start time to **15 minutes prior to the server time**
OR **you may also NOT set the start time at all** to make sure that clients are 
not denied assess.

- you should validate data that has been written using SAS
Yes
The data that is written to the SA by clients access via SAS should be validated
to prevent data corruption and communication issues. The data should be validated
aftern being written to the SA by another app and thne being marked as OK or corrupted.

- one option for revoking a SAS is by deleting a storage access policy
Yes

---

### References:

[Define a stored access policy](https://learn.microsoft.com/en-us/rest/api/storageservices/define-stored-access-policy)  

A stored access policy provides an additional level of control over service-level shared access signatures (SASs) on the server side. Establishing a stored access policy serves to group shared access signatures and to provide additional restrictions for signatures that are bound by the policy.

You can use a stored access policy to change the start time, expiry time, or permissions for a signature.
You can also use a stored access policy to revoke a signature after it has been issued.

The following storage resources support stored access policies:

- Blob containers
- File shares
- Queues
- Tables

A stored access policy on a container can be associated with a shared access signature that grants permissions to the container itself or to the blobs that it contains. Similarly, a stored access policy on a file share can be associated with a shared access signature that grants permissions to the share itself or to the files that it contains.

Stored access policies are not supported for the user delegation SAS or the account SAS.

> Create or modify a stored access policy:

a shared access signature consists of the:
- start time
- expiry time
- permissions for the signature. 

You can specify either of the following options or combine them:

- All of these parameters on the signature URI and none on the stored access policy
- All of these parameters on the stored access policy and none on the URI

However, you can't specify a parameter on both the SAS token and the stored access policy.

---

[Grant limited access to Azure Storage resources using shared access signatures (SAS)](https://learn.microsoft.com/en-us/azure/storage/common/storage-sas-overview)  

---

## Q41:

Your Azure Subscription has the following resources:

- three App Services
- one backup vault
- one Azure Event Hub (AEH)
- a VNet named VNET01
- a VPN Gateway

You deploy a new SA namend storage1 in a RG named RG01.

You need to ensure that the App Services, the Backup Vault and the AEH can access the new SA. 
Access should be enabled from within Azure only and not over the public internet.

You decide to use PowerShell to set up the new SA.
How should you complete the command string?

```
Get-AzVirtualNetwork -ResourceGroupName "RG01" -Name "VNET01" `
| Set-AzVirtualNetworkSubnetConfig -Name "VSUBNET01" -AddressPrefix "10.0.0.0/24" -ServiceEndpoint "OPTIONS-1"  ` 
| Set-AzVirtualNetwork 

$subnet = Get-AzVirtualNetwork -ResourceGroupName "RG01" -Name "VNET01" `
| Get-AzVirtualNetworkSubnetConfig -Name "VSUBNET01"

OPTIONS-2 -ResourceGroupName "RG01" -Name "storage01" -VirtualNetworkResourceId $subnet.Id

OPTIONS-3 -ResourceGroupName "RG01" -Name "storage01" -Bypass OPTIONS-4
```

OPTIONS-1
&
OPTIONS-4:
AzureServices
Logging 
Metrics
Microsoft.Storage
None

OPTIONS-2 
& 
OPTIONS-3:
Add-AzStorageAccountNetworkRule
Remove-AzStorageAccountNetworkRuleSet
Update-AzStorageAccountNetworkRuleSet
Set-AzStorageAccount

---

### Answer:

```
Get-AzVirtualNetwork -ResourceGroupName "RG01" -Name "VNET01" `
| Set-AzVirtualNetworkSubnetConfig -Name "VSUBNET01" -AddressPrefix "10.0.0.0/24" -ServiceEndpoint "Microsoft.Storage"  ` 
| Set-AzVirtualNetwork 

$subnet = Get-AzVirtualNetwork -ResourceGroupName "RG01" -Name "VNET01" `
| Get-AzVirtualNetworkSubnetConfig -Name "VSUBNET01"

Add-AzStorageAccountNetworkRule -ResourceGroupName "RG01" -Name "storage01" -VirtualNetworkResourceId $subnet.Id

Update-AzStorageAccountNetworkRuleSet -ResourceGroupName "RG01" -Name "storage01" -Bypass AzureServices
```

The line: 
`Set-AzVirtualNetworkSubnetConfig -Name "VSUBNET01" -AddressPrefix "10.0.0.0/24" -ServiceEndpoint "Microsoft.Storage"`

allows connections to VNET01 **from** (any) the SA.
`Set-AzVirtualNetworkSubnetConfig` changes only the memory representation of of the VNet.
The followinng command: `Set-AzVirtualNetwork` persists these changes ot the VNet.

`Add-AzStorageAccountNetworkRule` adds a **firewall exception** to the SA's NetworkRule property.
`Update-AzStorageAccountNetworkRuleSet` updates the NetworkRule property of a Storage account with `-Bypass AzureServices`

---

### References:

[Add-AzStorageAccountNetworkRule](https://learn.microsoft.com/en-us/powershell/module/az.storage/add-azstorageaccountnetworkrule?view=azps-11.4.0)   

Add IpRules or VirtualNetworkRules to the NetworkRule property of a Storage account

> Examples:
```
# Example 1: Add several IpRules with IPAddressOrRange
# This command add several IpRules with IPAddressOrRange.
Add-AzStorageAccountNetworkRule -ResourceGroupName "myResourceGroup" -Name "mystorageaccount" -IPAddressOrRange "10.0.0.0/7","28.2.0.0/16"

# Example 2: Add a VirtualNetworkRule with VirtualNetworkResourceID
# This command add a VirtualNetworkRule with VirtualNetworkResourceID.
$subnet = Get-AzVirtualNetwork -ResourceGroupName "myResourceGroup" -Name "myvirtualnetwork" | Get-AzVirtualNetworkSubnetConfig
Add-AzStorageAccountNetworkRule -ResourceGroupName "myResourceGroup" -Name "mystorageaccount" -VirtualNetworkResourceId $subnet[0].Id

# Example 3: Add VirtualNetworkRules with VirtualNetworkRule Objects from another account
$networkrule = Get-AzStorageAccountNetworkRuleSet -ResourceGroupName "myResourceGroup" -Name "mystorageaccount1"
Add-AzStorageAccountNetworkRule -ResourceGroupName "myResourceGroup" -Name "mystorageaccount2" -VirtualNetworkRule $networkrule.VirtualNetworkRules

# Example 6: Add all resource access rules of one storage account to another storage account
(Get-AzStorageAccountNetworkRuleSet -ResourceGroupName "myResourceGroup" -Name "mystorageaccount1").ResourceAccessRules | Add-AzStorageAccountNetworkRule -ResourceGroupName "myResourceGroup" -Name "mystorageaccount2"
```

[Update-AzStorageAccountNetworkRuleSet](https://learn.microsoft.com/en-us/powershell/module/az.storage/update-azstorageaccountnetworkruleset?view=azps-11.4.0)  
Updates the NetworkRule property of a Storage account

> Example 2: Update Bypass property of NetworkRule:
This command clean up rules of NetworkRule of a Storage account (other properties not change)!
```
Update-AzStorageAccountNetworkRuleSet -ResourceGroupName "myResourceGroup" -Name "mystorageaccount" -Bypass AzureServices,Metrics
```

`-Bypass None`: is used to remove access to the SA from any Azure Service.
`-Bypass  Logging,Metrics`: is used to allow logging and metrice of the SA to be collected in Azure.

---

[Set-AzStorageAccount](https://learn.microsoft.com/en-us/powershell/module/az.storage/set-azstorageaccount?view=azps-11.4.0)  
modifies an Azure Storage account. 
You can use this cmdlet to modify the account type, update a customer domain, or set tags on a Storage account.

[Set-AzVirtualNetworkSubnetConfig](https://learn.microsoft.com/en-us/powershell/module/az.network/set-azvirtualnetworksubnetconfig?view=azps-11.4.0)    
Updates a subnet configuration for a virtual network.

---

[Configure Azure Storage firewalls and virtual networks](https://learn.microsoft.com/en-us/azure/storage/common/storage-network-security?tabs=azure-portal)  

When you configure network rules, only applications that request data over the specified set of networks or
through the specified set of Azure resources can access a storage account.
You can limit access to your storage account to requests that come from:
- specified IP addresses
- IP ranges
- subnets in an Azure virtual network
- or resource instances of some Azure service

Storage accounts have a public endpoint that's accessible through the internet.
**You can also create private endpoints for your storage account**. 
Creating private endpoints assigns a private IP address from your virtual network to the storage account.
 It helps secure traffic between your virtual network and the storage account over a private link.

**The Azure Storage firewall** provides **access control for the public endpoint** of your storage account. 
**You can also use the firewall to block all access through the public endpoint when you're using private endpoints**.
**Your firewall configuration also enables trusted Azure platform services to access the storage account**.

> Authorization 
An application that accesses a storage account when network rules are in effect still requires proper 
authorization for the request. 
**Authorization is supported with Microsoft Entra credentials** for:
- blobs
- tables
- file shares 
- queues

with a valid account access key, or with a shared access signature (SAS) token. 

> Blob container for anonymous access:
When you configure a **blob container for anonymous access**, requests to read data in that container
don't need to be authorized.
**The firewall rules remain in effect and will block anonymous traffic**.

> Block Access by default with SA firewall rules:
Turning on firewall rules for your storage account blocks incoming requests for data by default, 
unless the requests originate from:
- a service that operates within an Azure virtual network 
- or from allowed public IP addresses. 

Requests that are blocked include:
- those from other Azure services
- from the Azure portal
- and from logging and metrics services

> Exceptions mechanism for the SA Firewall:
You can grant access to Azure services that operate from within a virtual network by allowing traffic 
from the subnet that hosts the service instance. 
You can also enable a limited number of scenarios through the **exceptions mechanism** that this article
describes. 

> Important:
**Storage firewall rules apply to the public endpoint of a storage account.**
**You don't need any firewall access rules to allow traffic for private endpoints of a storage account.**

> Scenarios:


To secure your storage account, you should first configure a rule to deny access to traffic from all
networks (including internet traffic) on the public endpoint, by default. 
Then, you should configure rules that grant access to traffic from specific virtual networks. 
You can also configure rules to grant access to traffic from selected public internet IP address ranges, 
enabling connections from specific internet or on-premises clients. This configuration helps you build 
a secure network boundary for your applications.

> Configure network access to Azure Storage:

- Allow access from selected virtual network subnets using private endpoints.
- Allow access from selected virtual network subnets using service endpoints.
- Allow access from specific public IP addresses or ranges.
- Allow access from selected Azure resource instances.
- Allow access from trusted Azure services (using Manage exceptions).
- Configure exceptions for logging and metrics services.

> Exceptions:

[Configure network access to Azure Storage](https://learn.microsoft.com/en-us/azure/storage/common/storage-network-security?tabs=azure-portal#manage-exceptions)  

In some cases, like storage analytics, access to read resource logs and metrics is 
required from outside the network boundary. When you configure trusted services to
access the storage account, you can allow read access for the log files, metrics tables,
or both by creating a network rule exception.

> Virtual network endpoints:

[About virtual network endpoints](https://learn.microsoft.com/en-us/azure/storage/common/storage-network-security?tabs=azure-portal#about-virtual-network-endpoints)

- Virtual Network service endpoints
- Private endpoints

> Virtual Network service endpoints:
Virtual network service endpoints are public and accessible via the internet. 
he Azure Storage firewall provides the ability to control access to your storage account over such public endpoints.

> Private endpoints:
A private endpoint uses a private IP address from your virtual network to access a storage account over the Microsoft backbone network. 
With a private endpoint, traffic between your virtual network and the storage account are secured over a private link.
**Storage firewall rules only apply to the public endpoints of a storage account, not private endpoints**!

The process of approving the creation of a private endpoint grants implicit access to traffic from the subnet that hosts the private endpoint.
You can use **Network Policies** to control traffic over private endpoints if you want to refine access rules. 
**If you want to use private endpoints exclusively, you can use the firewall to block all access through the public endpoint**.

---

[Use private endpoints for Azure Storage](https://learn.microsoft.com/en-us/azure/storage/common/storage-private-endpoints)  

---


## Q40:

The core application development team in your company needs R/W access to an Azure based storage account as a repository for a new company-wide application.

You need to create a geo-redundant SA within an Azure RG and provide the access control keys to the app dev team.

How should you complete the PowerShell script?

```
OPTIONS-1

Set-AzContext -subscription "SubscriptionName"

OPTIONS-2 -Name "RGName" -Location "East US 2"

New-AzStorageAccount -Name "SAName" -ResourceGroupName "RGName" `
OPTIONS-3 OPTIONS-4 -Location "East US 2"

OPTIONS-5 -ResourceGroupNane "RGName" -Name "SAName"

```

OPTIONS-1: Login-AzAccount | Add-AzureAccount

OPTIONS-2: 
New-AzResourceGroup
New-AzResourceGroupDeployment

OPTIONS-3:
-Kind
-SkuName

OPTIONS-4:
Standard_RAGRS
Standard_GRS
Standard_LRS

OPTIONS-5:
Get-AzKeyVault
Get-AzStorage
Get-AzStorageAccountKey

---

### Answer:

```
Login-AzAccount
Set-AzContext -subscription "SubscriptionName"
New-AzResourceGroup -Name "RGName" -Location "East US 2"
New-AzStorageAccount -Name "SAName" -ResourceGroupName "RGName" `
-SkuName Standard_GRS -Location "East US 2"
Get-AzStorageAccountKey -ResourceGroupNane "RGName" -Name "SAName"
```


---

### References:

[New-AzStorageAccount](https://learn.microsoft.com/en-us/powershell/module/az.storage/new-azstorageaccount?view=azps-11.4.0)   

[Get-AzStorageAccountKey](https://learn.microsoft.com/en-us/powershell/module/az.storage/get-azstorageaccountkey?view=azps-11.4.0)  

```
Get-AzStorageAccountKey -ResourceGroupName "RG01" -Name "mystorageaccount"

# Example 2: Get a specific access key for a Storage account
(Get-AzStorageAccountKey -ResourceGroupName "RG01" -Name "mystorageaccount")| Where-Object {$_.KeyName -eq "key1"}

# include the Kerberos keys (if active directory enabled)
Get-AzStorageAccountKey -ResourceGroupName "RG01" -Name "mystorageaccount" -ListKerbKey
```

[New-AzResourceGroupDeployment](https://learn.microsoft.com/en-us/powershell/module/az.resources/new-azresourcegroupdeployment?view=azps-11.4.0)  
Adds an Azure deployment to a resource group.
A resource group deployment uses a template to add resources to a resource group and publishes them so that they are available in Azure.
To add resources to a resource group without using a template, use the `New-AzResource` cmdlet. 
To add a resource group deployment, specify:
- the name of an existing resource group 
- and a resource group template (JSON file)

> Example 1: Use a custom template and parameter file to create a deployment
```
New-AzResourceGroupDeployment -ResourceGroupName "ContosoEngineering" -TemplateFile "D:\Azure\Templates\EngineeringSite.json" -TemplateParameterFile "D:\Azure\Templates\EngSiteParms.json" -Tag @{"key1"="value1"; "key2"="value2";}
```

> Example 2: Use a custom template object and parameter file to create a deployment
```
$TemplateFileText = [System.IO.File]::ReadAllText("D:\Azure\Templates\EngineeringSite.json")
$TemplateObject = ConvertFrom-Json $TemplateFileText -AsHashtable
New-AzResourceGroupDeployment -ResourceGroupName "ContosoEngineering" -TemplateObject $TemplateObject -TemplateParameterFile "D:\Azure\Templates\EngSiteParams.json"
```

> Example 4: Deploy a template stored in a non public storage account using a uri and SAS token
```
New-AzResourceGroupDeployment -ResourceGroupName "RGName" -TemplateUri "https://example.com/example.json" -QueryString "foo"
```

-

## Q39:

Your company creates multiple management groups under the root MG.

You are reorganizing the MGs and want to move all resources for Sales and Marketing
MGs under the Marketing MG.

Once finished, you plan to delete the Sales MG.

You need to move the subscription named SalesSub to the Marketing MG.

Which two PowerShell cmdlets should you use?

- Remove-AzManagementGroup
- Update-AzManagementGroup
- Remove-AzManagementGroupSubscription
- New-AzManagementGroupSubscription

---

### Answer:

Moving a subscription to another MG implicitly means that the subscription
already has a MG. 

- Remove-AzManagementGroupSubscription
- New-AzManagementGroupSubscription

- Remove-AzManagementGroup:
 this simply deletes a MG

- Update-AzManagementGroup
this is used to update supported params for teh MG.

---

### References:

[Manage your Azure subscriptions at scale with management groups](https://learn.microsoft.com/en-us/azure/governance/management-groups/manage)  

[Moving management groups and subscriptions](https://learn.microsoft.com/en-us/azure/governance/management-groups/manage#moving-management-groups-and-subscriptions)  

[New-AzManagementGroupSubscription](https://learn.microsoft.com/en-us/powershell/module/az.resources/new-azmanagementgroupsubscription?view=azps-11.4.0&viewFallbackFrom=azps-10.1.0)
Adds a Subscription to a Management Group.

[Remove-AzManagementGroupSubscription](https://learn.microsoft.com/en-us/powershell/module/az.resources/remove-azmanagementgroupsubscription?view=azps-11.4.0&viewFallbackFrom=azps-10.2.0) 
Removes a Subscription from a Management Group.

[Move subscriptions in PowerShell](Mhttps://learn.microsoft.com/en-us/azure/governance/management-groups/manage#move-subscriptions-in-powershell)  

```
New-AzManagementGroupSubscription -GroupId 'Contoso' -SubscriptionId 'GUID-NEW-SUBSCRIPTION'

# To remove the link between the subscription and the management group use
Remove-AzManagementGroupSubscription -GroupId 'Contoso' -SubscriptionId '12345678-1234-1234-1234-123456789012'
```

---

## Q38:

You manage a number of Azure subscriptions for a global organization
and have ownership of all these subscriptions.

Yuo have been asked to use PowerShell to migrate the resorces from 
`sub01` to `sub02`.

After the migration you find that all teh Azure Role Assignments for 
individual rosources have been orphaned on VMs but are still in place
for RGs.

You need to find out the cause of the missing role assignments to 
ensure that this incident does niot repeat in future migrations.

What is the cause of the problem?

- the migration was between subscriptions
- the azure portal was not used for the migration
- the user account used to move the resources to `sub02` die not have the required permissions
- there was a networ outage during the migration


---

### Answer:
- the migration was between subscriptions

In the migration of resources from one subscriptions to another
any **roles assigned directly to the resources arne not moved**.
All the role assignments must be recreated and the orhaned  assignments will be **automatically** removed.

This does not depend on whether PowerShell or the Azure Portal 
is used to perform teh migration.

The **Owner** role on source and target subscriptions is assigned 
to the user account and that was used to run the migration script 
and this role provides sufficient rights.

---

### References:

[Move Azure resources to a new resource group or subscription](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/move-resource-group-and-subscription)  

If you move a resource that has an Azure role assigned directly to the resource (or a child resource), the role assignment isn't moved and becomes orphaned. After the move, you must re-create the role assignment. Eventually, the orphaned role assignment is automatically removed, but we recommend removing the role assignment before the move.

For information about how to manage role assignments, see List Azure role assignments and Assign Azure roles.

For a move across subscriptions, the resource and its dependent resources must be located in the same resource group and they must be moved together. For example, a VM with managed disks would require the VM and the managed disks to be moved together, along with other dependent resources.

The account moving the resources must have at least the following permissions:

`Microsoft.Resources/subscriptions/resourceGroups/moveResources/action` 
on the source resource group.

`Microsoft.Resources/subscriptions/resourceGroups/write` 
on the destination resource group.

The destination subscription must be registered for the resource provider of the resource being moved. If not, you receive an error stating that the subscription is not registered for a resource type. You might see this error when moving a resource to a new subscription, but that subscription has never been used with that resource type.

...

The source and destination subscriptions must exist within the same Microsoft Entra tenant. To check that both subscriptions have the same tenant ID, use Azure PowerShell or Azure CLI.

[Transfer an Azure subscription to a different Microsoft Entra directory](https://learn.microsoft.com/en-us/azure/role-based-access-control/transfer-subscription)    


---

## Q37:

a company has an existing on-prem environment and a newly created 
Azure subscription.

You need to start testing cloud features and services with a view to eventually migrating the on-prem environment to the cloud.

You have been given **Global Administrator** rights and
**Resource Policy Contributior role** on the subscription.

You need to test Azure Policy first.

You have downloaded version 2.38 of Azuire CLI to configure new policies. 

You find that the Azure Policies you create do not work with your 
subscription.

What is the cause of the problem?
 
- you lack teh relevant role assignment to manage Azure Policy
- the version of tht Azure CLI: it must be updated
- you do niot have relevant access to the subscription
- you have not resistered the Azure Policy Insights Resource Provider

---

### Answer:
- you have not resistered the Azure Policy Insights Resource Provider

`Microsoft.PolicyInsights` must be registered in your Azure subscription. To register a resource provider, you must have permission to register resource providers. 

That permission is included in the: 
- Contributor and Owner roles.

However, you have been assigned the roles:
- **Global Administrator**
- **Resource Policy Contributior role** 

on the subscription.

Thereofore the `Microsoft.PolicyInsights` Provider must be registered  
**manually** on the subscription.

The roles that have ben assigned are sufficient to manage 
all aspect of Azure Policy on the subscription.

---

### References:

[Tutorial: Create and manage policies to enforce compliance](https://learn.microsoft.com/en-us/azure/governance/policy/tutorials/create-and-manage)   


[Quickstart: Create a policy assignment to identify non-compliant resources using Azure CL](https://learn.microsoft.com/en-us/azure/governance/policy/assign-policy-azurecli)   


---

## Q36:

Your company hosts its infrastructure as a IaaS in Azure.
You have taken over the management of the IaaS in Azure from
another IT technitian, who was responsible for creating and 
managing all resources within the tenant.

The owner of teh development subscription within the tenant
wants to block anyone from deleting ther `devtest-rg` an any 
of its resources,**without having to add any type of resource lock**
**at subscriotion level**.

You must recommend a solution to facuilitate this requirement.
You muts minimize admin effort.

What should you recommend?

- add a read-only lock on the RG
- add a delete lock on the RG
- add a delete lock on a single resource of the RG
- add a read-only lock on the subscription

---

### Answer:
- add a delete lock on the RG
This is obviously the right answer.

Refer to previous questions and answers for teh details.

---

### References:

---

## Q35:

a company hosts resources in Azure and Microsoft 365.
A storage account was recently created for the Marketing department
but it was not picked in the monlthly usage report.
Further investigation shows that no resource tags were configured
for this SA when it was created.

You need to add the resource tags to the SA to fix the problem.
Comnplete the PowerShell script accordingly.

```
$tags = @{"Dept"="Marketing","Status"="Standard"}
$resource = OPTIONS-1 - Name marketingsa -ResourceGroup ukmkrg01
OPTIONS-2 -ResourceId $resource.Id -Tag $tags
```

OPTIONS-1:
Get-AzResource
Get-AzResourceGroup
Get-AzResourceLock
New-AzResource

OPTIONS-2:
New-AzTag 
Get-AzTag 
Get-AzResource
Get-AzResourceLock

---

### Answer:

```
$tags = @{"Dept"="Marketing","Status"="Standard"}
$resource = Get-AzResource - Name marketingsa -ResourceGroup ukmkrg01
New-AzTag -ResourceId $resource.Id -Tag $tags
```

---

### References:

[New-AzTag](https://learn.microsoft.com/en-us/powershell/module/az.resources/new-aztag?view=azps-11.4.0&viewFallbackFrom=azps-8.2.0)   

> Example 5: Creates or updates the entire set of tags on a subscription

```
$Tags = @{"tagKey1"="tagValue1"; "tagKey2"="tagValue2"}
New-AzTag -ResourceId /subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx -Tag $Tags

```

---

## Q34:

A company has a Microsoft Entra Tenant.
A recent governance audit for the ME-Tenant has found that all users currently 
have the ability to create management groups within the tenant.
Tou need to enable **hierarchy protection** so that only admins can create 
managemnent groups.

You need to create a JSON script to set the relevant permission levels
to ensure that standard users are no longer allowed to create MGs.

Which ooperation do you need to set in your JSON file to meet the goal?

- Microsoft.Management/managementGroups/delete
- Microsoft.Management/managementGroups/subscriptios/write
- Microsoft.Management/managementGroups/read
- Microsoft.Management/managementGroups/write

---

### Answer:

---

### References:

[How to protect your resource hierarchy](https://learn.microsoft.com/en-us/azure/governance/management-groups/how-to/protect-resource-hierarchy)   

Settings at the root management group, such as Azure custom roles or Azure Policy policy assignments, can impact every resource in your resource hierarchy. 

It's important to protect the resource hierarchy from changes that could negatively impact all resources.

**Management groups now have hierarchy settings that enable the tenant administrator to control these behaviors.** 

> Azure RBAC permissions for hierarchy settings

Configuring any of the hierarchy settings requires the following two resource provider operations on the root management group:

```
Microsoft.Management/managementgroups/settings/write
Microsoft.Management/managementgroups/settings/read
```

These operations only allow a user to read and update 
the hierarchy settings. 
Both of these operations are available in the Azure 
**built-in role Hierarchy Settings Administrator**.
The operations don't provide any other access to the management group hierarchy or resources in the hierarchy. 

> Setting - Default management group

By allowing the default management group for new subscriptions to be defined, organization-wide governance constructs can be applied at the root management group, and a **separate management group** with **policy assignments or Azure role assignments** more suited to a new subscription can be defined.

[Setting - Require authorization](https://learn.microsoft.com/en-us/azure/governance/management-groups/how-to/protect-resource-hierarchy#setting---require-authorization)   

Any user, by default, can create new management groups within a tenant. Admins of a tenant may wish to only provide these permissions to specific users to maintain consistency and conformity in the management group hierarchy. 

If enabled, a user requires the:

`Microsoft.Management/managementGroups/write` 

operation on the root management group to create new child management groups.

---

[Quickstart: Create a management group](https://learn.microsoft.com/en-us/azure/governance/management-groups/create-management-group-portal)  

---

## Q33:

Your company is gradually moving its on-prem computing infrastructure to Azure.
Four on-prem 8-core VMs that run Windows Server 2016 DataCenter are hosted
on a computer that is being retired.
The VMs are licensed under two 16-core licences.
The servers do not get continual use but need to be available on a as-needed basis.
Windows Server 2016 DataCenter has active Software Assurance.

You plan to move three VMs to Azure VMs and the fourth to a VM on a different on-prem host.

You need to minimize costs related to teh three Azure VMs.

What should you do?

- deploy the VMs as part of a VM scale set
- use the Azure Hybrid Benefit on the VMs
- create a budget in Azure Portal
- configure Reserved Instances for th VMs

---

### Answer:
- use the Azure Hybrid Benefit on the VMs
The VMs are licensed under two 16-core licences.
This lets you run two 8-core VMs on each license either in Azure or on-prem, that is 
you can split the license into two 8-core VMs the way you prefer it.
In contrast, the **Windows Styandard License** allow to run a VM each either on-prem or Azure. (?)

The remanining options do not apply:

- configure Reserved Instances for th VMs
This is a **one-year or three-year agreemnet** and is best suited to VMs that are run continuosly.
In this case the usage is intermittent on a as-needed basis therefore a pay-as-you-go model
is preferable as it may save costs.

- deploy the VMs as part of a VM scale set
This is clearly not the use-case for VMSS.

- create a budget in Azure Portal
this has to do with cost management in the Azure Portakl and not with this specific case.


---

### References:

[Azure Hybrid Benefit Frequently Asked Questions](https://azure.microsoft.com/en-us/pricing/hybrid-benefit/#faq)  

[Azure Hybrid Benefit for Windows Server](https://learn.microsoft.com/en-us/windows-server/get-started/azure-hybrid-benefit?tabs=azure)  

Azure Hybrid Benefit enables commercial customers to use their qualifying on-premises licenses to get Windows virtual machines (VMs) on Azure at a reduced cost. 

- Windows Server VMs in Azure
Windows Server VMs on Azure: The license for Windows Server is covered by Azure Hybrid Benefit, so you only need to pay for the base compute rate of the VM. The base compute rate is equal to the Linux rate for VMs.

> Number of licenses:
You need a minimum of 8 core licenses (Datacenter or Standard edition) per VM. For example, 8 core licenses are still required if you run a 4-core instance. You may also run instances larger than 8 cores by allocating licenses equal to the core size of the instance. For example, 12 core licenses are required for a 12-core instance. For customers with processor licenses, each 2-core processor license is equivalent to 16 core licenses.

- Azure Stack HCI
- Azure Kubernetes Service (AKS) 

hybrid deployments.

To qualify for Azure Hybrid Benefit for Windows Server, you need on-premises core licenses for Windows Server from an applicable program with active Software Assurance or qualifying subscription licenses. 

Workloads using Azure Hybrid Benefit can run only during the Software Assurance or subscription license term. When the Software Assurance or subscription license term approaches expiration, you must either renew your agreement with either Software Assurance or a subscription license, disable the hybrid benefit functionality, or deprovision those workloads that are using Azure Hybrid Benefit.

---

## Q32:

Your Azure subscription has multiple RGs that host project-level resources.
All team members that usethe subscription have contributor access 
at the subscription level and are allowed to manage resources for all projects.

The `company1-network-rg` contains all the newtowr resources such as
VNets, NSGs, DNS Zones, Route Tables.

As the need arises, network admins add new DNS entries and routes 
and create additional subnets and NSGs.

You must ensure that no security member, including network admins can
delete any resources hosted in `company1-network-rg`.
The solution must provide minimal onging admin effort.

What shouuld you do?

- apply ReadOnly lock to `company1-network-rg`
- apply CanNotDelete lock to `company1-network-rg`

- create a custom role that denies delete for `company1-network-rg` and
  apply this new role to a security group and add all users to this SG.

- create a custom role that denies delete for Vnet, NSG, DNS Zones, Route Tables 
  resource types.
  apply this new role to a security group and add all users to this SG. 

---

### Answer:
- apply CanNotDelete lock to `company1-network-rg`
This is the obvious answer, any other applicable options imply much higher admin effort.

The following do not apply:

- create a custom role that denies delete for `company1-network-rg` and
  apply this new role to a security group and add all users to this SG.
This would prevent the delition of the RG but not the deletion of the resources in it!

- create a custom role that denies delete for Vnet, NSG, DNS Zones, Route Tables 
  resource types.
  apply this new role to a security group and add all users to this SG. 
Obvuously, this is not maintanable!

---

### References:


---

## Q31:

You develop a policy that will deny teh creation of any resource that 
does not have an environment tag with a value of either dev, qa, prod.

You must ensure that only resources that support tagging are subject 
to thsi policy.

Complete teh JSON policy template.

```
{
  "properties": {
    "displayName": "Tag und zugehöriger Wert für Ressourcen erforderlich",
    "policyType": "BuiltIn",
    "mode": "OPTIONS-1 : All | Indexed | Supported",
    "parameters": {
      "tagName": {
        "type": "String",        
      },
      "tagValue": {
        "type": "String",        
      }
    },
    "policyRule": {
      "if": {
        "not": {
          "field": "OPTIONS-2",
          "OPTIONS-3": "{dev. qa, prod}"
          
          //"field": "[concat('tags[', parameters('tagName'), ']')]",
          //"equals": "[parameters('tagValue')]"
        }
      },
      "then": {
        "effect": "OPTIONS-3: append | audit | deny"
        //"effect": "deny"
      }
    }
  },  
  "type": "Microsoft.Authorization/policyDefinitions",
  "name": "policyDefinition01"
}
```

OPTIONS-2:

Environment
tag:Enviroment
[tag[Enviroment]]

OPTIONS-3:

equals
notContains
notIn
---

### Answer:


```
{
  "properties": {
    "displayName": "Tag und zugehöriger Wert für Ressourcen erforderlich",
    "policyType": "BuiltIn",
    "mode": "Indexed",
    "parameters": {
      "tagName": {
        "type": "String",        
      },
      "tagValue": {
        "type": "String",        
      }
    },
    "policyRule": {
      "if": {
        "not": {
          "field": "[tag[Enviroment]]",
          "notIn": "{dev. qa, prod}"         
          
        }
      },
      "then": {
        "effect": "deny"        
      }
    }
  },  
  "type": "Microsoft.Authorization/policyDefinitions",
  "name": "policyDefinition01"
}
```

`"mode": "Indexed",`:
OPTIONS-1 : All | Indexed | Supported

The **Indexed** options for the **mode** property of the policy def is correct.
Indexed policies check whether a reosurce supports a feature before checking the 
resource for compliance with the policy.

**Supported** is a fake value that is not availbale for the **mode** property of 
the policy def is correct.

`"field": "[tag[Enviroment]]",`
OPTIONS-2:
Environment
tag:Enviroment
[tag[Enviroment]]

Tags on a resource are an array ov objects with each having a name and a value.

`"effect": "deny"`
OPTIONS-3: equals | notContains | notIn
This is obvious, you want the policy to deny the deplyment operation if any the 
agreed tags are not present or their values in not any of the "{dev. qa, prod}"

---

### References:

[Assign policy definitions for tag compliance](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/tag-policies)  

[Azure Policy definition structure](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure)  

---

## Q30:

You have a storage accounts in your Azure subscription for different purposes.
The SAs have blob containers and file shares.

Some users access these SAs by using the **Microsoft Storage Explorer Desktop App**.
They report that they get the error message in the exhibit whn they try to browse
the contents of the SA.

You must resolve teh issue.
Which are two possible reasons for this error?

- there is a CanNotDelete lock 
- there is a ReadOnly lock 
- users have the Storage Blob Data Contributor role assigned in the SAs
- users have the Read role assigned in the SAs
- users have the Storage Blob Data Read role assigned in the SAs

<img src="./Q30-exhibit.png">

---

### Answer:

- there is a ReadOnly lock 
- users have the Read role assigned in the SAs

[Considerations before applying your locks](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources?tabs=json#considerations-before-applying-your-locks)  

This reference explains that:

The **Storage Account API** exposes **data plane** and **control plane** operations. 

> If a request uses data plane operations:
the lock on the storage account doesn't protect blob, queue, table, or file data within that storage account. 

> If the request uses control plane operations: the lock protects those resources.

The user oprocess for the the **Microsoft Storage Explorer Desktop App** needs to read 
the access keys of the SA before listing the contents of the containers in it. 
The access keys of the SA provide write access to all data in the SA and there is no 
read only access key in the SA and in order to perform teh listing of the contents of
the SA the user needs **read-write** permission.

A ReadOnly lock as well as only the Read role assigned to users in the SAs would prevent
the enforcement of teh required **read-write** permission.

The rmaing optins do not apply:

- there is a CanNotDelete lock:
this lock type does not prevent read-write operations on the resource

- users have the Storage Blob Data Contributor role assigned in the SAs:
this would provide read-write permissions to the resource SA

- users have the **Storage Blob Data Read role** assigned in the SAs
this role allows users to **read and list** the SA containers and blobs!


---

### References:

[Azure built-in rolesStorage Blob Data Reader](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles/storage#storage-blob-data-reader)  

Read and list Azure Storage containers and blobs. 

---


## Q29:

Your subscription has: 

- a RGs for production env
- a RGs for testing env TST0X-rg

A user member of the RegularUsers group accidentally deletes TST01-rg & TST03-rg.

TST01-rg had a **Storage Account** named STA01.
TST02-rg had a **App Service** named APP01.

**You recover the affected resource from backups**.

You then decide to implement resource lock to prevent this from happening again.
Your manager would like teh following points implemented in order to prevent this
type of incident in the future.

- no resources can be deleted by accident
- all resource types should work correctly after implementing the resource lock
- any new resource that is added to teh subscription should be protected against deletion
- the solution should require the least admin affort

What should you do?

- consfigure a read-only lock on TST01-rg and TST02-rg
- consfigure a delete lock on TST01-rg and TST02-rg
- consfigure a read-only lock on the subscription
- consfigure a delete lock on the subscription

---

### Answer:
- consfigure a delete lock on the subscription

A delete lock can be used at the follwing levels:
- resource
- RG
- subscription

Locks are hinerited down this chain of containers.
The **delete (CanNotDelete)** lock prevents deletion of resources but does not hinder 
operations to be performed on them.

The remainign options do not apply:

The **read-only** would not be suitable in this case i.e. the RGs could not be modified
and also any resource in them.
Depending on teh resource **read-only** locks **may lead to uunpredictable outcomes**.
This is explained in details in one of the answer to a a previopus question and in the 
following reference:

[Considerations before applying your locks](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources?tabs=json#considerations-before-applying-your-locks)  

In a nutshell, the **read-only** lock **prevents POST** post operations on the 
**control level** of any resource. If the operation uses this to be perform the 
lock will prevent the operation.

---

### References:

---

## Q28:

You create a Windows Server VM in an Azure RG named `iaas-rg`.
You plan to **generalize the OS and caputure an image** for future deployments.

You must ensure that other administrators make no changes to teh VM
configuration until you complete the image capture process.
You need to enact the solution as quickly as possible.

What should you do?

- set a delete lock on the VM
- set a read-only lock on the VM
- edit RBAC permissions at the RG level
- edit RBAC permissions at the VM level

---

### Answer:
- set a read-only lock on the VM

This is obviously the quickiest way to prevent mods to the VM while
its image is captured. 
The **delete** lock would only protect from deletion of the VM and not 
modificatuions to its configuration while the **read-only** lock prevents
these.

The soltions based on RBAC require more admin effort before and after teh capture
process.


---

### References:

---

## Q27:

You are lead architect for your company's Microsoft Azure Infrastructure.
To maintain corporate compliance certifications, you must ensure that any
VM are created only in approved regions.

What should you do?

- create an Azure management group
- enforce conditional access policy in Microsoft Entra ID
- define and deply an Azure Automation Desired State Configuration (DCS)
- define and deploy a custom Azure Policy template


---

### Answer:
- define and deploy a custom Azure Policy template

The remaining options do not apply:

- create an Azure management group
- enforce conditional access policy in Microsoft Entra ID
- define and deply an Azure Automation Desired State Configuration (DCS)


---

### References:

[Tutorial: Create and manage policies to enforce compliance](https://learn.microsoft.com/en-us/azure/governance/policy/tutorials/create-and-manage)  

[What are Azure management groups?](https://learn.microsoft.com/en-us/azure/governance/management-groups/overview)  

If your **organization has many Azure subscriptions**, you may need a way to efficiently manage:

- access, policies
- compliance 

for those subscriptions.
Management groups **provide a governance scope above subscriptions**. 
You organize subscriptions into management groups; 
the governance conditions you apply cascade by inheritance to all associated subscriptions.

---

[Azure Automation State Configuration overview](https://learn.microsoft.com/en-us/azure/automation/automation-dsc-overview)  

[Understanding Azure Machine Configuration](https://learn.microsoft.com/en-us/azure/governance/machine-configuration/overview)  

[Tutorial: Create a custom policy definition](https://learn.microsoft.com/en-us/azure/governance/policy/tutorials/create-custom-policy-definition)  

Rules often enforce:
- Security practices use SSL, etc.
- Cost management i.e. use tags
- Organization-specific rules (like naming or locations)

[What is Conditional Access?](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)   

Conditional Access policies are enforced after first-factor authentication is completed.
isn't intended to be an organization's first line of defense for scenarios like denial-of-service (DoS) attacks

- Empower users to be productive wherever and whenever
- Protect the organization's assets

Conditional Access policies at their simplest are if-then statements.
if a user wants to access a resource, then they must complete an action.

> Scenarios for most organizations:

Requiring multifactor authentication for users with administrative roles
Requiring multifactor authentication for Azure management tasks
Blocking sign-ins for users attempting to use legacy authentication protocols
Requiring trusted locations for security information registration
Blocking or granting access from specific locations
Blocking risky sign-in behaviors
Requiring organization-managed devices for specific applications

>For example: 
If a user wants to access an application or service like Microsoft 365, 
then they must perform multifactor authentication to gain access.

> Signal > Decision > Enforment (Decision)
> Common signals:
- User or group membership
- IP Location information
- Device
- Applications that the user tries to access
- Real-time calculated risk detection

> Sources of signals:
- Microsoft Entra ID
- Microsoft Defender for Identity
- Microsoft Defender 
- Microsoft Endpoint Manager

> Decisions:
- Block access
Most restrictive decision

- Grant access
Less restrictive decision, can require one or more of the following options:
Require multifactor authentication
Require authentication strength
Require device to be marked as compliant
Require Microsoft Entra hybrid joined device
Require approved client app
Require app protection policy
Require password change
Require terms of use
Commonly applie

---

## Q26

You build a new Marketing solution in an Azure RG called RG1.
RG1 has an existing tag with the name Department and its value is Marketing.

You plan to use **SAzure Cloud Shell** to add another tag to RG1
with the name Status and the value Approved.

You must ensure that RG1's existing tag is preserved.

Complete the PowerShell command.

```
$tags = (Get-AzResourceGroup -Name RG1).Tags
OPTIONS-1 {"Status","Approved"}
OPTIONS-2 -Tag $tags - Name OPTIONS-3
```
```
OPTIONS-1
$tags.Add
$tags |Add

OPTIONS-2
Neew-AzTag
Set-AzResourceGroup

OPTIONS-3
RG1
$tags
```

---

### Answer:

```
$tags = (Get-AzResourceGroup -Name RG1).Tags
$tags.Add {"Status","Approved"}
Set-AzResourceGroup -Tag $tags - Name RG1 
```

---

### References:


> In one of the questions below there is a similare scenario:
```
$r = Get-AzResource -ResourceName "corpstorage99" 
-ResourceGroupName "prod-rg" 
$r.Tags.Add("Dept"."IT")
Set-AzResource -Tag $r.Tags -ResourceId $r.ResourceId -Force
```

[Set-AzResourceGroup](https://learn.microsoft.com/en-us/powershell/module/az.resources/set-azresourcegroup?view=azps-11.4.0&viewFallbackFrom=azps-2.6.0)     

[New-AzTag](https://learn.microsoft.com/en-us/powershell/module/az.resources/new-aztag?view=azps-11.4.0&viewFallbackFrom=azps-3.6.1)  

CreatePredefinedTagSet: The New-AzTag cmdlet creates a predefined Azure tag with an optional predefined value. 
You can also use it to add additional values to existing predefined tags.

> Example 1: Create a predefined tag with no value
```
New-AzTag -Name "FY2015"

Name   ValuesTable Count Values 
----   ----------- ----- ------
FY2015             0     {}
```

> Example 2: Create a predefined tag with a value

```
New-AzTag -Name "Department" -Value "Finance"

Name:   Department
Count:  0
Values:

Name        Count
        =========   =====
        Finance     0
```

> Example 3: Add a value to a predefined tag

```
New-AzTag -Name "Department" -Value "Finance"
New-AzTag -Name "Department" -Value "IT"
Name:   Department
Count:  0
Values: 
        Name        Count
        =========   =====
        Finance     0
        IT          0
```

> Example 4: Use a predefined tag
```
New-AzTag -Name "CostCenter" -Value "0001"
Get-AzResourceGroup -Tag @{Name="CostCenter"}
Set-AzResourceGroup -Name "EngineerBlog" -Tag @{Name="CostCenter";Value="0002"}
```

---

## Q25:

You have an Azure RG named RG1.
RG1 contains 12 VMs that run Windows Server or Linux.

You need to use Azure Cloud Shell to lift any resource 
locks that amy have been applied to the VMs.

How should you colplte the command:

```
$rg = "rg1"
OPTIONS-1 | OPTIONS-2 ResorceGroupName - eq "$rg" | OPTIONS-3 -Force
```

OPTIONS-1
Get-AzResource
Get-AzResourceLock

OPTIONS-2
Select-Object
Where-Object

OPTIONS-3
Remove-AzResource
Remove-AzResourceLock

---

### Answer:

```
$rg = "rg1"
Get-AzResourceLock | Where-Object ResorceGroupName - eq "$rg" | Remove-AzResourceLock -Force
```

---

### References:

[Get-AzResourceLock](https://learn.microsoft.com/en-us/powershell/module/az.resources/get-azresourcelock?view=azps-11.4.0)   

> Example 1: Get a lock
```
Get-AzResourceLock -LockName "ContosoSiteLock" -ResourceName "ContosoSite" -ResourceType "microsoft.web/sites" -ResourceGroupName "ResourceGroup11"
```
This command gets the resource lock named ContosoSiteLock.

> Example 2: Get locks at resource group level or higher
`Get-AzResourceLock -ResourceGroupName "ResourceGroup11" -AtScope`
This command gets the resource locks on the resource group or the subscription.

[Remove-AzResourceLock](https://learn.microsoft.com/en-us/powershell/module/az.resources/remove-azresourcelock?view=azps-11.4.0&viewFallbackFrom=azps-2.6.0)   

```
Remove-AzResourceLock -LockName "ContosoSiteLock" -ResourceName "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/Default-Storage-SouthCentralUS/providers/Microsoft.ClassicStorage/storageAccounts/mystorageaccount/providers/Microsoft.Authorization/locks/test"
```

[Remove-AzResource](https://learn.microsoft.com/en-us/powershell/module/az.resources/remove-azresource?view=azps-11.4.0&viewFallbackFrom=azps-5.8.0)  

---

[AZ-104 Lab - Locking Resources](https://www.udemy.com/course/microsoft-certified-azure-administrator/learn/lecture/13165368#overview)  

[AZ-104 Locks and moving resources](https://www.udemy.com/course/microsoft-certified-azure-administrator/learn/lecture/30375242#overview)  

---

[Lock your resources to protect your infrastructure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources?tabs=json#considerations-before-applying-your-locks)  

Locks only apply to **control plane Azure operations** 
and not to **data plane operations**.

Azure **control plane** operations go to: `https://management.azure.com`

Azure **data plane** operations go to your service instance, such as:
`https://myaccount.blob.core.windows.net/`

The distinction means locks protect a resource from changes, but 
they don't restrict how a resource performs its functions. 

> For example: 

 A **ReadOnly lock** on an **SQL Database logical server**, protects it from deletions or modifications. It allows you to create, update, or delete data in the server database. 
 Data plane operations allow data transactions.

[Considerations before applying your locks](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources?tabs=json#considerations-before-applying-your-locks)  

Applying locks can lead to unexpected results. 
**Locks prevent the POST method from sending data to the Azure Resource Manager (ARM) API**.

> Some common examples of blocked operations are:

Remember:

Locks on resources prevent: **control plane operation**.
Locks on resources DO NOT prevent: **data plane operation**.

**We recommend that you use a control plane operation**.

- read-only lock on a storage account:
prevents users from listing the account keys. 

A POST request handles the Azure Storage List Keys operation to protect access to the account keys. The account keys provide complete access to data in the storage account. When a read-only lock is configured for a storage account, users who don't have the account keys need to use Microsoft Entra credentials to access blob or queue data. 

A read-only lock also prevents the assignment of Azure RBAC roles that are scoped to 
the storage account or to a data container (blob container or queue).

- A read-only lock on a storage account prevents the creation of a blob container.

- A read-only lock or cannot-delete lock on a storage account
doesn't prevent its data from deletion or modification. 
It also doesn't protect the data in a blob, queue, table, or file.

> Explanation:
The Storage Account API exposes data plane and control plane operations. 
If a request uses data plane operations, the lock on the storage account 
doesn't protect blob, queue, table, or file data within that storage account. 
If the request uses control plane operations, however, the lock protects those resources.

- Example on File Share:

For example, if a request uses **File Shares - Delete**, which is a control plane operation, 
the deletion fails. 
If the request uses **Delete Share**, which is a data plane operation, the deletion succeeds. 
**We recommend that you use a control plane operation**.

- Resource Groups:
A **read-only lock on a resource group** that contains an App Service plan prevents 
you from scaling up or out of the plan. In this case the scale operation is a 
**control plane operation** and the lock prevents it even on RG underlying resources!

A **read-only lock on a resource group** that contains a virtual machine prevents 
all users from starting or restarting a virtual machine. These operations require 
a POST method request that us a **control plane operation**.

A **read-only lock on a resource group** prevents you from moving existing resources 
in or out of the resource group.

A **read-only lock on a resource group** that contains an automation account prevents 
all runbooks from starting. These operations require a POST method request.

A **cannot-delete lock on a resource or resource** group prevents the deletion of 
Azure RBAC assignments.

> Warning!
A **cannot-delete lock on a resource group** prevents Azure Resource Manager from 
automatically deleting deployments in the history. 
> If you reach 800 deployments in the history, your deployments fail.





---

[Lock your resources to protect your infrastructure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources?tabs=json)   

You can set locks that **prevent either deletions or modifications**. 
In the portal, these locks are called **Delete** and **Read-only**. 
In the command line, these locks are called **CanNotDelete** and **ReadOnly**.

> CanNotDelete 
means authorized users can read and modify a resource, but they can't delete it.

> ReadOnly 
means authorized users can read a resource, but they can't delete or update it. 
Applying this lock is similar to restricting all authorized users to the permissions
that the Reader role provides.

**Unlike RBAC**, you use management **locks to apply a restriction across all users and roles**. 

> Lock inheritance:
When you apply a lock at a parent scope, all resources within that scope inherit the same lock. 
Even resources you add later inherit the same parent lock. 
The most restrictive lock in the inheritance takes precedence.

> Understand scope of locks

---

[Get-AzResource](https://learn.microsoft.com/en-us/powershell/module/az.resources/get-azresource?view=azps-11.4.0&viewFallbackFrom=azps-5.8.0)  
`Get-AzResource | Format-Table`
`Get-AzResource -ResourceGroupName testRG | Format-Table`
`Get-AzResource -ResourceGroupName other* | Format-Table`
`Get-AzResource -Name testVM | Format-List`
`Get-AzResource -Name test* | Format-Table`  

> by resource type:
`Get-AzResource -ResourceType Microsoft.Compute/virtualMachines | Format-Table`

> by resource ID
`Get-AzResource -ResourceId /subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/testRG/providers/Microsoft.Compute/virtualMachines/testVM`

---

[Where-Object](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-7.4)  
Selects objects from a collection based on their property values.

```
# These commands are equivalent and you can use them interchangeably.
Get-Process | Where-Object -Property PriorityClass -EQ -Value "Normal"
Get-Process | Where-Object PriorityClass -EQ "Normal"

# Only the syntax is different.
Get-Service | Where-Object { $_.Status -eq "Stopped" }
Get-Service | Where-Object Status -EQ "Stopped"

Get-Process | Where-Object { $_.WorkingSet -GT 250MB }
Get-Process | Where-Object WorkingSet -GT 250MB

# rocessName property value that begins with the letter p.
Get-Process | Where-Object { $_.ProcessName -Match "^p.*" }
Get-Process | Where-Object ProcessName -Match "^p.*"
```

> Example 4: Use the comparison statement format
```
Get-Process | Where-Object -Property Handles -GE -Value 1000
Get-Process | where Handles -GE 1000
```

> Example 5: Get commands based on properties

This example shows how to write commands that return items that are 
true or false or have any value for a specified property. 

```
# Use Where-Object to get commands that have any value for the OutputType
# property of the command. This omits commands that do not have an OutputType
# property and those that have an OutputType property, but no property value.

Get-Command | Where-Object OutputType
Get-Command | Where-Object { $_.OutputType }

# Use Where-Object to get objects that are containers. This gets objects that
# have the **PSIsContainer** property with a value of $True and excludes all
# others.
Get-ChildItem | Where-Object PSIsContainer
Get-ChildItem | Where-Object { $_.PSIsContainer }

# use the -not operator (!) to get objects that are not containers.
Get-ChildItem | Where-Object -Not PSIsContainer
Get-ChildItem | Where-Object { !$_.PSIsContainer }
```

> Example 6: Use multiple conditions:
`-and,-or, -not` are valid only in script blocks!
You can't use them in the comparison statement format of a Where-Object command.

```
Get-Module -ListAvailable | Where-Object {
    ($_.Name -notlike "Microsoft*" -and $_.Name -notlike "PS*") -and $_.HelpInfoUri
}

```

---

[Select-Object](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-object?view=powershell-7.4)  
Selects objects or object properties.

```
Get-Process | Select-Object -Property ProcessName, Id, WS

# ExpandProperty : : Show the intricacies of the -ExpandProperty parameter
Get-Process Explorer |
    Select-Object -Property ProcessName -ExpandProperty Modules |
    Format-List

ProcessName       : explorer
ModuleName        : explorer.exe
FileName          : C:\WINDOWS\explorer.exe
BaseAddress       : 140697278152704
ModuleMemorySize  : 3919872
EntryPointAddress : 140697278841168
FileVersionInfo   : File:             C:\WINDOWS\explorer.exe
                    InternalName:     explorer
                    OriginalFilename: EXPLORER.EXE.MUI
                    FileVersion:      10.0.17134.1 (WinBuild.160101.0800)
                    FileDescription:  Windows Explorer
                    Product:          Microsoft Windows Operating System
                    ProductVersion:   10.0.17134.1
```

```
# Create a custom object to use for the Select-Object example.
$object = [pscustomobject]@{Name="CustomObject";Expand=@(1,2,3,4,5)}

# Use the ExpandProperty parameter to Expand the property.
$object | Select-Object -ExpandProperty Expand -Property Name

1
2
3
4
5
```

> Example 3: Select processes using the most memory (Object & Last)
`Get-Process | Sort-Object -Property WS | Select-Object -Last 5`  

> Example 4: Select unique characters from an array
```
"a","b","c","a","A","a" | Select-Object -Unique

a
b
c
A

"a","a","b","c" | Select-Object -First 2 -Unique

a

"aa", "Aa", "Bb", "bb" | Select-Object -Unique -CaseInsensitive

aa
Bb
```

> Example 7: Select newest and oldest events in the event log

```
$a = Get-WinEvent -LogName "Windows PowerShell"
$a | Select-Object -Index 0, ($a.count - 1)

> Example 8: Select all but the first object
`New-PSSession -ComputerName (Get-Content Servers.txt | Select-Object -Skip 1)`
```

> Example 11: Create custom properties on objects
demonstrates using Select-Object to add a custom property to any object. 

```
c$customObject = 1 | Select-Object -Property MyCustomProperty
$customObject.MyCustomProperty = "New Custom Property"
$customObject

MyCustomProperty
----------------
New Custom Property
```

> [Example 12: Create calculated properties for each InputObject](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-object?view=powershell-7.4#example-12-create-calculated-properties-for-each-inputobject)  


```
```

---

---

## Q24:

You deploy an application in a RG named App-RG01 in your subscription.

App-RG01 coontains the following components:

- two App Services each with a free App Service managed SSL certificate
- a peered VNet
- Redic cache deployed in the VNte
- a standard ALB

You must move all the resources in App-RG01 to a new RG named App-RG02.
For each of the following statements, select Yes or No.

- you need to delete the SSL certificate for each App Service before moving it to the new RG
- you can move the ALB only within the same subscription
- you need to disable the peer before movinng the VNet
- you can move the VNet within the same subscription


---

### Answer:

- you need to delete the SSL certificate for each App Service before moving it to the new RG
Yes

It is not possible to move an App Service that uses a **free** SSL certificate.
The SSL certificate must be deleted first, then the App Service can be moved to 
the destibnbation RG and a new free certificate can be configured with the App Service.

- you can move the ALB only within the same subscription
No
A **Satndard Load Balancer** cannot be moved einther within or outside the subscription.
The ALB must be recreated and re-configured.

- you need to disable the peer before movinng the VNet
Yes
The peering **must be disabled before THE vnET moving to teh destination RG**.
Whe a VNet is moved to a new RG then all its contanied VMs and other resources
must be moved as well.


- you can move the VNet within the same subscription
Yes
You **can move a VNet within teh same subscription**.
In this case you will also need to move the Redis cache that is a resource within the VNet.
A **Redis cache can only be moved within the same subscription**.
In this case the RG source and destination are in the same subscription therefore 
it can be done.

---

### References:

[AZ-104-Moving Resources across Resource Groups](https://www.udemy.com/course/microsoft-certified-azure-administrator/learn/lecture/19046296#overview)  

[AZ-104-Moving Resources across Subscriptions](https://www.udemy.com/course/microsoft-certified-azure-administrator/learn/lecture/23598488#overview)  

[Move Azure resources to a new resource group or subscription](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/move-resource-group-and-subscription)    

[Move App Service resources to a new resource group or subscription](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/move-limitations/app-service-move-limitations#move-with-free-managed-certificates)  

---

## Q23:

Your company has an Azure Subscription with several resources.
The subscription is managed by a Cloud Service Provider.

The accounting departemnt is currently granted the billing role.
They are able to see cost-related information.
They need to gain better understanding of the cost structure
so they can assign to the correct cost center.

You must provide cost center information.
Your soulution must minimize admin effort.

Which two actions should you perform?

- create a tag named CostCenter and assign it to each resource
- create a tag named CostCenter and assign it to each resource group
- instruct the accounting department to use the Cost Analysis blade in the subscription panel
- instruct the accounting department to use Azure Accounting Center

---

### Answer:
- create a tag named CostCenter and assign it to each resource
- create a tag named CostCenter and assign it to each resource group
 
By creating the tag on each resource the the billing role will be able 
to split and collate the costs of resources by the values assigned to this tag.

By creating the tag on each resource group the the billing role will be able 
to split and collate the costs of resources by the values assigned to this tag.

The **Azure Cost Management** tool can then be used with filters based on the
values of these tags by the users to whon the billing role has been assigned.

> Important:
The tag applied to a RG **are NOT inherited down to the contained resources**.
For this reason you must also assign the tag at the resource level and not only 
at the RG level for a complete cost split.
**You may use PowerShell . Azure CLI to automate this**.

The following do not apply:

- instruct the accounting department to use the Cost Analysis blade in the subscription panel
In this case the subscription **is managed by a cloud service provider**
therefor the accounting departemnt does not have access to this blade in the Portal! 
This could have been the simplest solution but it is not applicable here.

- instruct the accounting department to use Azure Accounting Center

[How Cost Management and Billing relate](https://learn.microsoft.com/en-us/azure/cost-management-billing/cost-management-billing-overview#how-cost-management-and-billing-relate)  

> **Cost Management**: 
is a set of FinOps tools that enable you to analyze, manage, and optimize your costs. Cost Management is available from within the Billing experience.

> **Billing**: 
provides all the tools you need to manage your billing account 
and pay invoices.

> [Cost Analysis - Quickstart: Start using Cost analysis](https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/quick-acm-cost-analysis)  

is a **tool for ad-hoc cost exploration**. 
Get quick answers with lightweight insights and analytics. Power BI is an advanced solution to build more extensive dashboards and complex reports or combine costs with other data. Power BI is available for billing accounts and billing profiles.

---

### References:

[What is Microsoft Cost Management and Billing?](https://learn.microsoft.com/en-us/azure/cost-management-billing/cost-management-billing-overview)   

[Azure Cost Management Playlist](https://www.youtube.com/playlist?list=PLLasX02E8BPBJW49E5_sHgbgvztb4oz6D)    

[New Microsoft Azure billing experienc](https://www.youtube.com/watch?v=XyY-RbTTGvk&list=PLLasX02E8BPBJW49E5_sHgbgvztb4oz6D)  


[Microsoft Cost Management and Billing -Optimize costs](https://learn.microsoft.com/en-us/azure/cost-management-billing/cost-management-billing-overview#optimize-costs)

- use free services where possible
- use the Azure Pricing Calculator
- use the Azure Advisor cost recommendations 

- use the Azure savings plans 
save you money when you have consistent usage of Azure compute resources. A savings plan can significantly reduce your resource costs by up to 65% from pay-as-you-go prices.

- use Azure reservations 
help you save up to 72% compared to pay-as-you-go rates by pre-committing to specific usage amounts for a set time duration.

- use Azure Hybrid Benefit 
helps you significantly reduce costs by using on-premises Windows Server and SQL Server licenses or RedHat and SUSE Linux subscriptions on Azure.


[Cost Management Best Practices: How to optimize your cloud investment with Cost Management](https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/cost-mgt-best-practices)  

---

## Q22:

You use **taxonomic tags** to logically organize resources and to make billing reporting easier.

You use PowerShell to append an additional tag on a storage account named corpstorage99.

```
$r = Get-AzResource -ResourceName "corpstorage99" `
-ResourceGroupName "prod-rg" 

Set-AzResource -Tag @{Dept="IT"} -ResourceId $r.ResourceId -Force
```

The code returns unexpected results.

You need to append the additional tag as quickly as possible.
What should you do?

- refactor the code by using the Azure CLI
- assign the Enforce tag and its value by Azure Policy to the resource group
- deploy the tag by using a ARM template
- edit the script to call Add() method after getting the resource to append the new tag

---

### Answer:
edit the script to call Add() method after getting the resource to append the new tag

This is the script that works:

```
$r = Get-AzResource -ResourceName "corpstorage99" `
-ResourceGroupName "prod-rg" 
$r.Tags.Add("Dept"."IT")
Set-AzResource -Tag $r.Tags -ResourceId $r.ResourceId -Force
```

> The `Set-AzResource` owirride any existing tags on the resource!

The remainign options do not apply:

- deploy the tag by using a ARM template: 
obsviously not related

- assign the Enforce tag and its value Azure Policy to the resource group:
to much admin effort

- refactor the code by using the Azure CLI:
could be used but it requires more effort than the solution above

---

### References:

[Set-AzResource](https://learn.microsoft.com/en-us/powershell/module/az.resources/set-azresource?view=azps-11.4.0&viewFallbackFrom=azps-2.6.0)   

[Use tags to organize your Azure resources and management hierarchy](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources)  

---

## Q21:

Your company requires all resources deployed in Azure to be assigned to a cost center.

You use a **tag** named **CostCenter** to assign each resource to the correct cost center.
This tag has a set of valid values assigned.

Some of the resources deployed in your subscription already have a value assigned to 
the **CostCenter** tag.

You decide to **deploy a subscription policy**  
**to verify that all resources in the subscription have a valid value assigned to the CostCenter tag**.


For each of the following statements select Yes (True) or No (False).

- The Deny effect is evaluated first
- The Append effect modifies the value of an existing field in a resource
- The Audit effect will create a warning event in the activity log for non-compliant resources
- The DeplyIfNotExist effect is only evaluated if the request executed by the 
  Resource Provider returns a success status code

---

### Answer:

> The Deny effect is evaluated first: No

The first effect of a policy to be evaluated is the **Disabled** effect.
The **Disabled** effect allows the editor of the policy to use paramter to decide
whether the policy should nto should not be evaluated.

The order fo evaluation is:

> Disable Effect > Append Effect > Deny Effect > Audit Effect

[Disabled](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/effects#disabled)
This effect is useful for testing situations or for when the policy definition has parameterized the effect. This flexibility makes it possible to disable a single assignment instead of disabling all of that policy's assignments.
Policy definitions that use the Disabled effect have the default compliance state Compliant after assignment.

An alternative to the Disabled effect is **enforcementMode**.
This is which is set on the policy assignment. 
When enforcementMode is Disabled, resources are still evaluated. 
 Logging, such as Activity logs, and the policy effect don't occur. 

[Deny](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/effects#deny)
Deny is used to prevent a resource request that doesn't match defined standards through a policy definition and fails the request.
In a **Resource Manager mode**, deny prevents the request before being sent to the Resource Provider
if there is a policy match.
**The request is returned as a 403 (Forbidden)**. 

During evaluation of existing resources, resources that match a deny policy definition are marked as non-compliant.

---

> The Append effect modifies the value of an existing field in a resource: No

[Append](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/effects#append)  

Append is used to **add** more fields to the requested resource during creation or update. 
A common example is specifying allowed IPs for a storage resource.

Append evaluates **before** the request gets processed by a Resource Provider during the
**creation or updating** of a resource. 
Append adds fields to the resource when the if condition of the policy rule is met.

> Append denies if there is a value override:
If the append effect would **override a value in the original request** with a different value, 
**then it acts as a deny effect** and rejects the request.

When a policy definition using the append effect is run as part of an evaluation cycle, it doesn't make changes to resources that already exist. Instead, it marks any resource that meets the if condition as non-compliant.

---


> The Audit effect will create a warning event in the activity log for non-compliant resources: Yes

[Audit](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/effects#audit)

Audit is used **to create a warning event in the activity log** 
when evaluating a non-compliant resource, but it doesn't stop the request.

**Audit is the last effect checked by Azure Policy** during the creation or update of a resource.

When evaluating a create or update request for a resource, Azure Policy adds a 
`Microsoft.Authorization/policies/audit/action` operation to the activity log and marks 
the resource as non-compliant. 

---

> The DeplyIfNotExist effect is only evaluated if the request executed by the Resource Provider returns a success status code: Yes

[DeployIfNotExists](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/effects#deployifnotexists)

Similar to AuditIfNotExists.

It executes a template deployment when the condition is met. 
**Nested templates are supported with deployIfNotExists, but linked templates are currently not supported**.

DeployIfNotExists **runs after a configurable delay** when a Resource Provider handles a 
create or update subscription or resource request and has returned a success status code.

A template deployment occurs if there are no related resources or if the resources defined 
by ExistenceCondition don't evaluate to true. 
The duration of the deployment depends on the complexity of resources included in the template.

**During an evaluation cycle**, policy definitions with a DeployIfNotExists effect that match
resources are marked as non-compliant, but no action is taken on that resource.

---

### References:

[Understand Azure Policy effects](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/effects)  

AddToNetworkGroup
Append
Audit
AuditIfNotExists
Deny
DenyAction
DeployIfNotExists
Disabled
Manual
Modify
Mutate

[Azure Policy Samples](https://learn.microsoft.com/en-us/azure/governance/policy/samples/)

---

---

## Q20:

You have been tasked with assigning RBAC roles to users in your company.

You try to interpret access assignments for UserA.
You want to validate teh role assignments for UserA scoped to 
the groups of which UserA is a member.

Complete the Azure CLI command below:

```
az role assignment OPTIONS-1 OPTIONS-2 \
--assignee UserA@myorg.com \
--output json \
--query `[].{principalName: principalName, roleDefinitionName: roleDefinitionName, scope: scope}` 

```

OPTIONS-1:
- create
- list
- list-changelogs
- update

OPTIONS-2:
- --all
- --include-groups
- --include-inherited
- --include-classic-administrators

---

### Answer:

OPTIONS-1:
- list

OPTIONS-2:
- --include-groups

The other options obviuosly do not apply in this case.

OPTIONS-1:
- create: to create a new role assignment for a user, group or SP
- list-changelogs: to get the changelogs of a role assignment
- update: to create a new role assignment for a user, group or SP


OPTIONS-2:
- --all: to query over the whole subscription
- --include-inherited: include the role assignments on the parent scopes
- --include-classic-administrators: for classic administrator & co-admin roles


---

### References:

[az role assignment](https://learn.microsoft.com/en-us/cli/azure/role/assignment?view=azure-cli-latest)  
[az role assignment list](https://learn.microsoft.com/en-us/cli/azure/role/assignment?view=azure-cli-latest#az-role-assignment-list)  

[List Azure role definitions](https://learn.microsoft.com/en-us/azure/role-based-access-control/role-definitions-list)  
[List Azure role assignments using Azure CLI](https://learn.microsoft.com/en-us/azure/role-based-access-control/role-assignments-list-cli)  

---

## Q19:

Your company uses RBAC to restrict access to system reources.
You have been tasked with assigning RBAC roles in your company.

You have executed the following PowerShell script:

```
New-AzRoleAssignment -ObjectId 1234567-345-567-... `
-RoleDefinition "Virtual Machine Contributor" `
-ResourceGroupNane medicine-sales
```
The output is below:

```
RoleAssignmentIs /subscription/0000-...../providers/Microsoft.Authorization/roleAssignments/666-...
Scope: /subscription/0000-.../resourceGroups/medicine-sales
DisplayName: MyTestApp
SignInName:
RoleDefinitionName: Virtual Machine Contributor
RoleDefinitionId: 99...GUID...
ObjectId: 1234567-345-567-...
ObjectType: ServicePrincipal
CanDelegate: False
```

You must implement the solution.

For each of the following statements select Yes (True) or No (False).

- The script assigns the role Virtual Machine Contributor to a user with ID: 1234567-345-567-...
- The role is assigned at the scope RG medicine-sales
- the roles lest you manage VMs, but not manage access to Virtual Network or the Storage Account
  the VMs are connected to

---

### Answer:

- The script assigns the role Virtual Machine Contributor to a user with ID: 1234567-345-567-...
No

The script assigns the role Virtual Machine Contributor to an application
with Service Principal ID: 1234567-345-567-... as the ObjectType: ServicePrincipal

- The role is assigned at the scope RG medicine-sales
Yes
There are 4 possible scopes for RBAC: 
- resource
- resource group
- subscription
- management group

In thsis case the `-ResourceGroupNane medicine-sales` specifies the RG sope.

- the roles lest you manage VMs, but not manage access to Virtual Network or the Storage Account
  the VMs are connected to
Yes

The role **Virtual Machine Contributor** provides the permisions to **manage the VMs**
**but not** the realted Newtwork and SA. 
This role allows:
- creations of VMs
- managment of VMs
- managment of Disks
- to install and run Software on the VM
- reset the pasword of the root account using Virtual Machien Extensions
- manage local user access using VME

---

### References:
[Assign Azure roles using Azure PowerShell](https://learn.microsoft.com/en-us/azure/role-based-access-control/role-assignments-powershell)    

[Azure built-in roles](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles)  

---

## Q18:

Your organization owns a subscription with three resource groups: RG1, RG2, RG3.

Your on-prem Active Directory has a security group named SalesDepartment that 
contains user accounts for all sales employees.

You use **Microsoft Entra (ID) Connect**  to synchronize 
your on-prem Active Directory with MEID.

You must implement a solution that follows the **least privilege principle** 
and meet the following requirements:

> The Sales team should:
- be able to read resources in RG1 & RG2 **only**
- be able to create resources **only** in RG1
- not be allowed to assign permissions to any resources in the subscription
- not be allowed to create additional resource groups

Which two actions should you perform?

> assign to the SalesDepartment group the built-in role:

- Reader on RG2
- Contributor on RG1
- Owner on RG1
- Reader on the subscription
- Contributor on the subscription

---

### Answer:
1. Reader on RG2
2. Contributor on RG1

(1) & (2) grant read permisson to RG1 & RG2 only.
(2) add the permission to create resources in RG1.

The remaining options do not apply as these violates at least one requirement each:

- Owner on RG1:
violates the POLP as the **Contributor** role suffices.
The **Owner role on RG1** would also give the SalesDepartment group the permission
to manage access of other users to reosurces in RG1 which is not required.

- Reader on the subscription:
the SalesDepartment group must be reader of only RG1 & RG2

- Contributor on the subscription
obviosly too wide!

---

### References:

[What is Azure role-based access control (Azure RBAC)?](https://learn.microsoft.com/en-us/azure/role-based-access-control/overview)  
---

## Q17:

You are the administrator for your Azure subscription.
Your company hires a new cloud engineer.
The cloud engineer needs to manage other engineers' access to Azure resources.
You must follow th eprinciple of least privilege.

Which role should you assign to the new engineer?

- Owner
- Contributor
- User Administrator
- Co-Administrator
- User Access Administrator

---

### Answer: User Access Administrator

Users with User Access Administrator role can:

- manage users and groups
- manage support tickets
- monitor service health

The other options do not apply in this case

> Owner:
- access to resources
- it is equal to: User Access Administrator + Contributor 

> Contributor:
- can create a manage reosurces on its scope (in this case the subscription)
- **cannot** manage user's access to resources 

> Co-Administrator:
This is one of the **old (classic) roles** and it is equivalent to: Owner of RBAC.

> User Administrator [Microsoft Entra ID Role]:
This is a **Microsoft Entra ID Administrator Role** and **does not** control access to 
any resource on a scope (subscription). This roles grants permissions to manage users
on the MEID tenant that is associated to the subscription.


---

### Reeferences:

[Azure roles, Microsoft Entra roles, and classic subscription administrator roles](https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles)   

---

## Q16: 

Your organization uses **Micorsoft Entra ID Governance**.
You are the Azure Administrator in the organization.

You use **Microsoft Graph Powershell** to provide and manage identity and access lifecycle
at a scale for all users and groups within the organization.

You have a group named Sales.
You need to grant users in the sales group the adequate level of access 
using **entitelment management**.

Your organization's policy dictates the use of the **general catalog**.

What should you do firts?

- retrieve the catalog identifier
- retrieve the resource roles assigned to the catalog
- add the sales group to the catalog
- retrieve the catalog resources 

---

### Answer: retrieve the catalog identifier

In this scenario, you are essentially managing access to resources in your organization.
You use MEID-EM with **Microsoft Graph Powershell v1.0**.
**Since the users and group already exist**, you need to initiate the process by getting 
the catalog identifier.

An **Access Package** is a collection of resources that is **governed by policies**.
**Access Packages** are defined in containered called **Catalogs**.

> You will require the ID of the (General) Catalog.

```
Get-MgBetaEnitelmentManagementAccessPackageCatalog -Filter "DisplayName eq 'General'" | Format-List
```

- step1:  retrieve the catalog identifier

The remaining options do not apply as these are the follwing steps in the same workflow:

- step2: add the sales group to the catalog
- step3: retrieve the catalog resources 
- step4: retrieve the resource roles assigned to the catalog

The **AP** assigns users to the roles of resources.
When the type of the resource in the **AP** is a (security) group then the roles that 
can be assigned are **Administrator Role** or **Member Role**. In this example the role
to be aasigned to the users that reuest the **AP** is the **Member Role** for 
the security group Sales. 

---

### References: 

[Tutorial: Manage access to resources in Microsoft Entra entitlement management using Microsoft Graph PowerShell](https://learn.microsoft.com/en-us/powershell/microsoftgraph/tutorial-entitlement-management?view=graph-powershell-1.0) 

---

[Get-MgBetaEntitlementManagementAccessPackageCatalog](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.beta.identity.governance/get-mgbetaentitlementmanagementaccesspackagecatalog?view=graph-powershell-beta)  

Retrieve the properties and relationships of an accessPackageCatalog object.

[Get-MgEntitlementManagementAccessPackageCatalog](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.identity.governance/get-mgentitlementmanagementaccesspackagecatalog?view=graph-powershell-1.0)  

Required when creating the access package. Read-only. Nullable.

[Microsoft Graph PowerShell overview](https://learn.microsoft.com/en-us/powershell/microsoftgraph/overview?view=graph-powershell-1.0)  

---

[What is entitlement management?](https://learn.microsoft.com/en-us/entra/id-governance/entitlement-management-overview)    

Entitlement management is an **identity governance feature** that enables organizations to:

- manage identity and access lifecycle at scale

by **automating**:

- access request workflows
- access assignments
- access reviews
- access expiration.

People in organizations to perform their job need access to various:

- groups
- applications
- SharePoint Online sites 

Managing this access is challenging, as requirements change.
This scenario gets more complicated when you collaborate with outside organizations.
You may not know who in the other organization needs access to your organization's 
resources, and they won't know what applications, groups, or sites your organization is using.

> Enterprise organizations challenges when managing workforce access to resources:

- Users may not know what access they should have
- If they do know they may have difficulty locating the right individuals to approve their access
- Once users find and receive access to a resource, they may hold on to access longer than is required for business purposes

> Addtional challenges for users who need access from another organization:

- No one person may know all of the specific individuals in other organization's directories to be able to invite them
- Even if they were able to invite these users, no one in that organization may remember to manage all of the users' access consistently



---

[Microsoft Entra ID Entitelment Management Playlist](https://www.youtube.com/playlist?list=PLrMImf7YaEGVPuywozMQ5MPHVWiGKEzrM)   

---

[What is Microsoft Entra entitlement management?](https://www.youtube.com/watch?v=_Lss6bFrnQ8)   

An Entitelment is a named set of access rights to a set of resources.
A user, **through a request / approval** process can be granted access to these resources **either**: 

- implicitly
- or explicitly

[How to deploy Microsoft Entra entitlement management](https://www.youtube.com/watch?v=zaaKvaaYwI4&list=PLrMImf7YaEGVPuywozMQ5MPHVWiGKEzrM&index=2)    
 
---

[Create an access package in entitlement management](https://learn.microsoft.com/en-us/entra/id-governance/entitlement-management-access-package-create)  

An access package enables you to do a **one-time setup of resources and policies** that 
**automatically** administers access for the life of the access package. 

> Catalogs for Access Packages:

- All access packages must be in a container called a catalog
- A catalog defines what resources you can add to your access package.
- If you don't specify a catalog, your access package goes in the general catalog.
- you can't move an existing access package to a different catalog.

> Management of an AP:

- An access package can be used to **assign access to roles of multiple resources** that are in the catalog.
- The Admin [**Access Package Manager**] can add resources to the catalog at creation or later
- If later users assigned to the access package will also receive the additional resources.

> ACM vs Owner:

- the **APM** **cannot** add resources that THEY own to a catalog.
- the **APM** is restricted to using the resources available in the catalog
- The **Owner** of catalog **can**  add resources to a catalog

For example, you might have a catalog owner who manages all the marketing resources 
that can be requested. In this case, you could have a marketing catalog.

The APM see only catalogs that you have permission to create access packages in. 

**To create an access package in an existing catalog** you must BE ANY OF:

- Global Administrator 
- Identity Governance Administrator 
- or must be a catalog owner 
- or access package manager in that catalog

> Who can create a catalog:

- Global Administrator 
- Identity Governance Administrator 

> AP Policies:

- All access packages must have at least one policy for users to be assigned to them. 
- When you create an access package, you can create an initial policy for:
  > users in your directory
  > users not in your directory
  > or for administrator direct assignments only

> Policies specify:

- who can request the access package
- the approval and lifecycle settings
- how access is automatically assigned

> Workflow:

1. In Identity Governance, start the process to create an access package.
2. Select the catalog where you want to put the access package and ensure that it has the necessary resources.
3. Add resource roles from resources in the catalog to your access package.
4. Specify an initial policy for users who can request access.
5. Specify approval settings and lifecycle settings in that policy.

> Changes to an AP:
You can:

-  change the hidden setting
- add or remove resource roles
- and add additional policies


---

## Q15: 

Your company has a **Microsoft Entra ID Governance** subscription.

You are assigning licenses to individual users using **group-based lisencing** in MEID.
You use **Microsoft Graph Powershell** cmdlets.

Your PowerShell script fails with a **MutuallyExclusiveVilotion** error.

You need to troubleshoot the issue.
Wht is the underlying cause for this issue?

1. There are not enough available licences for one of the products specified in the grouop.

2. One of the products specified in the group contains a service plan that conflicts with another service plan that is already assigned to the user via a different product.

3. One of the products specified in teh group is not available in all locations because of local laws and regulations.

4. One of the products specified in the goup contains a service plan that must be enabled for another service plan, in another product, to function.

---

### Answer: 
2. One of the products specified in the group contains a service plan that conflicts with another service plan that is already assigned to the user via a different product.

> using **group-based lisencing** in MEID
> assigning licenses to individual users using **group-based lisencing** in MEID.

The underlying ccause for a **MutuallyExclusiveVilotion** error is that a product that is 
specified in a group to be assigned to the user contains a service plan that is in conflict 
with the sevice plan for the same product already assigned to a user via another product
that has alredy been assigned to the user.

---

### References: 

[Identify and resolve license assignment problems for a group in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/identity/users/licensing-groups-resolve-problems)   

[Microsoft Graph PowerShell group-based licensing examples](https://learn.microsoft.com/en-us/entra/identity/users/licensing-powershell-graph-examples)  

---

## Q14: 

An international organization has an existing Micorsoft Entra Tenant that gives its 
users access to cloud-hosted applications and synchronizes with your on-premise 
Sctive Directory tenant.

Users in the London office have **hybrid user objects** and they have been assigned 
the **Microsoft Entra ID P1 licence**.

A report from the support team shows that a large number fo tickets have been raised concerning uisers who ask for their apssowrds to be changed. The organization decides to enable **self-service password reset (SSPR)** in order to reduce the number of support tickets.

You enable **SSPR** via teh Azure Portal and assign it to teh **All Users security group**. However, tickets are still being raised by users located 
in the London office.

You need to find out what causes SSPR not ot work for users located 
in the London office.

What is the correct root cause?

1. The user group does not include hybrid users
2. SSPR does not support hybrid users
3. Password writeback is not enabled
4. The London office users do not have the correct licence.  

---

### Aswer: Password writeback is not enabled

The root cause of the issue is that **Password writeback is not enabled**
to allow **hybrid users who use SSPR**.


The identity objects of the London users are hosted on the on-premise AD
which sync with Microsoft Entra ID. When a user of the London office
changes their passwordit will be updated in their on-prem AD.
**By default Microsoft Connect** syncronizes password in one direction only:
from the on-roem AD to MEID.

You must enable password writeback to allow the update of the password
in MEID from the on-prem AD, as well.

The **All Users group** contains:

- cloud-only members
- directory synchrionized members (hybrid users)
- guest users

Thsi group is automaticall created in MEID and it is ine of the 
default groups to which users within teh tenant are added when they are created.

**SSPR supports hybrid users that are synchronized from an on-prem AD**.
You must ensure that password writeback is enabled and configured in MEID.

The **Microsoft Entra ID P1 licence** or hiher is required for users to be 
able to have SSPR.

---

### References

[Tutorial: Enable users to unlock their account or reset passwords using Microsoft Entra self-service password reset](https://learn.microsoft.com/en-us/entra/identity/authentication/tutorial-enable-sspr)  

[Tutorial: Enable Microsoft Entra self-service password reset writeback to an on-premises environment](https://learn.microsoft.com/en-us/entra/identity/authentication/tutorial-enable-sspr-writeback)    


---

## Q4: Case Study

You deploy an Azure Web App namen My App.
MyApp runs in a Free Tier Service Plan named MyPlan.

During testing you discover that MyApp stops after 60 mins and
it cannot be restarted until the following day.

You need to ensure that MyApp can run eight each day during testing period.
You want to keep the additional cost to a minimum.


---

### Q4A:

Solution:
You change the Pricing Tier fir MyPlan to Shared D1.

Does this solution meet the goal?
- Yes
- No

---

### Answer: No

This solution does not meet the goal.

The Azure Service Plan on the **Free Tier does not support longer that 60 mins / day of CPU time**.
The Azure Service Plan on the **Sahred D1 Tier supports 240 mins / day of CPU time**.
Thi is 4 hours that is less than the 8 h required.

---

### Q4B:

Solution:
You change the Pricing Tier fir MyPlan to Basic B1.

Does this solution meet the goal?
- Yes
- No

---

### Answer: Yes

The Azure Service Plan on the **Basic B1 Tier supports 24 h / day of CPU time**.

---

### Q4C:

Solution:
You change the Pricing Tier fir MyPlan to Standard S1.

Does this solution meet the goal?
- Yes
- No

---

### Answer: No

The Azure Service Plan on the **Standard S1 Tier supports 24 h / day of CPU time**.
However, the requirement is to keep the additional cost for this test application to a minimum,
therefore the **Basic B1 Tier** is a better choice in this case.

---

### References:

[App Service Pricing](https://azure.microsoft.com/en-us/pricing/details/app-service/windows/)  

---

## Q3: Case Study

### Q3A:

Your company has an Azure subscription.
This includes a VNet named VNet1 with the subnets below:

| Subnet  | address prefix | Deployed Resources |
| ------------------------ | ------------------ | 
| subnet1 | 10.0.0.0/24    |  VM1 to VM4        |
| subnet2 | 10.0.1.0/24    |  VM5, VM6        |
| subnet3 | 10.0.4.0/24    |  Container group MyCon01  |

The company deploys a **new Azure Container Group** on VNet1.
The Container Instances need to communicate with VM5 and VM6.

You need to determine an appropriate location for deploying the Container Group.

### Q3A:

Solution:
You create the CG in subnet2

Does this solution meet the goal?
- Yes
- No

---

### Answer: No

This solution does not meet the goal.

It is not possible to deply a Azure Container Group to a subnet
that already contains resources!
In this case subnet2 has alreadu VM5 and VM6.

---

### Q3B:

Solution:
You create the CG in subnet3

Does this solution meet the goal?
- Yes
- No

---

### Answer: Yes

This solutions meets the goal.

You can deploy a Container Group to:

- a subnet that already hosts a contanier group
- a subnet that does not host any resource
- or have the subnet created for you when the CG is deployed to a VNet


--- 

### Q3C:

Solution:
You create a new subnet to host the container group when you create the contanier group.


Does this solution meet the goal?
- Yes
- No

---

### Answer:  Yes!!!

This solution **also** meets the requirement.

You can deploy a Container Group to:

- a subnet that already hosts a contanier group
- a subnet that does not host any resource
- or have the subnet created for you when the CG is deployed to a VNet

AND

---

### References

[Deploy container instances into an Azure virtual network](https://learn.microsoft.com/en-us/azure/container-instances/container-instances-vnet)  

> Deploy to existing virtual network
To deploy a container group to an existing virtual network:

1. Create a subnet within your existing virtual network
2. or use an existing subnet in which a container group is already deployed
3. or use an existing subnet emptied of all other resources and configuration.

> Deploy to new virtual network

[Container groups in Azure Container Instances](https://learn.microsoft.com/en-us/azure/container-instances/container-instances-container-groups)  

The top-level resource in Azure Container Instances is the container group.
A container group is a collection of containers that get scheduled on the same host machine. 
The containers in a container group share a lifecycle, resources, local network, and storage volumes.
It's similar in concept to a pod in Kubernetes.

Multi-container groups currently support only Linux containers. 
For Windows containers, Azure Container Instances only supports deployment of a single container instance. 

Here are two common ways to deploy a multi-container group: 
1. use a Resource Manager template 
2. a YAML file.

A Resource Manager template is recommended when you need to deploy additional Azure 
service resources (for example, an Azure Files share) when you deploy the container instances.

Due to the YAML format's more concise nature, a YAML file is recommended when your deployment
includes only container instances.

Azure Container Instances allocates resources such as CPUs, memory, and optionally GPUs 
(preview) to a multi-container group by adding the resource requests of the instances in the group. 
Taking CPU resources as an example, if you create a container group with two container instances,
each requesting 1 CPU, then the container group is allocated 2 CPUs

Each container instance in a group is allocated the resources specified in its resource request.

- If you don't specify a resource limit, the container instance's maximum resource usage 
  is the same as its resource request.

- If you specify a limit for a container instance, the instance's maximum usage could be greater 
  than the request, up to the limit you set. Correspondingly, resource usage by other container
  instances in the group could decrease. 
  The maximum resource limit you can set for a container instance is the total resources allocated to the group.

For example, in a group with two container instances each requesting 1 CPU, one of your 
containers might run a workload that requires more CPUs to run than the other.

In this scenario, you could set a resource limit of up to 2 CPUs for the container instance. 
This configuration allows the container instance to use up to 2 CPUs if available.

[Container groups - Networking](https://learn.microsoft.com/en-us/azure/container-instances/container-instances-container-groups#networking)    

Container groups can share an external-facing IP address, one or more ports on that IP address, 
and a DNS label with a fully qualified domain name (FQDN). 

To enable external clients to reach a container within the group, you must expose the port on 
the IP address and from the container. A container group's IP address and FQDN are released 
when the container group is deleted.

Within a container group, container instances can reach each other via localhost on any port,
even if those ports aren't exposed externally on the group's IP address or from the container.

**Optionally deploy container groups into an Azure virtual network to allow containers to** 
**communicate securely with other resources in the virtual network**.

[Quickstart: Deploy a container instance in Azure using Azure PowerShell](https://learn.microsoft.com/en-us/azure/container-instances/container-instances-quickstart-powershell)  

[Quickstart: Deploy a container instance in Azure using the Azure CLI](https://learn.microsoft.com/en-us/azure/container-instances/container-instances-quickstart)

---

## Q2: Case Study

You want to install an Internet-facing web app named WebApp1 on multiple Azure VMs.
The VMs must run **Windows Server 2019**.
Connections ot WebApp1 must be spread across all the VMs.
The **VMs must be located in separate datacenters in the same region**. 
The SLA connectivity % must be as high as possible.

### Q2A:

Solution: 
You create the VMs each in a different Availability Zone and create and configure
a standard SKU Load Balancer.

Does this solution meet the goal?
- Yes
- No

---

### Answer: Yes

This solution meets the goal.

By **deploying VMs to different availability zones in the same region** 
the SLA will be of 99.99% which is **the highest possible value in Azure**.
An **availability zone is made of several (2,3,4) datacenters**.

You also need to deploy and configure a **Standard SKU Load Balancer**.
This includes the creation of a **zone-redundant standard IP adress**.
The **zone-redundant standard IP adress** will be replicated across the 
three zones.
**The LB will be zone-redundat because the attached IP is zone-redundat**.
Only a **Standard SKU Load Balancer** offer this feature, the **Basic-SKU ALB** 
does not have this feature.

The **Standard SKU Load Balancer** will distribute the load to the backend pool VMs.

---

### Q2B:

Solution: 
You create an availability set with:
- three VMs
- three fault domains
- three update domains

and create a **Basic-SKU ALB**.

Does this solution meet the goal?
- Yes
- No

---

### Answer: No

This solution does not meet the goal.

The **SLA of VMs deployed to the same availability set is of 99.95%**.

By **deploying VMs to different availability zones in the same region** 
The SLA will be of 99.99% which is **the highest possible value in Azure** 

Importantly, when the VMs are deployed to teh same **availability set** 
they **are not** deployed to different datacenter of the same region.
This is a requirement of this case study.

Morover with a **Basic-SKU ALB** there is no SLA at all!
Only **Standard-SKU ALB** come with SLAs.

---

### Q2C:

Solution: 
You create the three VMs in a single VNet and with each VM in a different
availability zone and use **Azure Front Door**.

---

### Answer: No

This solution does not meet the goal.

**Azure Front Door** can perform load balancing **only at the global level**.

In this scenario, teh traffic must be balanced over the VMs in the same VNet
which can only span a single region, therefore **Azure Front Door** would be 
useless in this scenario.

In order to load balance over teh VMs located in the same VNet the following
would be suitable:
- an ALB
- an application GateWay

---

### Q2D:

Solution: 
You create three VMs and set the availability zone to 1 and create a 
zone-redundant load balancer.

---

### Answer: No

This solution does not meet the goal.

In order **to deploy VMs to different datacenter within the same region**
diefferent availability zone values i.e. 1,2,3 must be set for each VM.
This is also the only way through which an SLA of 99.99% can be achieved.

---

### References

[What are availability zones?](https://learn.microsoft.com/en-us/azure/reliability/availability-zones-overview?tabs=azure-cli)  

[Quickstart: Create a public load balancer to load balance VMs using the Azure portal](https://learn.microsoft.com/en-us/azure/load-balancer/quickstart-load-balancer-standard-public-portal)  

[Reliability in Load Balancer](https://learn.microsoft.com/en-us/azure/reliability/reliability-load-balancer?tabs=graph)  

[Service Level Agreements (SLA) for Online Services](https://www.microsoft.com/licensing/docs/view/Service-Level-Agreements-SLA-for-Online-Services?lang=1)    

[Create virtual machines in an availability zone using the Azure portal](https://learn.microsoft.com/en-us/azure/virtual-machines/create-portal-availability-zone?tabs=standard)  

[Availability options for Azure Virtual Machines](https://learn.microsoft.com/en-us/azure/virtual-machines/availability)  

[What is Azure Load Balancer?](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-overview)  

[What is Azure Front Door?](https://learn.microsoft.com/en-us/azure/frontdoor/front-door-overview)   

[Load-balancing options](https://learn.microsoft.com/en-us/azure/architecture/guide/technology-choices/load-balancing-overview)  

- Azure Load Balancer
- Azure Front Door
- Azure Application Gateway
- Azure Traffic Manager

[Global vs Regional Balancing](https://learn.microsoft.com/en-us/azure/architecture/guide/technology-choices/load-balancing-overview#global-vs-regional)  

- Global:

Global: These load-balancing services distribute traffic **across regional back-ends**, clouds, or hybrid on-premises services. These services route end-user traffic to the closest available back-end. They also react to changes in service reliability or performance to maximize availability and performance. You can think of them as systems that load balance between application stamps, endpoints, or scale-units hosted across different regions/geographies.

- Regional: 

These load-balancing services distribute traffic **within virtual networks** across virtual machines (VMs) **or zonal and zone-redundant service** endpoints **within a region**. 
You can think of them as systems that load balance between VMs, containers, or clusters within a region in a virtual network.


| Service                      | Global/Regional | Recommended Traffic |
| ---------------------------- | --------------- | ------------------ !
|  Azure Front Door            | G               | HTTP(S)  |
|  Azure Traffic Manager       | G               | Non-HTTP(S)  |
|  Azure Application Gateway   | R               | HTTP(S)  |
|  Azure Load Balancer         | R & G           | Non-HTTP(S)  |


- Azure Front Door:
is an application delivery network that provides global load balancing and site acceleration service for web applications. It offers Layer 7 capabilities for your application like SSL offload, path-based routing, fast failover, and caching to improve performance and high availability of your applications.

- Azure Traffic Manager
is a DNS-based traffic load balancer that enables you to distribute traffic optimally to services across global Azure regions, while providing high availability and responsiveness. Because Traffic Manager is a DNS-based load-balancing service, it load balances only at the domain level. For that reason, it can't fail over as quickly as Azure Front Door, because of common challenges around DNS caching and systems not honoring DNS TTLs.

- Azure Application Gateway
provides application delivery controller as a service, offering various Layer 7 load-balancing capabilities. Use it to optimize web farm productivity by offloading CPU-intensive SSL termination to the gateway.

- Azure Load Balancer
is a high-performance, ultra-low-latency Layer 4 load-balancing service (inbound and outbound) for all UDP and TCP protocols. It's built to handle millions of requests per second while ensuring your solution is highly available. 
**Load Balancer is zone redundant**, ensuring high availability 
**across availability zones**. 
It supports both a regional deployment topology and a cross-region topology.

---

## Q1: Case Study


You have an Azure resource group named RG1.
RG1 contains a Linux VM named VM1.

You need to automate the deplyment of 20 additional Linux VMs.
The news VMs should be **based upon** VM1's configuration.


### Q1C:

Solution: 
From the Resource Group's Policies blade, you click assign Policy.

Does this solution meet the goal?
- Yes
- No
---

### Answer: No

This solution does not meet the goal.

Azure Policy is for Governance and it makes it easier for a Azure Admin to constrain
deployments to organizational requirements. For example, an Azure Policy may be used
to impose that the deployment within a Resource Group, Management Group or Subscription
are limited to certain Geographies only.

---

### Q1B:

Solution: 
You store the Linux VM properties in a template and deploy the additional
VMs by editing the template parameter values for each additional VM.

Does this solution meet the goal?
- Yes
- No

---

### Answer: Yes

This solution meets the goal.

---

### References

---

### Q1A:

Solution: 
From the VM's Export Template seetings blade, you click Deploy 
and edit the parameters.

Does this solution meet the goal?
- Yes
- No

---

### Answer: No

This solution does not meet the goal.

Every deployment in Azure is described by a template in JSON format.
You can access the underlying template from teh Export Template settings blade of the VM resource
and can deploy a **single** new instance of a resource by modifying the template parameters.
However, in this case you need to deploy other 20 VMs by means of an aoutomated process and 
therefore this solution would not meet this requirement.


---

### References

[Deploy resources with ARM templates and Azure portal](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-portal)  

[Download the template for a VM](https://learn.microsoft.com/en-us/previous-versions/azure/virtual-machines/windows/download-template)  

[Create a Windows virtual machine from a Resource Manager template](https://learn.microsoft.com/en-us/azure/virtual-machines/windows/ps-template)  

[Quickstart: Create and deploy ARM templates by using the Azure portal](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/quickstart-create-templates-use-the-portal)   

[What is Azure Policy?](https://learn.microsoft.com/en-us/azure/governance/policy/overview)  

---