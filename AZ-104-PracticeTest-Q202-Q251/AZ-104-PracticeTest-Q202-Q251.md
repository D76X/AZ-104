# AZ-104 Practice Test 50 Questions

[Practice Assessment for Exam AZ-104: Microsoft Azure Administrator](https://learn.microsoft.com/en-us/credentials/certifications/azure-administrator/practice/assessment?assessment-type=practice&assessmentId=21&practice-assessment-type=certification)  

---

## Q22x:

---

### Answer:

---

### References:

---

## Q228:

You have an Azure subscription that contains hundreds of virtual machines that were migrated from a local datacenter.
You need to identify which virtual machines are underutilized.
Which Azure Advisor settings should you use?

Select only one answer.

- Cost
- High Availability
- Operational Excellence
- Performance

---

### Answer:
- Cost

> The Cost blade: 
allows you to optimize and reduce your overall Azure spending. You can use this to identify the virtual machines that are underutilized. 

> The Performance blade: 
allows you to improve the speed of your applications. 

High availability is unavailable via Azure Advisor. 

Operational Excellence helps you achieve process and workflow efficiency, resource manageability, and deployment best practices.

---

### References:

[Einführung in Azure Advisor](https://learn.microsoft.com/de-de/training/modules/intro-to-azure-advisor/)  

[Introduction to Azure Advisor](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-advisor/)   

Azure Advisor is a tool that can give you 

- proactive
- actionable
- personalized 

recommendations to help you track your cloud environment and usage, and follow best practices for the five pillars of the:

[Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/).

> The pillars of WAF:

1. cost optimization
2. security
3. reliability
4. operational excellence
5. performance efficiency



---

## Q227:

You have an Azure subscription that contains a resource group named RG1. 
RG1 contains a virtual machine that runs daily reports.

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

---

## Q226:

You have an Azure subscription that contains multiple users and administrators.
You are creating a new custom role by using the following JSON.

```
{ 

  "Name": "Custom Role", 
  "Id": null, 
  "IsCustom": true, 
  "Description": "Custom Role description", 
  "Actions": [ 
    "Microsoft.Compute/*/read", 
    “Microsoft.Compute/snapshots/write”, 
    “Microsoft.Compute/snapshots/read”, 
    "Microsoft.Support/*" 
  ], 

  "NotActions": [ 
  “Microsoft.Compute/snapshots/delete” 
  ], 

  "AssignableScopes": [ 
    "/subscriptions/00000000-0000-0000-0000-000000000000", 
    "/subscriptions/11111111-1111-1111-1111-111111111111" 
  ] 
} 
```

Which three actions can be performed by a user that is assigned the custom role? 
Each correct answer presents a complete solution.
Select all answers that apply.

- Call Microsoft Support.
- Create and delete a snapshot.
- Create and read a snapshot.
- Create virtual machines.
- Read all virtual machine settings.

---

### Answer:
- Call Microsoft Support.
- Read all virtual machine settings.
- Create and read a snapshot.

---

### References:


---

## Q225:

You have an Azure subscription.

From PowerShell, you run the `Get-MgUser` cmdlet for a user and receive the following details:

```
Id: 8755b347-3545-3876-3987-999999999999
DisplayName: Ben Smith
Mail: bsmith@contoso.com
UserPrincipalName: bsmith_contoso.com#EXT#@fabrikam.com
```

Which statement accurately describes the user?
Select only one answer.

- The user account is disabled.
- The user is a guest in the tenant.
- The user is assigned an administrative role.
- The user is deleted.

---

### Answer:
- The user is a guest in the tenant.

For guest users, the user principal name (UPN) will contain the email 
of the guest user (bsmith_contoso.com) followed by `#EXT#`followed by 
the domain name of the tenant (@fabrikam.com). 

`user@gmail.com#EXT#@fabrikam.com`

Regular Microsoft Entra users appear in a format of `user@fabrikam.com`.

---

### References:

---

## Q224:

You have an Azure subscription that contains an ASP.NET application. 
The application is hosted on four Azure virtual machines that run Windows Server.

You have a load balancer named LB1 to load balances requests to the virtual machines.

You need to ensure that site users connect to the same web server for all requests made to the application.

Which two actions should you perform? 
Each correct answer presents part of the solution.
Select all answers that apply.

- Configure an inbound NAT rule.
- Set Session persistence to Client IP.
- Set Session persistence to **None**.
- Set Session persistence to Protocol.
 

---

### Answer:
- Set Session persistence to Client IP.
- Set Session persistence to Protocol.

By setting Session persistence to Client IP and Protocol, you ensure that site users connect to the same web server for all requests made to the application. 

Setting Session persistence to None disables sticky sessions. 

An inbound NAT rule is used to forward traffic from a load balancer frontend to a backend pool.

---

### References:

[Azure Load Balancer distribution modes](https://learn.microsoft.com/en-us/azure/load-balancer/distribution-mode-concepts)   

Azure Load Balancer supports the following distribution modes 
for routing connections to instances in the backend pool:

> Distribution Modes:

1. Hash based

Tuples:	five-tuple
Azure portal configuration: `None (default)`
REST API:	"loadDistribution":"Default"
Result: Traffic from the same client IP routed **to any healthy instance** in the backend pool.

The five-tuple consists of: Source IP + Source port + Destination IP + Destination port + Protocol type

The algorithm provides stickiness only within a transport session. 
When the client starts a new session from the same source IP, 
the source port changes and causes the traffic to go to a different backend instance.

---

2. Session persistence: Client IP  

Tuples:	two-tuple
Azure portal configuration: `Session persistence: Client IP`
REST API:	 "loadDistribution":SourceIP
Result: Traffic from the same client IP is routed **to the same backend** instance

The two-tuple consists of: Source IP + Destination IP

Successive requests from the same client go to the same backend instance within the backend pool.

---

3. Session persistence: Client IP and protocol

Tuples:	three-tuple
Azure portal configuration: `Session persistence: Client IP and protocol`
REST API:	 "loadDistribution":SourceIPProtocol
Result: Traffic from the same client IP and protocol is routed **to the same backend** instance

The two-tuple consists of: Source IP + Source port + Destination IP

Successive requests from the same client IP address **and protocol** combination are handled by the same backend instance.

> Use Cases: 

1. Remote Desktop Gateway
Source IP affinity with client IP and protocol solves an incompatibility between 
Azure Load Balancer and Remote Desktop Gateway (RD Gateway).

2. Media Upload
The data upload happens through UDP, but the control plane is achieved through TCP.

There are two phases:

- Phase 1:
A client starts a TCP session to the load-balanced public address and 
is directed to a specific DIP. 
The channel is left active to monitor the connection health.

- Phase 2:
A new UDP session **from the same client computer** is started **to the same load-balanced public endpoint**. 
The connection is directed to the same DIP endpoint as the previous TCP connection. 
**The media upload can be executed at high throughput while maintaining a control channel through TCP**.

> Note 1: adding or removing VMs from a backend pool

When Load Balancer backend pool members change either by removing or adding a virtual machine, 
the distribution of client requests is recomputed. 
You can't depend on new connections from existing clients to end up at the same server. 

> Note 2: uneven load distribution due to session affinity and proxies

Additionally, using source IP affinity distribution mode can cause an uneven distribution of traffic. 
Clients that run behind proxies might be seen as one unique client application.

---


[Verteilungsmodi von Azure Load Balancer](https://learn.microsoft.com/de-de/azure/load-balancer/distribution-mode-concepts)   

---

## Q223:

Your company plans to migrate servers from on-premises to Azure. There will be dev, test, and production virtual machines on a single virtual network.

You need to restrict traffic between the dev, test, and production virtual machines to specific ports.

What should you use?

Select only one answer.

- a network security group (NSG)
- an Azure firewall
- an Azure load balancer
- an Azure VPN gateway

---

### Answer:
- a network security group (NSG)

Must configure network security group (NSG) rules to allow TCP or ICMP traffic for specific ports. 

**Azure Firewall**: is a managed service that protects your Azure services across multiple virtual networks. 

**Load balancers**: are used to distribute incoming traffic to available backend servers. 

**Azure VPN**: is used to have a connection establishment between on-premises and Azure.

---

### References:


---

## Q222:

You have three network security groups (NSGs) named NSG1, NSG2, and NSG3. Port 80 is blocked in NSG3 and allowed in NSG1 and NSG2.

You have four Azure virtual machines that have the following configurations:

VM1:

Subnet: Subnet1
Network card: NIC1
NIC1 is assigned to NSG2.

VM2:

Subnet: Subnet1
Network card: NIC2
NIC2 is assigned to NSG3.

VM3:

Subnet: Subnet3
Network card: NIC3
NIC3 is assigned to NSG3.
VM4:

Subnet: Subnet2
You have the following subnets:

Subnet1 is assigned to NSG1.
Subnet2 is assigned to NSG3.
Subnet 3 does not have an NSG assigned.

Which virtual machine will allow traffic from the internet on port 80?

Select only one answer.

- VM1
- VM2
- VM3
- VM4
 

---

### Answer:
- VM1

On VM1, both NSGs assigned to Subnet1 and the NIC1 card allow traffic on port 80. 

On VM2, NSG1 allows traffic, but NSG3 blocks traffic for the network interface. 

On VM3 and VM4, NSG3 blocks traffic.

---

### References:

---

## Q221:

You have a virtual machine named VM1 that is assigned to a network security group (NSG) named NSG1.

NSG1 has the following outbound security rules:

Rule1:

Priority: 900
Name: BlockInternet
Port: 80
Protocol: TCP
Source: Any
Destination: Any
Action: Block


Rule2:

Priority: 1000
Name: AllowInternet
Port: 80
Protocol: TCP
Source: Any
Destination: Any
Action: Allow

You need to ensure that internet access to VM1 on port 80 is allowed.

What should you do?
Select only one answer.

- Change the action of Rule2.
- Change the name of Rule1.
- Change the priority of Rule2.
- Change the source of Rule 2.

---

### Answer:
- Change the priority of Rule2.

Rule1 has higher priority, so the action will be blocked. You can increase the priority of Rule2, decrease the priority of Rule1, or change the action of Rule1 to achieve the goal.

---

### References:

[Konfigurieren von Netzwerksicherheitsgruppen](https://learn.microsoft.com/de-de/training/modules/configure-network-security-groups/)

---

## Q220:

You have an Azure subscription that contains network security groups (NSGs).

Which two resources can be associated with a NSG? 
Each correct answer presents a complete solution.
Select all answers that apply.

- Azure Monitor
- Azure Network Watcher
- network interfaces
- subnets

---

### Answer:
- network interfaces
- subnets

You can use a network security group (NSG) to be assigned to a network interface. NSGs can be associated with subnets or individual virtual machine instances within that subnet. When an NSG is associated with a subnet, the access control list (ACL) rules apply to all virtual machine instances of that subnet.

---

### References:

[Konfigurieren von Netzwerksicherheitsgruppen](https://learn.microsoft.com/de-de/training/modules/configure-network-security-groups/)

---

## Q219:


You have an Azure subscription that contains an Azure container app named cont1.
You plan to add scaling rules to cont1.
You need to ensure that cont1 replicas are created based on received messages in Azure Service Bus.

Which scale trigger should you use?

Select only one answer.

- CPU usage
- event-driven
- HTTP traffic
- memory usage

---

### Answer:
- event-driven

Azure Container Apps allows a set of triggers to create new instances, called replicas. For Azure Service Bus, an event-driven trigger can be used to run the escalation method. 

The remaining scale triggers cannot use a scale rule based on messages in an Azure service bus.

---

### References:

[Set scaling rules in Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/scale-app?pivots=azure-cli)  

Azure Container Apps manages automatic horizontal scaling through a set of declarative scaling rules. 

Rules are the criteria used by Container Apps to decide when to add or remove replicas.

> Scale rules:

- HTTP: Based on the number of concurrent HTTP requests to your revision.

you have control over the threshold of concurrent HTTP requests that determines how your container app revision scales. 
**Every 15 seconds**, the number of concurrent requests is calculated as the number of requests in the past 15 seconds divided by 15

- TCP: Based on the number of concurrent TCP connections to your revision.

With a TCP scaling rule, you have control over the threshold of concurrent TCP connections that determines how your app scales. 

- Custom: Based on CPU, memory, 
or supported event-driven data sources such as:
Azure Service Bus
Azure Event Hubs
Apache Kafka
Redis

> Event-driven jobs:

Event-driven jobs are triggered by events from supported custom scalers. Examples of event-driven jobs include:


---

## Q218:

Your development team plans to deploy an Azure container instance. 
The container needs a persistent storage layer.

Which service should you use?
Select only one answer.

- Azure Blob storage
- Azure Files
- Azure Queue Storage
- Azure SQL Database

---

### Answer:
- Azure Files

You can persist data for Azure Container Instances with the use of Azure Files. Azure Files offers fully managed file shares hosted in Azure Storage that are accessible via the industry standard Server Message Block (SMB) protocol.

---

### References:

[Mount an Azure file share in Azure Container Instances](https://learn.microsoft.com/en-us/azure/container-instances/container-instances-volume-azure-files)   

> Limitations

- You can only mount Azure Files shares to Linux containers. 
- Azure file share volume mount requires the Linux container run as root 

---

## Q217:

You have an Azure subscription that contains an Azure Storage account named vmstorageaccount1.
You create an Azure container instance named container1.
You need to configure **persistent storage** for container1.

What should you create in vmstorageaccount1?
Select only one answer.

- a blob container
- a file share
- a queue
- a table

---

### Answer:
- a file share

An Azure container instance (Docker container) can mount Azure File Storage shares as directories and use them as persistent storage.

An Azure container instance cannot mount and use as persistent storage blob containers, queues and tables.

---

### References:

[Persistent Docker volumes with Azure File Storage](https://azure.microsoft.com/de-de/blog/persistent-docker-volumes-with-azure-file-storage/)   

A standard Docker container volume is normally a directory stored on the Docker host machine. 
This makes the container dependent on the files on a particular host and thus makes it hard to migrate and scale out easily. 

With the Azure File Storage plugin, we can mount Azure File Storage shares as directories on your host’s file system and make it available to containers, **which can now all make use of the Docker volume created through the plugin**.

**Leveraging the SMB 3.0 protocol support capabilities of Azure File Storage on Linux**. This open source Docker volume plugin allows Docker containers to have data volumes stored outside the Virtual Machine and therefore makes it easy to migrate stateful containers between hosts.

---

## Q216:

Your company plans to host an application on four Azure virtual machines. **You need to ensure that at least two virtual machines are available if a single Azure datacenter fails**.

Which availability option should you select for the virtual machine?

Select only one answer.

- an availability set
- an availability zone
- scale sets

---

### Answer:
- an availability zone

To protect against datacenter level failures, and if you want connectivity to multiple machines, you must ensure that the virtual machines are deployed across various availability zones.

---

### References:

[What are availability zones?](https://learn.microsoft.com/en-us/azure/reliability/availability-zones-overview?tabs=azure-cli)  

> availability zones: 
which are separated groups of datacenters within a region.
They are close enough to have low-latency connections to other availability zones.
They're connected by a high-performance network with a round-trip latency of less than 2ms. 

However, availability zones are far enough apart to reduce the likelihood that more than one will be affected by local outages or weather. 

Availability zones have independent power, cooling, and networking infrastructure. 

---

[Availability sets overview](https://learn.microsoft.com/en-us/azure/virtual-machines/availability-set-overview)  

> What is an availability set?

Availability sets are logical groupings of VMs that reduce the chance of correlated failures bringing down related VMs at the same time.

- **Availability sets place VMs in different fault domains**. 

- When using availability sets, create two or more VMs within an availability set.

- Using two or more VMs in an availability set helps highly available applications and meets the 99.95% Azure SLA.

- Availability sets offer improved VM to VM latencies compared to availability zones, since VMs in an availability set are allocated in closer proximity. 


---

## Q215:

You have an Azure virtual network that contains two subnets named Subnet1 and Subnet2. You have a virtual machine named VM1 that is connected to Subnet1. VM1 runs Windows Server.

You need to ensure that VM1 is connected directly to both subnets.

What should you do first?
Select only one answer.

- From the Azure portal, add a network interface.
- From the Azure portal, create an IP group.
- From the Azure portal, modify the IP configurations of an existing network interface.
- Sign in to Windows Server and create a network bridge. 

---

### Answer:
- From the Azure portal, add a network interface.

**A network interface is used to connect a virtual machine to a subnet**. 

Since VM1 is connected to Subnet1, VM1 already has a network interface attached that is connected to Subnet1. To connect VM1 directly to Subnet2, you must create a new network interface that is connected to Subnet2. Next, you must attach the new network interface to VM1.

- An IP group 
is a user-defined collection of static IP addresses, ranges, and subnets. 

- A network bridge 
allows you to connect multiple existing network connection in Windows together. 

- Changing the IP configurations 
of the existing network interface results in VM1 being connected to Subnet2 but not to Subnet1.

---

### References:

---

## Q214:

You plan to deploy an Azure virtual machine based on a basic template stored in the Azure Resource Manager (ARM) library.

What can you configure during the deployment of the template?

Select only one answer.

- the disk assigned to virtual machine
- the operating system
- the resource group
- the size of virtual machine

---

### Answer:
- the resource group

When you deploy a resource by using a template, you can mention the resource group for the deployment. The resource group is a container for Azure resources and makes it easier to manage the resources.

---

### References:


---

## Q213:

You have an Azure subscription that contains a resource group named RG1.
You have an Azure Resource Manager (ARM) template for an Azure virtual machine.
You need to use PowerShell to provision a virtual machine in RG1 by using the template.

Which PowerShell cmdlet should you run?
Select only one answer.

New-AzManagementGroupDeployment
New-AzResourceGroupDeployment
`New-AzSubscriptionDeployment`
New-AzVM

---

### Answer:
New-AzResourceGroupDeployment

Virtual machines are deployed to resource groups, so you must run the New-AzResourceGroupDeployment cmdlet. 

You can deploy virtual machines to subscriptions or management groups directly, therefore, `New-AzManagementGroupDeployment` and `New-AzSubscriptionDeployment` cannot be used. 

`New-AzVM` can be used to provision a new virtual machine, 
but without using a template.

---

### References:

[Deploy resources with ARM templates and Azure PowerShell](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-powershell)  

```
New-AzResourceGroupDeployment -ResourceGroupName <resource-group-name> -TemplateFile <path-to-template>

New-AzResourceGroupDeployment -Name ExampleDeployment `
-ResourceGroupName ExampleGroup `
-TemplateFile <path-to-template>

# deploy an external template, use the -TemplateUri parameter
New-AzResourceGroupDeployment -Name remoteTemplateDeployment ` -ResourceGroupName ExampleGroup `
-TemplateUri https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.storage/storage-account-create/azuredeploy.json

```
--- 

[Subscription deployments with ARM templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-to-subscription?tabs=azure-cli)  

**New-AzSubscriptionDeployment which is an alias of the New-AzDeployment**

To simplify the management of resources, you can use an Azure Resource Manager template (ARM template) to deploy resources at the level of your Azure subscription.

For example, you can deploy:

- policies (and related) 
- Blueprints
- BlueprintsAssignments
- BlueprintsVersion
- Azure role-based access control (Azure RBAC) 
- RGs
- budgets
- Adviosor Configurations
- locks 
- tags

to your subscription.

You can also create resource groups within the subscription and deploy resources to resource groups in the subscription.

---

## Q212:

You have an Azure subscription that contains a tenant named contoso.com.

All users in contoso.com are currently able to invite external users to B2B collaboration.

You need to ensure that only members of the 
Guest Inviter, 
User Administrator, and 
Global Administrator roles can invite guest users.

What should you configure?
Select only one answer.

- Access reviews
- Conditional Access
- Cross-tenant access settings
- External collaboration settings

---

### Answer:
- External collaboration settings

External collaboration settings let you specify which roles in your organization can invite external users for B2B collaboration. These settings also include options for allowing or blocking specific domains and options for restricting which external guest users can see in your Microsoft Entra directory.

**Conditional Access** allows you to apply rules to strengthen authentication and block access to resources from unknown locations.

**Cross-tenant access settings** are used to configure collaboration with a specific Microsoft Entra organization.

**Access reviews** are not used to control who can invite guest users.

---

### References:

[Configure external collaboration settings](https://learn.microsoft.com/en-us/entra/external-id/external-collaboration-settings-configure)  

The following options are available:

- Determine guest user access: 
Microsoft Entra External ID allows you to restrict what external guest users can see in your Microsoft Entra directory. For example, you can limit guest users' view of group memberships, or allow guests to view only their own profile information.

- Specify who can invite guests: 
By default, all users in your organization, including B2B collaboration guest users, can invite external users to B2B collaboration. 
If you want to limit the ability to send invitations, you can turn invitations on or off for everyone, or limit invitations to certain roles.

- Enable guest self-service sign-up via user flows: 
For applications you build, you can create user flows that allow a user to sign up for an app and create a new guest account. You can enable the feature in your external collaboration settings, and then add a self-service sign-up user flow to your app.

- Allow or block domains: 
You can use collaboration restrictions to allow or deny invitations to the domains you specify. 

---

[Configure cross-tenant access settings for B2B collaboration](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-settings-b2b-collaboration)  

- Use External Identities cross-tenant access settings:
to manage how you collaborate with other Microsoft Entra organizations through B2B collaboration. These settings determine both the level of inbound access users in external Microsoft Entra organizations have to your resources, and the level of outbound access your users have to external organizations. 

---

## Q211:

You have an Azure subscription.

You plan to create an Azure Policy definition named Policy1.

You need to include remediation information to indicate when 
users use Microsoft Defender for Cloud Regulatory and Compliance.

To which definition section should you add remediation information for Policy1?

Select only one answer.

- metadata
- mode
- parameters
- policyRule

---

### Answer:
- metadata

You must use the `RemediationDescription` field in the `metadata` section from properties to specify a custom recommendation. 

The remaining options are Azure policies, but do not allow specific custom remediation information.

---

### References:

[Create custom security standards and recommendations in Microsoft Defender for Cloud](https://learn.microsoft.com/en-us/azure/defender-for-cloud/create-custom-recommendations?pivots=azure-portal#enhance-your-custom-recommendations-with-detailed-information)  

```
{
"properties": {
"displayName": "Security - ERvNet - AuditRGLock",
"policyType": "Custom",
"mode": "All",
"description": "Audit required resource groups lock",
"metadata": {
  "securityCenter": {
    "RemediationDescription": "Resource Group locks can be set via Azure Portal -> Resource Group -> Locks",
    "Severity": "High"
 }
},
"parameters": {
  "expressRouteLockLevel": {
    "type": "String",
    "metadata": {
      "displayName": "Lock level",
      "description": "Required lock level for ExpressRoute resource groups."
    },
    "allowedValues": [
      "CanNotDelete",
      "ReadOnly"
    ]
  }
},
"policyRule": {
  "if": {
    "field": "type",
    "equals": "Microsoft.Resources/subscriptions/resourceGroups"
  },
  "then": {
    "effect": "auditIfNotExists",
    "details": {
      "type": "Microsoft.Authorization/locks",
      "existenceCondition": {
        "field": "Microsoft.Authorization/locks/level",
        "equals": "[parameters('expressRouteLockLevel')]"
      }
    }
  }
}
}
}

```
---

## Q210:

You have an Azure subscription that contains 200 virtual machines.

You plan to use Azure Advisor to provide cost recommendations when underutilized virtual machines are detected.

You need to ensure that all Azure admins are notified whenever an Advisor alert is generated. 
The solution must minimize administrative effort.

What should you configure?
Select only one answer.

- an action group
- an application security group
- an Azure Automation account
- a capacity reservation group

---

### Answer:
- an action group

Whenever Azure Advisor detects a new recommendation for resources, an event is stored in the Azure Activity log. You can set up alerts for these events from Azure Advisor. You can select a subscription and optionally a resource group to specify the resources for which you want to receive alerts. 

You also need to create an action group that will contain all the users to be notified.

---

### References:

[Create Azure Advisor alerts on new recommendations using the Azure portal](https://learn.microsoft.com/en-us/azure/advisor/advisor-alerts-portal)  

[Verbessern der Reaktion auf Incidents mithilfe von Warnungen in Azure](https://learn.microsoft.com/de-de/training/modules/incident-response-with-alerting-on-azure/)  

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