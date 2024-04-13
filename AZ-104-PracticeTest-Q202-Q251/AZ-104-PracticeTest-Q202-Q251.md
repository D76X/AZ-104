# AZ-104 Practice Test 50 Questions

[Practice Assessment for Exam AZ-104: Microsoft Azure Administrator](https://learn.microsoft.com/en-us/credentials/certifications/azure-administrator/practice/assessment?assessment-type=practice&assessmentId=21&practice-assessment-type=certification)  

---

## Q21x:

---

### Answer:

---

### References:

---

## Q210:

You have an Azure subscription that contains 200 virtual machines.

You plan to use Azure Advisor to provide cost recommendations when underutilized virtual machines are detected.

You need to ensure that all Azure admins are notified whenever an Advisor alert is generated. The solution must minimize administrative effort.

What should you configure?

Select only one answer.

an action group

an application security group

an Azure Automation account

a capacity reservation group

---

### Answer:

---

### References:

---

## Q209:

You have an Azure subscription that contains 25 virtual machines.

You need to ensure that each virtual machine is associated to a specific department for reporting purposes.

What should you use?
Select only one answer.

- administrative units
- management groups
- storage accounts
- tags

---

### Answer:
- tags

Tags are metadata elements that can be applied to Azure resources. Tags can be used for tracking resources such as virtual machines and associating each resource to a department for billing and reporting purposes.

**Administrative units** are containers used for delegating administrative roles to manage a specific portion of Microsoft Entra. **Administrative units cannot contain Azure virtual machines**.

**Management groups** are containers that can be used to manage: 
- access
- policy
- compliance 

**across multiple Azure subscriptions**.

Azure Storage accounts contain Azure Storage data objects, including blobs, file shares, queues, tables, and disks. A storage account cannot contain virtual machines.

---

### References:

[Use tags to organize your Azure resources and management hierarchy](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources?tabs=json)  

[Administrative units in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/administrative-units)  

An administrative unit is a Microsoft Entra resource that can be a container for other Microsoft Entra resources. 

An administrative unit **can contain only users, groups, or devices**.

Administrative units restrict permissions in a role to any portion of your organization that you define. 

> Example:

use administrative units **to delegate the Helpdesk Administrator role to regional support specialists**, so they can manage users only in the region that they support.

**Users can be members of multiple administrative units**.

> Example:

you might add users to administrative units by geography and division; Megan Bowen might be in the "Seattle" and "Marketing" administrative units.

> Example:

A central administrator could:

- Create an administrative unit for the School of Business
- Populate the administrative unit with only students and staff within the School of Business.
- Create a role with administrative permissions over only Microsoft Entra users in the School of Business administrative unit.
- Add the business school IT team to the role, along with its scope.

> Groups & Administrative Units:

Adding a group to an administrative unit brings the group itself into the management scope of the administrative unit, **but not the members of the group**!

In other words, an administrator scoped to the administrative unit can manage properties of the group, such as group name or membership, but they cannot manage properties of the users or devices within that group (unless those users and devices are separately added as members of the administrative unit).

> License requirements:

Using administrative units requires a `Microsoft Entra ID P1` license for each administrative unit administrator who is assigned directory roles over the scope of the administrative unit, and a `Microsoft Entra ID Free` license for each administrative unit member.

**Creating administrative units is available with a Microsoft Entra ID Free license**.

---

## Q208:

You have an Azure subscription that contains a resource group named RG1. RG1 contains a virtual machine that runs daily reports.

You need to ensure that the virtual machine shuts down when resource group costs exceed 75 percent of the allocated budget.

Which two actions should you perform? 
Each correct answer presents part of the solution.
Select all answers that apply.

- Create an action group of type Runbook, and then select Scale Up VM.
- Create an action group of type Runbook, and then select **Stop VM** as an action.
- From Cost Management + Billing, create a new cost analysis.
- From Cost Management + Billing, modify the Budgets settings.

---

### Answer:

- From Cost Management + Billing, modify the Budgets settings.
- Create an action group of type Runbook, and then select **Stop VM** as an action.

You must go to Cost Management + Billing, and then Budgets to edit the budget associated with the resource group resources. You must also create a new action group of the Runbook type, and then choose Stop VM as an action. 

The cost analysis will not stop the virtual machine from running and the Scale Up VM action group is not required.

---

### References:

[Tutorial: Create and manage budgets](https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/tutorial-acm-create-budgets?tabs=psbudget)  

---

## Q207:

You have an Azure subscription and a user named User1.

You need to assign User1 a role that allows the user to create and manage all types of resources in the subscription. 
The solution must prevent User1 from assigning roles to other users.

Which Azure role-based access control (RBAC) role should you assign to User1?

Select only one answer.

- API Management Service Contributor
- Contributor
- Owner
- Reader

---

### Answer:

- Contributor
Users with the Contributor role can create and manage all types of resources but cannot delegate new access to other users. 

Users with the Owner role provides full access to all resources, including the right to delegate access to others.

Users with the Reader role can view existing Azure resources but cannot perform any action against them. 

Users with the API Management Service Contributor role can only manage API Management services and APIs. 


---

### References:



---

## Q206:

You have an Azure subscription that contains multiple virtual machines.

You need to ensure that a user named User1 can view all the resources in a resource group named RG1. You must use the principle of least privilege.

Which role should you assign to User1?

Select only one answer.

- Billing Reader
- Contributor
- Reader
- Tag Contributor

---

### Answer:
- Reader

The Reader role allows you to view all the resources but does not allow you to make any changes. 

The Contributor role allows you to manage all the resources.

The Billing Reader role provides read access only to billing data.

The Tag Contributor role allows you to manage entity tags without providing access to the entities themselves.

---

### References:

---

## Q205:

Your Microsoft Entra tenant and on-premises Active Directory domain contain multiple users.

You need to configure self-service password reset (SSPR) password writeback functionality. 
The solution must minimize costs.

Which Microsoft Entra ID edition should you use?

Select only one answer.

- Microsoft Entra ID Free
- Microsoft Entra ID P1
- Microsoft Entra ID P2

---

### Answer:
- Microsoft Entra ID P1

Only Microsoft Entra ID P1 and P2 support SSPR, 
but Microsoft Entra ID P1 is the lower cost option.

---

### References:

[Tutorial: Enable users to unlock their account or reset passwords using Microsoft Entra self-service password reset](https://learn.microsoft.com/en-us/entra/identity/authentication/tutorial-enable-sspr)  

[Was ist Self-Service-Kennwortzurücksetzung in Microsoft Entra ID?](https://learn.microsoft.com/de-de/training/modules/allow-users-reset-their-password/2-self-service-password-reset)  

---

## Q204:

You have a Microsoft Entra tenant.
You create a new user named User1.
You need to assign a Microsoft 365 E5 license to User1.

Which user attribute should be configured for User1 before you can assign the license?

Select only one answer.

- First name
- Last name
- Other email address
- Usage location
- User type

---

### Answer:
- Usage location

**Not all Microsoft 365 services are available in all locations**. 
Before a license can be assigned to a user, you must specify the Usage location. 

The attributes of First name, Last name, Other email address, and User type are not mandatory for license assignment.

---

### References:

[Assign or remove licenses](https://learn.microsoft.com/en-us/entra/fundamentals/license-users-groups)  


---

## Q203:

You have a Microsoft Entra tenant that uses Microsoft Entra Connect to sync with an Active Directory Domain Services (AD DS) domain.

You need to ensure that users can reset their AD DS password from the Azure portal. The users must be able to use two methods to reset their password.

Which two actions should you perform? 
Each correct answer presents part of the solution.
Select all answers that apply.

- From Password reset in the Azure portal, configure the Authentication methods settings.
- From Password reset in the Azure portal, configure the Notifications settings.
- From Password reset in the Azure portal, configure the Registration settings.
- Run Microsoft Entra Connect and select Device writeback.
- Run Microsoft Entra Connect and select Password writeback.

---

### Answer:

- From Password reset in the Azure portal, configure the Authentication methods settings.

- Run Microsoft Entra Connect and select Password writeback.

You must run the Microsoft Entra Connect Wizard to enable Password writeback. You must configure the authentication option to enable the two methods required to reset a password.

---

### References:

[Tutorial: Enable Microsoft Entra self-service password reset writeback to an on-premises environment](https://learn.microsoft.com/en-us/entra/identity/authentication/tutorial-enable-sspr-writeback)  

[Implementieren der Self-Service-Kennwortzurücksetzung (SSPR) in Microsoft Entra](https://learn.microsoft.com/de-de/training/modules/allow-users-reset-their-password/3-implement-azure-ad-self-service-password-reset)  

---

## Q202:

You have a Microsoft Entra tenant named contoso.com. 
Microsoft Entra Connect is configured to sync users to the tenant.

You need to assign licenses to the users based on Microsoft Entra ID attributes. 
The solution must minimize administrative effort.

Which two actions should you perform? 
Each correct answer presents part of the solution.
Select all answers that apply.

- Assign the licenses to the dynamic groups.
- Assign the licenses to the security groups.
- Create an automatic assignment policy.
- Create dynamic groups.
- Create security groups.

---

### Answer:
- Create dynamic groups.
- Assign the licenses to the dynamic groups.

To assign licenses to users based on Microsoft Entra ID attributes, you must create a dynamic security group and configure rules based on custom attributes. **The dynamic group must be added to a license group for automatic synchronization**. 

All users in the groups will get the license automatically. 
Microsoft Entra evaluates the users in the organization that are in scope for an assignment policy rule and creates assignments for the users who don't have assignments to an access package; 
**automatic assignment policies are not used for licensing**.

---

### References:

[Assign licenses to users by group membership in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/identity/users/licensing-groups-assign)  

[Konfigurieren von Benutzer- und Gruppenkonten](https://learn.microsoft.com/de-de/training/modules/configure-user-group-accounts/)  

---