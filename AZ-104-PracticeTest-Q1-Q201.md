# AZ-104 Practice Test 201 Questions

## Q2X:


---

### Answer:

---

### References:

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

---

### References:

[What is Microsoft Cost Management and Billing?](https://learn.microsoft.com/en-us/azure/cost-management-billing/cost-management-billing-overview)   

[New Microsoft Azure billing experienc](https://www.youtube.com/watch?v=XyY-RbTTGvk&list=PLLasX02E8BPBJW49E5_sHgbgvztb4oz6D)  

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