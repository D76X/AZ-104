# AZ-104 Practice Test 201 Questions

---

## Q201:

You are an Azure admin and there are mission-critical LOB apps in a multi-region deployment.
One of these VMs hosts a critical SQL Server DB.
You want to initiate an Azure VM disaster recovery using Azure Site Recovery.
You plan to use **Azure Site Recovery High Churn** to achieve enahanced RPO Recovery Point Objective.

What does **Azure Site Recovery High Churn** use?

- permium block blod storage
- azure files
- standard general v2 storage
- Azure Elastic SAN

---

### Answer:
- permium block blod storage

**Azure Site Recovery High Churn** is an approprate to restore a Azure SLQ DB in order to reduce RTO to a minimum. In order to support HC you must use  permium block blod storage for write rates up to 100 MB/s.

HR would not work with any of the other storage options:
standard general v2 storage

---

### References:

[Azure VM Disaster Recovery - High Churn Support](https://learn.microsoft.com/en-us/azure/site-recovery/concepts-azure-to-azure-high-churn-support)   

[Premium block blob storage accounts](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-block-blob-premium)  

---

## Q200:

You back up two VMs named vm1 & vm2 to a ARS vault named vault1.
You use the same back up policy for vm1 and vm2.
Your organization support additional VMs and ARS vaults.
You are preparing how to reorganize backups through the Azure Backup Service.

You need to delete vault1.
Which three actions should you perform?

- stop the backup of vm1 and vm2
- disable the soft delete feature and delete all data
- permanently delete all the itemns in the soft delete state

- delete vm1 and vm2
- delete the backup policy

---

### Answer:

- stop the backup of vm1 and vm2:
if there is any ongoing backup teh vault cannot be deleted

- disable the soft delete feature and delete all data:
if soft deleted is still enable the data is not removed and the vault cannot be deleted with data still in it

- permanently delete all the itemns in the soft delete state:
once the vault1 does not hold nay data it can be permanently be deleted 


These are not necessary:
- delete vm1 and vm2
- delete the backup policy

---

### References:

[Delete an Azure Backup Recovery Services vault](https://learn.microsoft.com/en-us/azure/backup/backup-azure-delete-vault?tabs=portal)  

---

## Q199:

Your company Azure subscription has VMs as shown in teh exhibit.
They want to start back ups for them using Azure Recovery Services.

Wat uis the minimum number of ARS vauls required? 

<img src="./Q199-1.png">

- 1
- 2
- 3
- 4

---

### Answer:
- 2
you need one ARS vault per region!
**ARS is a regional service**.

---

### References:

---

## Q198:

your company Azure uses multiple recovery saervices vaults to store backed up data.
the company palns to use **Azure Backup reports** to help forecast cloud storage requirements and audit backup restores.

You need to configure **Azure Recovery Services vault diagnostic settings**
and specify teh target for each Azure Recovery Services vault's diagnostic data to support reporting.

Where should you target the ARS vault diagnostic data?

- send toLog Analytics
- archive to blob storage
- archive to storage accoubnt
- stream to Event Hub

---

### Answer:
- send toLog Analytics
this is the correct way of doing it!

---

### References:

[Configure Azure Backup reports](https://learn.microsoft.com/en-us/azure/backup/configure-reports?tabs=recovery-services-vaults)  

[Use diagnostics settings for Recovery Services vaults](https://learn.microsoft.com/en-us/azure/backup/backup-azure-diagnostic-events?tabs=recovery-services-vaults)  

---

## Q197:

Your company has an Azure subscription with VM1 which is backed up through Azure Backup using a custom backup policy that runs backups twice a day.

You want to create a new VM based on VM1.
You paln to restore to restore form teh Azure Portal and choose create a new VM restore type.

Does this method meet you needs?

select yes/no:

- you can create the new VM in the same RG as the source VM or a different/new RG

- you can create the new VM in the same region as teh source VM or specify a different region

- you can specify the VNet for the new VM

---

### Answer:

- you can create the new VM in the same RG as the source VM or a different/new RG
yes

- you can create the new VM in the same region as teh source VM or specify a different region
no: the VM must be created in the same region as the source VM!

- you can specify the VNet for the new VM
yes

---

### References:

---

## Q196:

Your company has an Azure subscription.
You create a Azure Recovery Service vault and configure operiod backups for your VMs based on the default policy.

How long are daily backups maintained by default?

- 7 days
- 14 days
- 30 days
- 9999 days

---

### Answer:
- 30 days

- 7 days:
this is the **minimum retention period that a user can specify for daily backups in a custom policy**, the default policy uses 30 days!

---

### References:

[Back up an Azure VM from the VM settings](https://learn.microsoft.com/en-us/azure/backup/backup-azure-vms-first-look-arm)  

[Frequently asked questions-Back up Azure VMs](https://learn.microsoft.com/en-us/azure/backup/backup-azure-vm-backup-faq)  

---

## Q195:

Your company has an Azure subscription.
You currently do not use Azure Backup.
You wanto to back up a VM named vm1 with Azure Backup.
The backup should use teh default backup policy to run daily backups.

You must identify teh cmdlet required to configure recurring backups usinf the default backup policy.

Which three cmdlet should you use?

`Register-AzResourceProvider`
`New-AzRecoveryServiceVault`
`Enable-AzRecoveryServicesBackupProtection`

`Enable-AzRecoveryServicesBackupAutoProtection`
`Set-AzRecoveryServicesBackupProperty`
`Backup-AzRecoveryServicesBackupItem`

---

### Answer:

`Register-AzResourceProvider`
`New-AzRecoveryServiceVault`
`Enable-AzRecoveryServicesBackupProtection`

This is the correct sequence.

1. registetr the provider to support Azure Backup to your subscription
2. create the Recovery Services  Vault
3. enable backups

The remaining options do not apply:

`Backup-AzRecoveryServicesBackupItem`:
used to run on-demand backups based on a backup policy

`Enable-AzRecoveryServicesBackupAutoProtection`:
allows users to automatically protect all unprotected databases!

`Set-AzRecoveryServicesBackupProperty`:
set a property of the the Recovery Services  Vault

---

### References:

[Back up a virtual machine in Azure with PowerShell](https://learn.microsoft.com/en-us/azure/backup/quick-backup-vm-powershell)   

```
Register-AzResourceProvider -ProviderNamespace "Microsoft.RecoveryServices"

New-AzRecoveryServicesVault -ResourceGroupName "myResourceGroup" -Name "myRecoveryServicesVault" -Location "WestEurope"

# Set the vault context
Get-AzRecoveryServicesVault -Name "myRecoveryServicesVault" | Set-AzRecoveryServicesVaultContext

# [OPTIONAL] Change the storage redundancy configuration (LRS/GRS) of the vault - defauklt is GRS
Get-AzRecoveryServicesVault -Name "myRecoveryServicesVault" | Set-AzRecoveryServicesBackupProperty -BackupStorageRedundancy LocallyRedundant/GeoRedundant

```

> Enable backup for an Azure VM:

```
# set the default policy

$policy = Get-AzRecoveryServicesBackupProtectionPolicy -Name "DefaultPolicy"

Enable-AzRecoveryServicesBackupProtection -ResourceGroupName "myResourceGroup" -Name "myVM" -Policy $policy

```

> Start a backup job:

```
# specify a container in the vault that holds your backup data
$backupcontainer = Get-AzRecoveryServicesBackupContainer -ContainerType "AzureVM" -FriendlyName "myVM"

# Each VM to back up is treated as an item. 
$item = Get-AzRecoveryServicesBackupItem -Container $backupcontainer -WorkloadType "AzureVM"

# run a backup for the item (in this case a VM)
Backup-AzRecoveryServicesBackupItem -Item $item

# monitor the backup job
Get-AzRecoveryservicesBackupJob
```

---

[Enable-AzRecoveryServicesBackupAutoProtection](https://learn.microsoft.com/en-us/powershell/module/az.recoveryservices/enable-azrecoveryservicesbackupautoprotection?view=azps-11.5.0&viewFallbackFrom=azps-3.7.0)  

sets up automatic protection of current and any future SQL DBs within the given instance with the supplied policy.

---

## Q194:

An IaaS VM named vm10 is backed up on an Azure Recovery Services vault.
vm10 and all of its restore points are deleted by mistake.
you need to recover vm10.

How long does vm10's data remain available for recovery?

- 14 days
- 30 days
- 90 days
- 365 days

---

### Answer:
- 14 days
Azure Recovery Services vault has soft delete by default and the data will be purged only after 14 days.

---

### References:

[Soft delete for virtual machines in Azure Backup](https://azure.microsoft.com/en-us/updates/soft-delete-virtual-machine-backup/)  


---

## Q193:

Your company has an Azure subscription.
they use Azure Backup to protect VMs.
the subscription has a VM1 with Windows Server 2019.
VM1 is part of an Availability Set and it is backed up through machine-level backup.
VM1 is mistakenly deleted.

You must restore VM1 from backup and configure it as part of the same AS.

which three actions should you perform in a sequence?

- select a restore point for vm1 in Azure Recovery Services vault
- select Restore Disks as the Restore Type and restore the data
- fetch and deploy the deployment template from the Azure Recovery vault
- manually create the VM
- select Create vm as the Restore Type and restore the data
- select Replace vm as the Restore Type and restore the data

---

### Answer:
1. select a restore point for vm1 in Azure Recovery Services vault
2. select **Restore Disks** as the **Restore Type** and restore the data
3. fetch and deploy the deployment template from the Azure Recovery vault

When a VM that was part a AS is to be restored you should use select **Restore Disks** as the type of restore operation. After the disks are restored then you can attach them to an existing VM.

The remaining options do not apply:

- manually create the VM
- select Create vm as the Restore Type and restore the data
- select Replace vm as the Restore Type and restore the data:
this is used to replace disks on an existing VM.

---

### References:

[Restore a VM with Azure CLI](https://learn.microsoft.com/en-us/azure/backup/tutorial-restore-disk)  

To restore a disk, you select a recovery point as the source for the recovery data: **the default policy creates a recovery point each day and retains them for 30 days**.

> see a list of available recovery points

```
az backup recoverypoint list --resource-group myResourceGroup `
--vault-name myRecoveryServicesVault `
--backup-management-type AzureIaasVM `
--container-name myVM `
--item-name myVM `
--query [0].name `
--output tsv
```
> Managed disk restore:

If the backed-up VM has managed disks and if the intent is to restore managed disks from the recovery point, you first provide an Azure storage account. 

**This storage account is used to store** 

1. the VM configuration and 
2. the deployment template 

that can be later used to deploy the VM from the restored disks.

you also provide a target resource group for the managed disks to be restored into.

```
az storage account create --resource-group myResourceGroup `
--name mystorageaccount `
--sku Standard_LRS
```

> Restore the disk from your recovery point:

 Replace `myRecoveryPointName` with the recovery point name you obtained in the output from the previous az backup recoverypoint list

Replace `mystorageaccount` with the name of the storage account you created in the preceding command. 

```
az backup restore restore-disks --resource-group myResourceGroup `
--vault-name myRecoveryServicesVault `
--container-name myVM `
--item-name myVM `
--storage-account mystorageaccount `
--rp-name myRecoveryPointName `
--target-resource-group targetRG
```

**If target-resource-group isn't provided, then the managed disks will be restored as unmanaged disks** o the given storage account. 

This will have significant consequences to the restore time since the time taken to restore the disks entirely depends on the given storage account. 

You'll get the benefit of **instant restore only when the target-resource-group parameter is given**.

---

> Restore disks to secondary region:

The backup data replicates to the secondary region **when you enable cross-region restore on the vault** you've protected your VMs.

Use: `--use-secondary-region` in `az backup restore restore-disks`

> Cross-zonal restore:

You can restore Azure zone pinned VMs in any availability zones of the same region.

To restore a VM to another zone, specify the `TargetZoneNumber`

```
az backup restore restore-disks
...
 --target-zone 3
```

> Fetch the deployment template:

The template isn't directly accessible since it's under a customer's storage account and the given container. We need the complete URL (along with a temporary SAS token) to access this template.

> Deploy the template to create the VM:

```
az deployment group create --resource-group ExampleGroup --template-uri $url?$token
```
--

> Restore data to virtual machine using CLI:

You can now directly restore data to original/alternate VM without performing multiple steps.

```
az backup restore restore-disks --resource-group myResourceGroup `
--vault-name myRecoveryServicesVault `
--container-name myVM `
--item-name myVM `
--restore-mode OriginalLocation `
--storage-account mystorageaccount `
--rp-name myRecoveryPointName 
```

> Restore data to a newly created VM:

```
az backup restore restore-disks \
    --resource-group myResourceGroup \
    --vault-name myRecoveryServicesVault \
    --container-name myVM \
    --item-name myVM \
    --restore-mode AlternateLocation \
    --storage-account mystorageaccount \

--target-resource-group "Target_RG" \
    --rp-name myRecoveryPointName \
    --target-vm-name "TargetVirtualMachineName" \
    --target-vnet-name "Target_VNet" \
    --target-vnet-resource-group "Target_VNet_RG" \
    --target-subnet-name "targetSubNet"
```
---

## Q192:

Your company has an Azure subscription.
You create a Azure Recovery Service Vault named rsv1.
You have VM1 deployed to the East US region.
You create a backup policy for VM1 on a recurring schedule.
At the first Back Up run the Pre-Check status displayes a warning status.

You must determine the possible causes of this warning.
Which condition would cause a warning?

- the most recent VM agent has not been installed on the VM
- vm1 is an unmanaged VM1 encrypted with BitLocker encryption keys (BEKs)
- vm1 does not have a premium storage account
- vm1 is unable to communicate with Azure Backup service

---

### Answer:
- the most recent VM agent has not been installed on the VM
The warning should provide recommendations to ensure successful backups.

The other options:

- vm1 is unable to communicate with Azure Backup service:
this would result in a **critical status** not just a warning status!

- vm1 does not have a premium storage account:
no warning status

- vm1 is an unmanaged VM1 encrypted with BitLocker encryption keys (BEKs):
no warning status, the backup of this kind of VMs is actually supported by Azure Backups.

---

### References:

[Introducing Backup Pre-Checks for Backup of Azure VMs](https://azure.microsoft.com/en-us/blog/azure-vm-backup-pre-checks/)  

- Passed: 
This state indicates that your VMs configuration is conducive for successful backups and no corrective action needs to be taken.

- Warning: 
This state indicates one or more issues in VM’s configuration that might lead to backup failures and provides recommended steps to ensure successful backups. Not having the latest VM Agent installed, for example, can cause backups to fail intermittently and falls in this class of issues.

- Critical: 
This state indicates one or more critical issues in the VM’s configuration that will lead to backup failures and provides required steps to ensure successful backups. A network issue caused due to an update to the NSG rules of a VM, for example, will fail backups as it prevents the VM from communicating with the Azure Backup service and falls in this class of issues.

[What is the Azure Backup service?](https://learn.microsoft.com/en-us/azure/backup/backup-overview)  

The Azure Backup service provides simple, secure, and cost-effective solutions to back up your data and recover it from the Microsoft Azure cloud.

> What can I back up?

- On-premises - Back up files, folders, system state WITH mars
- DPM or Azure Backup Server (MABS) agent to protect on-premises VMs
- Azure VMs Windows & Linux using backup extensions
- Azure VMs Windows & Linux files using MARS agent
- Azure Managed Disks
- Azure Files shares 
- SQL Server in Azure VMs
- SAP HANA databases in Azure VMs 
- Azure Database for PostgreSQL servers 
- Azure Blobs
- Azure Database for PostgreSQL Flexible server 
- Azure Kubernetes service

---

[An overview of Azure VM backup](https://learn.microsoft.com/en-us/azure/backup/backup-azure-vms-introduction)  

As part of the backup process, a **snapshot** is taken, and the data is transferred to the Recovery Services vault with no impact on production workloads. 

The snapshot provides different levels of consistency, as described here.

> Snapshot consistency:

- Application-consistent (ENABLED BY DEFAULT):
App-consistent backups capture memory content and pending I/O operations. App-consistent snapshots use a VSS writer (or pre/post scripts for Linux) to ensure the consistency of the app data before a backup occurs.

When you're recovering a VM with an app-consistent snapshot, the VM boots up.

There's no data corruption or loss. The apps start in a consistent state.

- File-system consistent (ENABLED BY DEFAULT):

When you're recovering a VM with a file-system consistent snapshot, the VM boots up.

File-system consistent backups provide consistency by taking a snapshot of all files at the same time.

Apps need to implement their own "fix-up" mechanism to make sure that restored data is consistent.

- Crash-consistent (opt-in):

Azure Backup also takes crash-consistent backups if the VM is not running during backup and when application/file-consistent backups fail.

Only the data that already exists on the disk at the time of the backup operation is captured and backed up; data in read/write host cache isn't captured.

**Starts with the VM boot process followed by a disk check to fix corruption errors**.

---

> Extensions on Azure VMs:

For Windows VMs, the `VMSnapshot` extension is installed.
For Linux VMs, the `VMSnapshotLinux `extension is installed.

> Encryption of Azure VM backups:

When you back up Azure VMs with Azure Backup, VMs are encrypted at rest with Storage Service Encryption (SSE). 
Azure Backup can also back up Azure VMs that are encrypted by using Azure Disk Encryption.

- BEK: BitLocker encryption keys
- KEK: Azure Key Vault key encryption keys

Azure Backup supports backup of managed and unmanaged Azure VMs encrypted with BEKs only, or with BEKs together with KEKs.

Because KEKs and BEKs are backed up, users with the necessary permissions can restore keys and secrets back to the key vault if needed. These users can also recover the encrypted VM.

**The backed-up BEKs (secrets) and KEKs (keys) are encrypted.**



---

## Q191:

Your company has an Azure subscription.
You create a Azure Recovery Service Vault named rsv1.
You back up VM1 from the East US region.
You need to restore VM1 to a different region.

To which region should you restore VM1?

- East US paired region
- Central US
- any US non-gov region
- any region outside US

---

### Answer:
- East US paired region

This scenario is that of a **Cross Regional Restore (CRR)** and can only happen between paired regions from the primary region to teh paired secondary region.

---

### References:

[Azure cross-region replication](https://learn.microsoft.com/en-us/azure/reliability/cross-region-replication-azure)  

[Create and configure a Recovery Services vault](https://learn.microsoft.com/en-us/azure/backup/backup-create-recovery-services-vault)   

---

## Q190:

Your company has two Azure subscriptions named sub1 & sub2.
You create a Recovery Service Vault named Vault1 in the Cental US region.
You configure Vault1 for Azure Backup.

you need to move Vault1 to sub2.
You want to minimize downtime and data loss during this process.

Which cmdlet should you run first?

`Move-AzResource`
`Set-AzResource`
`New-AzResource`
`Export-AzResourceGroup`


---

### Answer:
`Move-AzResource`

This command is the only command required to move the recovery vault, 
it moves a Recovery Service Vault to either:
- a different subscription
- a differen resource group within the same subscription

During the move both the source and the destination resource groups are **locked**. 
All data and backup policies are all retained and there is no need to create any resource afterwards.
This command provides the solution of minimal effort.

The other options do not apply:

`Export-AzResourceGroup`:
used to export a RG to a ARM template, it is often used to produce a ARM template from a set of resources that have already been deployed to Azure.

`New-AzResource`:
create a new resource manually

`Set-AzResource`:
set any property of an existing resource to a new valu3

---

### References:

[Move a Recovery Services vault across Azure subscriptions and resource groups](https://learn.microsoft.com/en-us/azure/backup/backup-azure-move-recovery-services-vault)    

> Prerequisites:

1. Lock of RGs
During vault move across resource groups, both the source and target resource 
groups are locked preventing the write and delete operations. 

2. Only admin subscription has the permissions to move a vault.

3. same tenant
For moving vaults across subscriptions, the target subscription must 
reside in the same tenant as the source subscription and its state must 
be enabled.

To move a vault to a different Microsoft Entra ID, see: 

[Transfer subscription to a different directory](https://learn.microsoft.com/en-us/azure/backup/backup-azure-move-recovery-services-vault) 

[Recovery Service vault FAQs](https://learn.microsoft.com/en-us/azure/backup/backup-azure-backup-faq)  

4. You must have permission to perform write operations on the target resource group.
5. The location of the Recovery Services is immutable
Moving the vault **only changes the resource group**. 
The Recovery Services vault will reside on the same location 
and it can't be changed.

6. only one RCS move per region at a time
You can move only one Recovery Services vault, per region, at a time.

7. excluded VMs
If a VM doesn't move with the Recovery Services vault across subscriptions, 
or to a new resource group, the current VM recovery points will remain 
intact in the vault until they expire.
Whether the VM is moved with the vault or not, you can always restore 
the VM from the retained backup history in the vault.

8. VMs with Azure Disk Encryption must find their HV in the same region
The Azure Disk Encryption requires that the key vault and VMs 
reside in the same Azure region and subscription.

9. Backup Policies are presenrved
Backup policies defined for the vault are retained after the vault 
moves across subscriptions or to a new resource group.

10. Types of Back Up Items that can be moved
You can only move a vault that contains any of the following types of backup items. Any backup items of types not listed below will need to be stopped and the data permanently deleted before moving the vault.

- Azure Virtual Machines
- Microsoft Azure Recovery Services (MARS) Agent
- Microsoft Azure Backup Server (MABS)
- Data Protection Manager (DPM)


11. VM and Backups in Azure Recovery Services must move together!

If you move a vault containing VM backup data, **across subscriptions**, 
you must move your VMs to the same subscription, and use the same 
target VM resource group name (as it was in old subscription) 
to continue backups.
This is obviosly the case if the ARS is moved to a new RG within 
the same subscription.

---

> Move a vault to a different Microsoft Entra ID
> Move a VM with Managed Disks

[Transfer subscription to a different directory](https://learn.microsoft.com/en-us/azure/backup/backup-azure-move-recovery-services-vault) 

When you transfer a subscription to a different Microsoft Entra directory, 
some resources are not transferred to the target directory. 

> Example:

all role assignments and custom roles in Azure role-based access control 
(Azure RBAC) are:

- **permanently deleted from the source directory** 
- and are **not** transferred to the target directory.

---

[Recovery Service vault FAQs](https://learn.microsoft.com/en-us/azure/backup/backup-azure-backup-faq)  

> There are some limits to Azure Recovery Services:

- You can create up to 500 Recovery Services vaults, per supported region of Azure Backup, per subscription. 

- You can register up to 1000 Azure Virtual machines per vault. 
- you can register up to 50 MARS agents per vault
- you can register 50 MABS servers/DPM servers to a vault.
- Protection of up to 2000 datasources/items across all workloads (such as IaaS VM, SQL, AFS)
- You can only have up to 200 policies per vault. 

> size limits for data backup:
Windows 8 or later	54,400 GB
Windows 7	1700 GB
Windows Server 2012 or later	54,400 GB
Windows Server 2008, Windows Server 2008 R2	1700 GB
Azure VM	See the support matrix for Azure VM backup

> Isolation through passphrase: 

Server data that you want to recover together should use the same passphrase
when you set up backup. 

If you want to isolate recovery to a specific server or servers, 
use a passphrase for that server or servers only. 
For example, human resources servers could use one encryption passphrase,
accounting servers another, and storage servers a third.

> Moving a Azure Recovery Service Vault:

- you can move a ARS vault to a different RG in the same subscription
- you can move a ARS vault to a different RG in a different subscription
- Backup data stored in a vault can't be moved to a different vault you must move the whole vault
- you can move a ARS vault to a new RG and accross subscription **BUT THE VAULT CANNOT CHANGE REGION!**

> Moving ARS vault to a subscription that contains a vault to a different Microsoft Entra ID

In this scenario you must keep in mind the following rule.
All role assignments and custom roles in Azure role-based access control 
(Azure RBAC) are:

- **permanently deleted from the source directory** 
- and are **not** transferred to the target directory.
- You must recreate the Managed Identity (MI) of the vault by disabling and enabling it again. 

> move a subscription that contains a Recovery Services Vault to a different tenant

Yes. Ensure that you do the following:
- If the vault uses CMK (customer managed keys), you must update the vault. 
- You must reconfigure the RBAC permissions in the subscription as the existing permissions can’t be moved

> Changing Seetings of a Azure Recovery Service Vault:

- storage replication type by default is set to geo-redundant storage (GRS)
- you configure the backup, the option to modify is in disabled state and can't be changed.

> Item Level Restore (ILR) 

- ILR is supported for Azure VMs backed up by Azure VM backup: files & folder or registry keys, etc.
- not supported for MABS  or System Center DPM

> restore data to on-prem CASE1:

If your vault contains backup of on-premises data, use the corresponding agent 
(MARS, MABS, or DPM) to restore to on-premises.

> restore data to on-prem CASE2:

**We don't support exporting data DIRECTLY from the Recovery Services vault to on-premises storage for backup of cloud workload**. 
You can restore these to the corresponding cloud resources in Azure Storage Accounts, and then move the data to on-premises.  

> Cross-Region Restore (CRR)

- If a GRS vault without CRR capability enabled:
data in the secondary region can't be accessed until Azure declares a disaster in the primary region. 
**In such a scenario, the restore happens from the secondary region**.
**When CRR is enabled, even if the primary region is up and running, you can trigger restore in the secondary region**.

> Encryption:

Is the backup data on Azure encrypted as well?
Yes it is encrypted at rest.
Microsoft doesn't decrypt the backup data at any point.

- For **on-premises backup**, encryption-at-rest is provided using the **passphrase you provide** when backing up to Azure.

- For Azure VMs, data is encrypted-at-rest using **Storage Service Encryption (SSE)**.


---

[Azure Backup MARS agent](https://learn.microsoft.com/en-us/azure/backup/install-mars-agent)  

**Microsoft Azure Recovery Services (MARS) agent**: 
back up files, folders, and system state from on-premises machines and Azure VMs.  
Those backups are stored in a Recovery Services vault in Azure.

You can run the agent:

- on on-premises Windows machines
- On Azure VMs that run Windows side by side with the Azure VM backup extension. 
The agent backs up specific files and folders on the VM.
- On a Microsoft Azure Backup Server (MABS) instance or a System Center Data Protection Manager (DPM) server. 

---

[Back up file data with MABS](https://learn.microsoft.com/en-us/azure/backup/back-up-file-data)  

[What's new in Microsoft Azure Backup Server (MABS)?](https://learn.microsoft.com/en-us/azure/backup/backup-mabs-whats-new-mabs)  

Microsoft Azure Backup Server gives you enhanced backup capabilities 
to protect VMs, files and folders, workloads, and more.

---

## Q189:

You have two Azure VMs named vm1 and vm2 runnign Windows Server 2019.
The VMs are backed up by an Azure Recovery Service vault.
A daily backup is scheduled.

A configuration file on VM1 was updated and you need to restore it to 
a version from six days ago. 
You must perform this action as quickly as possible without affecting other systems files.

Which four actions should you permorn in a sEquence?

- download and execute a PowerShell script to browse and recover files on VM1
- copy the file from the mounted volume to the VM
- mount the volume containing the file that is needed on VM2
- create a new VM
- restore the disk containing the config file
- start the file recovery process and select the recovery point of 6 days ago
- un mount the volume

---

### Answer:

1. start the file recovery process and select the recovery point of 6 days ago
2. download and execute a PowerShell script to browse and recover files on VM1
3. copy the file from the mounted volume to the VM
4. un mount the volume

---

### References:

[Recover files from Azure virtual machine backup](https://learn.microsoft.com/en-us/azure/backup/backup-azure-restore-files-from-vm)  

Restoring files and folders is available only for Azure VMs deployed using the Resource Manager model and protected to a Recovery Services vault.

- Step 1: Generate and download script to browse and recover files

- Step 2: Ensure the machine meets the requirements before executing the script:

After the script is successfully downloaded, make sure you have the right machine to execute this script. The VM where you are planning to execute the script, should not have any of the following unsupported configurations. If it does, then choose an alternate machine that meets the requirements.

You can't run the executable script on the VM with any of the following characteristics: Choose an alternate machine

 - Volumes that span multiple disks (spanned and striped volumes).
 - Fault-tolerant volumes (mirrored and RAID-5 volumes) on dynamic disks.

You can't run the downloaded executable on the same backed-up VM if the backed-up VM has Windows Storage Spaces. Choose an alternate machine.

- Step 3: OS requirements to successfully run the script..

- Step 4: Access requirements to successfully run the script

- Step 5: Running the script and identifying volumes

- Step 6: Closing the connection

After identifying the files and copying them to a local storage location, remove (or unmount) the additional drives. To unmount the drives, on the File Recovery menu in the Azure portal, select Unmount Disks.

---

[How to restore Azure VM data in Azure portal](https://learn.microsoft.com/en-us/azure/backup/backup-azure-arm-restore-vms)    

---

## Q188:


You plan to configure a backup policy as shown in the exhibit.
The exhibit defines a daily backup policy, with weekly and montly retention schedules.

<img src="./Q188-1.png">

You must understand the effect that myBackupPolicy has on the backup of VMs.

max recovery time for VMs: OPTIONS-1
Recovery Point Objective (RPO): OPTIONS-2

OPTIONS-1:
60 days 
24 weeks
24 months
30 months

OPTIONS-2: 1 day | 1 week | 1 months | 1 year

---

### Answer:

max recovery time for VMs: 24 months
Recovery Point Objective (RPO): 1 day

As shown in the exhibit the `Retention of montlhy backup point` is 
**weekly based** and set on each first Sunday of the month and each is retained for 24 months.

This is max recovery time.

- Recovery Point Objective:
Recovery point objective (RPO) is defined as the maximum amount of data – as measured by time – that can be lost after a recovery from a disaster, failure, or comparable event before data loss will exceed what is acceptable to an organization.

The backup policy in the exhibit specifies a daily backup therfore 1 day worth of data is the max amount of data that may be lost as a consequence of a disaster recovery event.

Recovery Point Objective (RPO): 1 day

---

### References:

[What is the Azure Backup service?](https://learn.microsoft.com/en-us/azure/backup/backup-overview)   

[Enable backup when you create an Azure VM](https://learn.microsoft.com/en-us/azure/backup/backup-during-vm-creation)  

---

## Q187:

Your company has web app deployed to Azure.
The web app is in three layers with three VMs per layer.
The web app has a public IP address to allow customers to access the app.

You implement the **Business Continuity Disaster Recovery (BCDR) plan** for the web app using **Azure Site Recovery**.

You have configured replication of the VMs in the Azure region that hosts your app.

You must **minimize the Recovery Time Objective (RTO)**.

Which four actions should you perform in a sequence?

- create a trafic manager profile
- create a recovery plan
- configure NSGs in the target region
- configure NSGs in the source region
- configure ExpressRoute public peering
- configure ExpressRoute private peering
- customize the plan and add a step for attaching the public IP address

---

### Answer:

1. configure NSGs in the target region
2. create a recovery plan
3. customize the plan and add a step for attaching the public IP address
4. create a trafic manager profile

1. configure NSGs in the target region
2. create a recovery plan:
Azure Site Recovery can automatically configure VNets and Subnets in the target region based on the source region. However, it cannot automatically replicate the NGs this must be done manually in the target region after the the first replication has been performed.

Then you create a recovery plan. This consists of teh tasks that are required to bring the web app back online after critical failure in teh source Azure region. 
The recovery plan is the automation of a series of tasks, one of these tasks will be the replication of all teh VMs.

3. customize the plan and add a step for attaching the public IP address

One of the steps will involve to attach a public IP address.
Azure Site Recovery does not, by default, migrate a public IP address and these kind of IP addresses cannot be retained during failover.
For this reason, you must create a new public IP address in the new region by means of an Automation Runbook.

4. create a trafic manager profile:
Traffic Manager can be setup to monitor the status of the source and target sites and in the case of failure of the source site TM **automatically redirects traffic** directed to the source IP to that of the teargt IP.
This minimize downtime.

The remaining options do not apply to this case.

- configure ExpressRoute public peering
- configure ExpressRoute private peering
this is off topic here as your app is exposed to the internet to public users.

- configure NSGs in the source region:
obviously not as there are already NSGs there.

- **Recovery Time Objective (RTO)**:
is the maximum acceptable amount of time for restoring a network or application and regaining access to data after an unplanned disruption. 
Loss of revenue and the extent to which a disrupted process impacts business continuity can both have an impact on RTO.

By utilizing Traffic Manager, you can frontload the work required for DNS updates.  No manual or scripted action is required at the time of actual failover.

This approach helps in quick switching (and hence lowering RTO) as well as avoiding costly time-consuming DNS change errors in a disaster event. With Traffic Manager, even the failback step is automated, which would otherwise have to be managed separately.

You can additionally optimize the DNS Time to Live (TTL) value for the Traffic Manager profile. TTL is the value for which a DNS entry would be cached by a client. For a record, DNS would not be queried twice within the span of TTL. Each DNS record has a TTL associated with it. Reducing this value results in more DNS queries to Traffic Manager but can reduce RTO by discovering outages faster.

---

### References:

[Set up public IP addresses after failover](https://learn.microsoft.com/en-us/azure/site-recovery/concepts-public-ip-address-with-site-recovery)  

[Network Security Groups with Azure Site Recovery](https://learn.microsoft.com/en-us/azure/site-recovery/concepts-network-security-group-with-site-recovery)  

[Azure Traffic Manager with Azure Site Recovery](https://learn.microsoft.com/en-us/azure/site-recovery/concepts-traffic-manager-with-site-recovery)   

---

[Set up public IP addresses after failover](https://learn.microsoft.com/en-us/azure/site-recovery/concepts-public-ip-address-with-site-recovery)  

Public IP addresses serve two purposes in Azure: 

1. allow **inbound communication from Internet** resources to Azure resources 

> Examples of Azure Resources that might need one or more IP addresses:

- Azure Virtual Machines (VM)
- Azure Application Gateways
- Azure Load Balancers
- Azure VPN Gateways

2. enable Azure resources **to communicate outbound to the Internet** and public-facing Azure services that have an IP address assigned to the resource

**Outbound connectivity to the Internet using a predictable IP address**.

For example: **a VM can communicate outbound to the Internet without a public IP address assigned to it!**  

However, in this case its address will be **network address translated** by Azure **to an unpredictable public address**, by default. 

Assigning a public IP address to a resource enables such a VM in this example you to know which IP address is used for the outbound connection. 

**Though predictable, the address can change, depending on the assignment method chosen**. 

> Create a public IP address:

- Dynamic: Dynamic addresses: 
IP address is associated to an Azure resource and is started for the first time. Dynamic addresses can change if a resource such as a virtual machine is stopped (deallocated) and then restarted through Azure.
The address remains the same if a virtual machine is rebooted or stopped from within the guest OS. 
When a public IP address resource is removed from a resource, the dynamic address is released.

- Static: Static addresses:  
are assigned when a public IP address is created. Static addresses aren't released until a public IP address resource is deleted.

> Public IP address assignment using Recovery Plan:

**Public IP address of the production application cannot be retained on failover**. **Workloads brought up as part of failover process must be assigned an Azure Public IP resource available in the target region**. 

This step can be done either manually or is automated with recovery plans. 

**A recovery plan** gathers machines into **recovery groups**. 
It helps you to define a systematic recovery process. 
You can use a recovery plan **to impose order, and automate the actions** needed at each step, using **Azure Automation runbooks** for failover to Azure, or scripts.

> Public endpoint switching with DNS level Routing:

Azure Traffic Manager enables DNS level routing between endpoints and can assist with driving down your RTOs for a DR scenario.

1. On-premises to Azure failover with Traffic Manager
2. Azure to Azure failover with Traffic Manager

> Traffic Manager setup:

1. Create a Traffic Manager profile.

2. Utilizing the Priority routing method, create two endpoints – Primary for source and Failover for Azure. Primary is assigned Priority 1 and Failover is assigned Priority 2.

3. The Primary endpoint can be Azure or External depending on whether your source environment is inside or outside Azure (on-prem).

4. The Failover endpoint is created as an Azure endpoint. Use a static public IP address as this will be external facing endpoint for Traffic Manager in the disaster event.

---

[Network Security Groups with Azure Site Recovery](https://learn.microsoft.com/en-us/azure/site-recovery/concepts-network-security-group-with-site-recovery)  

> Scenario 1: on-premises to Azure replication with NSG:

**Azure Site Recovery** enables disaster recovery and migration to Azure for:

- on-premises Hyper-V virtual machines
- VMware virtual machines
- and physical servers

**For all on-premises to Azure scenarios, replication data is sent to and stored in an Azure Storage account**. 

Once VMs have been created after failover to Azure, NSGs can be used to limit network traffic to the virtual network and VMs. 

**Site Recovery does not create NSGs as part of the failover operation**. 
**We recommend creating the required Azure NSGs before initiating failover**. 

You can then associate NSGs to failed over VMs **automatically during failover**, using automation scripts with Site Recovery's powerful recovery plans.

> Scenario-2: Azure to Azure replication with NSG

When enabling replication for Azure VMs, Site Recovery can create the 
replica virtual networks including subnets and gateway subnets on the target region and create the required mappings between the source and target virtual networks. 

You can also **manually pre-create** the target side networks and subnets, and use the same while enabling replication.

**Site Recovery does not create any VMs on the target Azure region prior to failover**.

For Azure VM replication, **ensure that the NSG rules on the source Azure region allow outbound connectivity for replication traffic** (to the storage account to which the VMs to backup).

Site Recovery **does not create or replicate NSGs** as part of the failover operation. **We recommend creating the required NSGs on the target Azure region before initiating failover**. 

You can then associate NSGs to failed over VMs automatically during failover, using automation scripts with Site Recovery's powerful recovery plans.

> Steps:

1. replica VNets
Site Recovery can create replicas of Contoso VNet and Contoso Subnet on the target Azure region when replication is enabled for the VM.

2. replica Subnets NGSs & VM NGSs
You can create the desired replicas of Subnet NSG and VM NSG (named, for example, Target Subnet NSG and Target VM NSG, respectively) on the target Azure region, allowing for any additional rules required on the target region.

3. pre-associate NGSs to the Subnets
Target Subnet NSG can then be immediately associated with the target region subnet, as both the NSG and the subnet are already available.

4. associate NGSs to the replicated VMs at faillover in RP
Target VM NSG can be associated with VMs during failover using recovery plans.

---

[Azure Traffic Manager with Azure Site Recovery](https://learn.microsoft.com/en-us/azure/site-recovery/concepts-traffic-manager-with-site-recovery)   

Azure Traffic Manager enables you to control the distribution of traffic across your application endpoints. An endpoint is **any Internet-facing service hosted inside or outside of Azure**.

**Traffic Manager uses the Domain Name System (DNS)** to direct client requests to the most appropriate endpoint, based on: 

- a traffic-routing method 
  [traffic-routing method](https://learn.microsoft.com/en-us/azure/traffic-manager/traffic-manager-routing-methods)  
  - Priority
  - Weighted
  - Performance
  - Geographic
  - Multivalue
  - Subnets

- and the health of the endpoints:
  To configure endpoint monitoring, you must specify the following settings on your Traffic Manager profile:
  - Protocol 
  - Port
  - Path
  - Custom header settings
  -

> you can combine Azure Traffic Monitor’s intelligent routing with Azure Site Recovery’s powerful disaster recovery and migration capabilities.

> Scenario 1: on-premises to Azure failover in Disaster Recovery

Company A is running applications with public endpoints and wants the ability to seamlessly redirect traffic to Azure in a disaster event. 
The **Priority traffic-routing method** in Azure Traffic Manager allows Company A to easily implement this failover pattern.

- Priority routing method: 
Select Priority routing when you want to have a primary service endpoint for all traffic. You can provide multiple backup endpoints in case the primary or one of the backup endpoints is unavailable.

> Setup of TM for DR:

<img src="./Q188-2.png">

When Azure Traffic Manager detects that the Primary endpoint is no longer healthy, it automatically uses the Failover endpoint in the DNS response and users connect to the application recovered on Azure.

When the disaster is contained, Company A can failback from Azure to its on-premises environment (VMware or Hyper-V) using **Azure Site Recovery**.
Now, when Traffic Manager detects that the Primary endpoint is healthy again, it automatically utilizes the Primary endpoint in its DNS responses.

> Scenario 2: Azure to Azure failover

It is virtually the same as the scenario: Scenario 1: on-premises to Azure failover in Disaster Recovery.

---

> Scenario 3: On-premises to Azure migration

In addition to disaster recovery, Azure Site Recovery also enables migrations to Azure.

--- 

[Site Recovery - Migrating to Azure](https://learn.microsoft.com/en-us/azure/site-recovery/migrate-overview)   

For migration, we recommend that you use the Azure Migrate service to migrate your VMs and servers to Azure, instead of using Azure Site Recovery service.

---

[Create and customize recovery plans](https://learn.microsoft.com/en-us/azure/site-recovery/site-recovery-create-recovery-plans#create-a-recovery-plan)  


[Run a test failover (disaster recovery drill) to Azure](https://learn.microsoft.com/en-us/azure/site-recovery/site-recovery-test-failover-to-azure)  

---


## Q186:

You are an Azure admin for an organization that runs an on-prem site
and uses Azure to host iots mission-critical LOB apps.
One of your on-prem apps and an app hosted on a Azuere VMSS connect to the same SA endpoint.

You need to perform a comparative analysis of latencies of teh on-prem site and that of the app hosted in Azure.

What should I use?

- Azure Network Watcher Connection monitor
- Azure Network Watcher IP flow
- Azure Network Watcher NSG diagnostics
- Azure Network Watcher VPN troubleshoot from the Azure portal 

---

### Answer:
- Azure Network Watcher Connection monitor:
This tools allows to monitor and capture the metrics of connection also in hybrid environments.
The details are below in the references.

The reamining options do not apply to this case:

- Azure Network Watcher NSG diagnostics:
troubleshhot NSG rules in cases where traffic is allowed or denied and you must understand why, that is whichi NSG rule causes ot to be allowed or denied.

- Azure Network Watcher IP flow:
troubleshoot network connectivity at packet level based on the 5-tuple paradigm.

- Azure Network Watcher VPN troubleshoot from the Azure portal:
troubleshoot the connection between **VNet gateways**. 

[VPN troubleshoot overview](https://learn.microsoft.com/en-us/azure/network-watcher/vpn-troubleshoot-overview) 

Virtual network gateways provide connectivity between 
**on-premises resources** and **Azure Virtual Networks**.

Azure Network Watcher VPN troubleshoot provides the capability to troubleshoot virtual network gateways and their connections. 

When called, Network Watcher diagnoses the health of the gateway, or connection, and returns the appropriate results.

VPN troubleshoot can be called through:

- the Azure portal
- Azure PowerShell
- Azure CLI
- REST API

> Supported Gateway types:
VPN
Route Based
IPSec
VNet2VNet

> Log files
The resource troubleshooting log files are stored in a storage account after resource troubleshooting is finished. 
---

### References:

[Azure Network Watcher Connection monitor overview](https://learn.microsoft.com/en-us/azure/network-watcher/connection-monitor-overview)   

Connection monitor provides unified, end-to-end connection monitoring in Network Watcher. 

**The Connection monitor feature supports hybrid and Azure cloud deployments**. 

> Use Case 1: check network connectivity between the two VM/or scale sets

Your front-end web server virtual machine (VM) or virtual machine scale set communicates with a database server VM in a multi-tier application. You want to check network connectivity between the two VM/or scale sets.

> Use Case 2: compare cross-region network latencies

You want VMs/scale sets in, for example, the East US region to ping VMs/scale sets in the Central US region, and you want to compare cross-region network latencies

> Use Case 3: compare the latencies to Microsoft between sites

You have multiple on-premises office sites, one in Seattle, Washington, for example, and another in Ashburn, Virginia. Your office sites **connect to Microsoft 365 URLs**. For your users of Microsoft 365 URLs, you want to compare the latencies between Seattle and Ashburn.

> Use Case 4: ompare the latencies of the on-premises site with the latencies of the Azure application

**This is the use case of the question!**

Your **hybrid application needs connectivity to an Azure storage account endpoint**. Your on-premises site and your Azure application connect to the same endpoint. You want to compare the latencies of the on-premises site with the latencies of the Azure application.

> Use Case 5: check the connectivity in hybrid deployments

You want to check the connectivity between your on-premises setups and the Azure VMs/virtual machine scale sets that host your cloud application.


<img src="./Q186-1.png">


> Install monitoring agents:

Connection monitor now supports auto enablement of monitoring extensions for Azure & Non-Azure endpoints, thus eliminating the need for manual installation of monitoring solutions during the creation of Connection monitor.

Connection monitor relies on lightweight executable files to run connectivity checks.

It supports connectivity checks from both Azure environments and on-premises environments. The executable file that you use depends on whether your VM is hosted on Azure or on-premises.

---

## Q185:

You are an Azure admin at a retail organization.
Your organization uses 4500 Azure SAs accross two Azure subscriptions.

You have been tasked with performing an audit b implementing teh following:

1. identify the SAs that have no use
2. enable the view of interactive storage metrics for the 4500 SAs accross the two subsccriptions
3. cunstomized dashboard coloring for availability

You have decided to use **Storage Insights** vie in Azure Monitor.

Select yes/no:

- you can sort your SAs in ascending order by using teh transaction column to identify the SA with no use

- the overview workbook for the selected subscriptions will exhibit up to 500 SAs

- you can apply customized coloring in the Availability threshold section

---

### Answer:

- you can sort your SAs in ascending order by using the transaction column to identify the SA with no use
yes: this is doen through teh columen named transaction volume whichi is sortable.

- the overview workbook for the selected subscriptions will exhibit up to 500 SAs
no: the maximum is 200!

- you can apply customized coloring in the Availability threshold section
yes: it is possble to apply customize coloring schemes.


---

### References:

[Best practices for monitoring Azure Blob Storage](https://learn.microsoft.com/en-us/azure/storage/blobs/blob-storage-monitoring-scenarios)  

This article features a collection of common storage monitoring scenarios, and provides you with best practice guidelines to accomplish them.

> Identify storage accounts with no or low use:

Storage Insights is a dashboard on top of Azure Storage metrics and logs.

> Analyze transaction volume:
sort your accounts in ascending order by using the Transactions column. 
If There are no read and write transactions. This might lead you to believe that the account is not being used in a significant way.

> Analyze used capacity:

From the Capacity tab sort your accounts in ascending order by using the Account used capacity column. 

> Monitor the use of a container (by customer):

If you partition your customer's data by container, 
then can monitor how much capacity is used by each customer. 
You can use **Azure Storage blob inventory** to take an inventory of blobs with size information.

[Calculate blob count and total size per container using Azure Storage inventory](https://learn.microsoft.com/en-us/azure/storage/blobs/calculate-blob-count-size)  

**You can also evaluate traffic at the container level by querying logs**.

> Example: query to get the number of read transactions and the number of bytes read on each container

```
StorageBlobLogs
| where OperationName  == "GetBlob"
| extend ContainerName = split(parse_url(Uri).Path, "/")[1]
| summarize ReadSize = sum(ResponseBodySize), ReadCount = count() by tostring(ContainerName)
```

> uses a similar query to obtain information about write operations:

```
StorageBlobLogs
| where OperationName == "PutBlob" or
  OperationName == "PutBlock" or
  OperationName == "PutBlockList" or
  OperationName == "AppendBlock" or
  OperationName == "SnapshotBlob" or
  OperationName == "CopyBlob" or
  OperationName == "SetBlobTier"
| extend ContainerName = split(parse_url(Uri).Path, "/")[1]
| summarize WriteSize = sum(RequestBodySize), WriteCount = count() by tostring(ContainerName)
```

> Audit account activity:
> Auditing control plane operations: with Activity Logs

In many cases, you'll need to audit the activities of your storage accounts **for security and compliance**. 

- control plane: ARM
- data plane: Azure Storage API 

> Auditing data plane operations:

Data plane operations are captured in **Azure resource logs for Storage in Azure Monitor**. 

You can configure **Diagnostic setting** to export logs to Log Analytics workspace for a native query experience.

```
StorageBlobLogs
| where TimeGenerated > ago(3d)
| project TimeGenerated, AuthenticationType, RequesterObjectId, OperationName, Uri
```

> Optimize cost for infrequent queries:

When you have massive transactions on your storage account, the cost of using logs with Log Analytics might be high.

If you only plan to query logs occasionally (for example, query logs for compliance auditing), you can **consider reducing the total cost by exporting logs to storage account, and then using a serverless query solution on top of log data, for example, Azure Synapse**.

**With Azure Synapse, you can create server-less SQL pool to query log data when you need**.
**This could save costs significantly**.

---

[Monitoring your storage service with Azure Monitor Storage insights](https://learn.microsoft.com/en-us/azure/storage/common/storage-insights-overview?toc=%2Fazure%2Fazure-monitor%2Ftoc.json)  

Storage insights provides comprehensive monitoring of your Azure Storage accounts by delivering **a unified view of your Azure Storage services** performance, capacity, and availability. 

This tool allows to derive actionable knowledge on the health and performance of Storage accounts at scale, with a capability to focus on hotspots and diagnose latency, throttling, and availability issues.

You can observe storage capacity, and performance in two ways:

- directly from a storage account 
- from Azure Monitor to see across groups of storage accounts

**This feature does not require you to enable or configure anything, the storage metrics from your storage accounts are collected by default**.

> Overview workbook:

The default Availability threshold is:
Warning - 99%
Critical - 90%

> Capacity workbook:

Select Capacity at the top of the page and the Capacity workbook opens.


---

## Q184:

your company hosts its infrastructure in Azure, it consists of VMs,
storage in the form of disks and Azure file shares and several VNets
with Subnets.

The service desk sees an influx of support tickets that have been loged in the past 24 h regarding itermittent connectivity issues to a we server.

After some investigation the ticket has been escaleted to you and you 
need to use Network Watcher diagnostic tool to check if packets are allowed or denied to the web server.

Which NW diagnostic tool should you use?

- IP flow verify
- connection troubleshoot
- next hop
- effective security rules


---

### Answer:
- IP flow verify:
This tool show which NSG rule causes inbound/outbound packets denial to a web server. 
It is based on a 5-tuple rule packet:
SOURCE IPs+PORTS, DESTINATION IPs+PORTS, PROTOCOL


The remaining options do not apply:

- connection troubleshoot:
this is to check whether it is possible to establish as TCP connection between two IPs (that is a VM and an IP that might be another VM).
You can use FQDN, URI to IPs.

- next hop:
This is to troubleshoot DNS route tables, that is how packets travel from a VM to a destination.

- effective security rules:
shows the NGS rule that are applied to a VM NIC.

This topic was examined in detail in onbe of the previous questions.

---

### References:

[IP flow verify overview](https://learn.microsoft.com/en-us/azure/network-watcher/ip-flow-verify-overview)  

---

## Q183:

You have two VMs and three SAs in an Azure subscription.
The subscription configuration is shown in the exhibit.

<img src="./Q183-1.png">

vm1 Ubuntu LTS          Central US
vm2 Windows Server 1019 East    US

SA1 LRS Premium         Central US
SA2 LRS Standard V1     East    US
SA3 GRS Standard V2     Central US

You need to enable boot diagnostics (BD) in Azure VMs using the 
available SAs.

Which SA should you use?

Enable BD in VM1 by using: OPTIONS 
Enable BD in VM2 by using: OPTIONS 

OPTIONS:
SA1
SA2
SA3
SA1 & SA2
SA2 & SA3
SA1 & SA2 & SA3

---

### Answer:

Enable BD in VM1 by using: SA3 
Enable BD in VM2 by using: SA2

vm1 > Central US > SA3 > Central US
vm2 > East    US > SA2 > East    US

You can use a Standard SA V2 or V1 as long as it is in the same region
as the VM the fact that ti is LRS rather GRS does not matter to 
boot diagnostics.  


---

### References:

[How to use boot diagnostics to troubleshoot virtual machines in Azure](https://learn.microsoft.com/en-us/troubleshoot/azure/virtual-machines/windows/boot-diagnostics)   

There can be many reasons that a virtual machine enters a non-bootable state. To address issues **with your virtual machines created using Resource Manager deployment model**, you can use the following debugging features: 

- Console Output 
- Screenshot support for Azure virtual machines

**For Linux virtual machines**, you can view the output of your console log from the Portal.

**For both Windows and Linux virtual machines**, Azure enables you to see a screenshot of the VM from the hypervisor.

**Select the Boot diagnostics option to view the log and the screenshot**.

The **diagnostics profile** enables you to select the storage account where you want to put these logs.

```
{
  "apiVersion": "2018-10-01",
  "type": "Microsoft.Compute/virtualMachines",
  …

"diagnosticsProfile": {
 "bootDiagnostics": {
  "enabled": true,
  "storageUri": "[concat('https://', parameters('newStorageAccountName'), '.blob.core.windows.net')]"
  }
    }  
  ...  
}

```
---

## Q182:

You have an ASP.NET Core app running in an App Service.
The app generate log messages that should be stored for at least a week.
You need to enable diagniostic logging and only store logs with severety level of Warning or higher.

How should you configure the diagnostic loggig?

Diagnostic logging: OPTIONS-1
Severety level    : Error | Information | Verbose | Warning

OPTIONS-1:
application logging (blob)
application logging (filesystem)
web server logging (storage)
detailed error messages 

---

### Answer:

Diagnostic logging: application logging (blob)
Severety level    : Warning

---

### References:

[Enable diagnostics logging for apps in Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/troubleshoot-diagnostic-logs)    

- logs can be written to the local filesystem but this is only meant for debugging the the options switches off automatically after 12 h

- only .Net application logs can be witten to Blob storage. This options is meant for long-term retention.

- Python / Node.js / Java logs can only be stored to the local filesystem

- if you set a retention policy for the logs saved to blobs the retention policy is removed when the App Service is removed and the logs will be retained indefinitely on the SA

- if the access keyes to teh SA are regenerated then you must reste all in the App Service

web server logging (storage)
detailed error messages 

can only be saved to the local filesystem and the retantion is 50 of each aftyer that App Service deletes them automatically displacing teh oldest.


---

## Q181:

You need to create an alert for a VM named VM1 that will be fired
when the VM's CPU utilization is grater than 95% for at least 10 mins.

You need to add an action group named AG1 to this alert.

```
az monitor metrics alert OPTIONS-1 -n A1 -g RG1 `
--OPTIONS-2 "avg Percentage CPU > 95" `
--OPTIONS-3 10m --OPTIONS-4 AG1
```

OPTIONS-1: create | list | show
OPTIONS-2: condition | desription | scopes
OPTIONS-3: action | evaluation-frequency | windows-size
OPTIONS-4: action | condition | name


---

### Answer:

> THIS IS NOT RIGHT !
It is almost right, it lacks the `--scopes`
```
az monitor metrics alert create -n A1 -g RG1 `
--condition "avg Percentage CPU > 95" `
--window-size 10m --action AG1
```

`--scopes`
Space-separated list of scopes the rule applies to. The resources specified in this parameter must be of the same type and exist in the same location.
**For examle the IDs of a set of VMs**.

---

### References:

[az monitor metrics alert](https://learn.microsoft.com/en-us/cli/azure/monitor/metrics/alert?view=azure-cli-latest)  

Create a high CPU usage alert on a VM with no action.

```
az monitor metrics alert create -n alert1 -g {ResourceGroup} --scopes {VirtualMachineID} --condition "avg Percentage CPU > 90" --description "High CPU"
```

Create a high CPU usage alert on a VM with email and webhook actions:

```
az monitor metrics alert create -n alert1 `
-g {ResourceGroup} `
--scopes {VirtualMachineID} `
--condition "avg Percentage CPU > 90" `
--window-size 5m `
--evaluation-frequency 1m `
--action "/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Insights/actionGroups/<actionGroupName>" apiKey={APIKey} type=HighCPU --description "High CPU"
```

Create an alert when a storage account shows a high number of slow transactions, using multi-dimensional filters.:

```
az monitor metrics alert create -g {ResourceGroup} `
-n alert1 --scopes {StorageAccountId} `
--description "Storage Slow Transactions" `
--condition "total transactions > 5 where ResponseType includes Success" `
--condition "avg SuccessE2ELatency > 250 where ApiName includes GetBlob"
```

---

## Q180:

You have the Azure subscription named `sub1`.
You create an alert rule named `alert1`.

The rule generate: 
email, voice message, sms message

you determine that the rule fires every minute.

You configure an action group to manage how often the notifications are sent. 

How many alert notofications will be sent when  the rate limits are configured at their maximum value?

email        : 0 | 1 | 4 | 12 | 60
voice message: 0 | 1 | 4 | 12 | 60 
sms message  : 0 | 1 | 4 | 12 | 60

---

### Answer:

email        : 60 / h
voice message: 12 / h = 1 notification / 5 mins
sms message  : 12 / h = 1 notification / 5 mins

These are the maximum rate limits.

However, **the max number of alerts that can be set for an action group is 100  notification per hour**.

---

### References:

[Action groups](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/action-groups)   

---

## Q179:

Your company has an Azure subscription.
You create a Azure Log Analytics workspace and collect data from various data sources.
You run Azure Monitor log query.
You want to display tabular data as a chart pinned to a shared dashboard.

You need to identify restrictions when pinning a result chart to a dashboard.

select yes/no:

- data display in the chart is limited to no more than 14 days
- data display in the chart is limited up to 4 cols and teh top 7 rows
- chart types are limited to line and stack column only


---

### Answer:

- data display in the chart is limited to no more than 14 days
Yes: this is the case when teh chart is pinned the table or teh chart to the Azure Portal dashboard.

- data display in the chart is limited up to 4 cols and teh top 7 rows
No

- chart types are limited to line and stack column only
No

Unless the render operation is specified in the Azure Monitor query the data from Azure Monitor Log is returned as a table. You have the option of formatting the data as a chart in multiple supported chart formats includung lines, columns, stacked colums and pie.

---

### References:

[Log queries in Azure Monitor](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/log-query-overview)   

Azure Monitor Logs is based on Azure Data Explorer, and log queries are written by using the same Kusto Query Language (KQL).

> Areas in Azure Monitor where you'll use queries include:

- Log Analytics:
Use this primary tool in the Azure portal to edit log queries and interactively analyze their results. Even if you intend to use a log query elsewhere in Azure Monitor, you'll typically write and test it in Log Analytics before you copy it to its final location.

- Log search alert rules: 
Proactively identify issues from data in your workspace. 
**Each alert rule is based on a log query that's automatically run at regular intervals**. The results are inspected to determine if an alert should be created.

- Workbooks: 
Include the results of log queries by using different visualizations in **interactive visual reports in the Azure portal**.

- Azure dashboards: 
Pin the results of any query into an Azure dashboard, which allows you to visualize log and metric data together and optionally share with other Azure users.

- Azure Logic Apps: 
Use the results of a log query in an automated workflow by using a logic app workflow.

- PowerShell: 
Use the results of a log query in a **PowerShell script** from a command line or an **Azure Automation runbook** that uses `Invoke-AzOperationalInsightsQuery`.

[Invoke-AzOperationalInsightsQuery](https://learn.microsoft.com/en-us/powershell/module/az.operationalinsights/invoke-azoperationalinsightsquery?view=azps-11.5.0)

- Azure Monitor Logs API: 
Retrieve log data from the workspace from any REST API client. 
The API request includes a query that's run against Azure Monitor to determine the data to retrieve.

- Azure Monitor Query client libraries: 
Retrieve log data from the workspace via an idiomatic client library for the following ecosystems: .NET / Go / Java / JavaScript / Python

---

[Log Analytics tutorial](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/log-analytics-tutorial)   

Log Analytics is a tool in the Azure portal to edit and run log queries from data collected by Azure Monitor logs and interactively analyze their results.

[Tutorial: Learn common KQL operators](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/tutorials/learn-common-operators?pivots=azuremonitor)  

[Use queries in Log Analytics](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/queries?tabs=groupby)  

---

## Q178:

Your company has an Azure subscription with a VNet in East US.
A Windows Server 2016 VM named VM1 is this VNet.

You need to capture the network packets into and out of VM1
over a two-hour period.
The captured packets must be stored in VM1's storage.

What should you use?

- Azure Network Watcher
- Azure Monitor
- Azure Network Perfomance Monitor
- Windows Perfomance Monitor

---

### Answer:
- Azure Network Watcher

this is the obvious answer, NW allows you to store the
trafic performance info aither on disk on send it to a
SA.

This was discussed in detail in a previos question.

The remaining options do not apply:

- Azure Monitor

- Windows Perfomance Monitor:
this collects performormance counter within the Windows OS it does not apply to network traffic

- Azure Network Perfomance Monitor:
this was discussed in detail in a previois question


---

### References:


[Network Watcher: Packet capture overview](https://learn.microsoft.com/en-us/azure/network-watcher/packet-capture-overview)  

---

## Q177:

You have an Azure subscription with 5 VMs.

You need to enable alerts related to: 
VM restarts, stops, deallocations.

The alerts must be sent to two admins both by email & by 
Azure app push notifications.

You must create alert rules, action groups and notifications
in the Azure Portal.

What are the minimum number of:

alert rules   : 1 | 3 | 5 | 15
action groups : 1 | 3 | 5 | 6 | 10 | 15 | 30
notifications : 1 | 2 | 10 | 15 | 30

that you should create?

---

### Answer:

alert rules   : 3
action groups : 1
notifications : 2

The event Logs you want to generate aleerts on are: 
VM restarts, stops, deallocations
therefore you need three alert rules

A sigle AG can be used to accomplish all the send the 2 notifications
that are required to both admins.

This was discussed in detail in a previous question.

---

### References:



---

## Q176:

you plan to deploy 30 application gateways to Azure.
These gateways will provide public access to 30 different web apps
hosted on Azure VMs.

You need to recommend a monitoring solution that can provide a 
consolidated view of the types of requests that are being made over 
the Internet to the application gateways.

The solution must meet the following requirements:

1. it must be able to query all requests that are being blocked by the Web Application Firewall (WAF) gateway

2. it must support analysis if metrics collected for the number of requests being made over a period of one month

3. it must provide insights into the performance of the application gateways in serving various pages to users

What should you recommend?

- Azure Monitor
- Azure Log Analytics
- Azure Application Insights
- Azure Sentinel

---

### Answer:
- Azure Monitor

The remaining options do not apply:

- Azure Application Insights:
This is an APM (Application Performance Monitoring) framework that can be used to generate telemetry data. It **will not** provide a comprehensive view of WAF logs!

- Azure Sentinel:
this is a SIEM (Security Information Event Management) solution beased on AI available in Azure as a SaaS service and does not apply to this case.

---

### References:

---

## Q175:

You deploy VMs in your Azure subscription.
The VMs are connected to different VNets.
You configure custom NSGs with filtering rules on teh VNets.
Communication between the VMs is working correclty.

You dploy a new VNet named VNet1 but it expirince connectivity issues.
You decide to use Nework Watcher to troubleshoot.
You need to determin wich NSG rule causes the issue.

Which two cmdlet should you use?

- Test-AzNetworkWatcherIPFlow
- Test-AzNetworkWatcherNextHop
- Test-AzNetworkWatcherConnectivity
- Get-AzNetworkSecurityGroup
- Get-AzEffectiveNetworkSecurityGroup

---

### Answer:
- Test-AzNetworkWatcherIPFlow
- Get-AzEffectiveNetworkSecurityGroup

`Test-AzNetworkWatcherIPFlow` is teh cmdlet equivalte to the NW IP Flow that you can do in the Azure Portal from NW.
This has laready been discussed in details in one of teh previous questions.

`Get-AzEffectiveNetworkSecurityGroup` this can be used after `Test-AzNetworkWatcherIPFlow` to understand why a specific rule that is reported by `Test-AzNetworkWatcherIPFlow` as being the cause of blocked traffic causes the problem.

---

### References:

[Quickstart: Diagnose a virtual machine network traffic filter problem using Azure PowerShell](https://learn.microsoft.com/en-us/azure/network-watcher/diagnose-vm-network-traffic-filtering-problem-powershell)   

> Test network communication using IP flow verify:

```
# Place myVM configuration into a variable.
$vm = Get-AzVM -ResourceGroupName 'myResourceGroup' -Name 'myVM'

# Start the IP flow verify session to test outbound flow to www.bing.com.
Test-AzNetworkWatcherIPFlow -Location 'eastus' -TargetVirtualMachineId $vm.Id -Direction 'Outbound' -Protocol 'TCP' -RemoteIPAddress '13.107.21.200' -RemotePort '80' -LocalIPAddress '10.0.0.4' -LocalPort '60000'
```

After a few seconds, you get similar output to the following example:

```
Access RuleName
------ --------
Allow  defaultSecurityRules/AllowInternetOutBound
```

The test result indicates that access is allowed to 13.107.21.200 because of the default security rule AllowInternetOutBound. By default, Azure virtual machines can access the internet.

> View details of a security rule:

To determine why the rules in the previous section allow or deny communication, review the effective security rules for the network interface of myVM virtual machine.

```
# Get the effective security rules for the network interface of myVM.
Get-AzEffectiveNetworkSecurityGroup -NetworkInterfaceName 'myVM' -ResourceGroupName 'myResourceGroup'
```

---

[Troubleshoot outbound connections using PowerShell](https://learn.microsoft.com/en-us/azure/network-watcher/connection-troubleshoot-powershell)    

> Check connectivity to a virtual machine:

```
$rgName = "ContosoRG"
$sourceVMName = "MultiTierApp0"
$destVMName = "Database0"

$RG = Get-AzResourceGroup -Name $rgName

$VM1 = Get-AzVM -ResourceGroupName $rgName | Where-Object -Property Name -EQ $sourceVMName

$VM2 = Get-AzVM -ResourceGroupName $rgName | Where-Object -Property Name -EQ $destVMName

$networkWatcher = Get-AzNetworkWatcher | Where-Object -Property Location -EQ -Value $VM1.Location

Test-AzNetworkWatcherConnectivity -NetworkWatcher $networkWatcher -SourceId $VM1.Id -DestinationId $VM2.Id -DestinationPort 80
```

> Validate routing issues:

This example checks connectivity between a virtual machine and a remote endpoint.

```
$rgName = "ContosoRG"
$sourceVMName = "MultiTierApp0"

$RG = Get-AzResourceGroup -Name $rgName
$VM1 = Get-AzVM -ResourceGroupName $rgName | Where-Object -Property Name -EQ $sourceVMName

$networkWatcher = Get-AzNetworkWatcher | Where-Object -Property Location -EQ -Value $VM1.Location

Test-AzNetworkWatcherConnectivity -NetworkWatcher $networkWatcher -SourceId $VM1.Id -DestinationAddress 13.107.21.200 -DestinationPort 80
```

> Check website latency | to a storage endpoint:

The following example checks connectivity to a website. This example requires that you have Network Watcher enabled in the region containing the source VM.

```
$rgName = "ContosoRG"
$sourceVMName = "MultiTierApp0"

$RG = Get-AzResourceGroup -Name $rgName
$VM1 = Get-AzVM -ResourceGroupName $rgName | Where-Object -Property Name -EQ $sourceVMName

$networkWatcher = Get-AzNetworkWatcher | Where-Object -Property Location -EQ -Value $VM1.Location

Test-AzNetworkWatcherConnectivity -NetworkWatcher $networkWatcher -SourceId $VM1.Id -DestinationAddress https://bing.com/

# to a storage endpoint

Test-AzNetworkWatcherConnectivity -NetworkWatcher $networkWatcher -SourceId $VM1.Id -DestinationAddress https://contosostorageexample.blob.core.windows.net/ 

```

---

[Test-AzNetworkWatcherConnectivity](https://learn.microsoft.com/en-us/powershell/module/az.network/test-aznetworkwatcherconnectivity?view=azps-11.5.0)  

returns connectivity information for a specified source VM and a destination. If connectivity between the source and destination cannot be established, the cmdlet returns details about the issue.

---

[Diagnose a virtual machine network routing problem - Azure PowerShell](https://learn.microsoft.com/en-us/azure/network-watcher/diagnose-vm-network-routing-problem-powershell)  

> Use next hop:

You may create custom routes that override the default routes. Sometimes, custom routes can cause communication to fail. 
To test routing from a VM, use the Get-AzNetworkWatcherNextHop command to determine the next routing hop when traffic is destined for a specific address.

Test outbound communication from the VM to one of the IP addresses for www.bing.com.

```
Get-AzNetworkWatcherNextHop -NetworkWatcher $networkWatcher -TargetVirtualMachineId $VM.Id -SourceIPAddress 192.168.1.4 -DestinationIPAddress 13.107.21.200
```

> View details of a route:

```
Get-AzEffectiveRouteTable -NetworkInterfaceName myVm -ResourceGroupName myResourceGroup |
  Format-table
```

---

[Get-AzNetworkWatcherNextHop](https://learn.microsoft.com/en-us/powershell/module/az.network/get-aznetworkwatchernexthop?view=azps-11.5.0)  

gets the next hop from a VM. Next hop allows you to view the type of Azure resource, the associated IP address of that resource, and the routing table rule that is responsible for the route.

[Get-AzEffectiveRouteTable](https://learn.microsoft.com/en-us/powershell/module/az.network/get-azeffectiveroutetable?view=azps-11.5.0)  

---

## Q174:

you have an Azure Network as shown in the exhibit.

<img src="./Q174-1.png">

There are two VNets and several servers.
Server2 has the Network Watcher Agent installed.

You have peered both VNets together but Server1 fails 
to communicate with Server 2 over HTTPS.
you must find out why.

What shold you do first?

- use the `Test-Connection` command on each server  
- use the **Network Performance Monitor** to discuver the issue  
- install the Network Watcher Agent also on Server 1  
- use the Network Watcher service to test the TCP connection between Sever 1 and Server 2

---

### Answer:
- use the Network Watcher service to test the TCP connection between Sever 1 and Server 2

You do not need to install NW also on Server 1.
**NW does require installation on the source server**, therefore you might think that you must install it also on Server 1 as in the question the TCP traffic that you want to monitor (as it fails) is from Sever 1 to Server 2.

> Special case: IP flow verify

However, **IP flow verify does not require that NW is installed on the source server in order to wak, the destination server might do as well**.

The following do not apply:

- use the `Test-Connection` command on each server  
this would tell you that the traffic is blocked but not why ar from what like NW IP Flow verify does.

- use the **Network Performance Monitor** to discuver the issue  
This is a very capable service that would also work in this case but it is designed to cover the scanrios where **continuos newtork monitoring** is desired rather a one-off investigation.

See reference below for the details.

---

### References:

[IP flow verify overview](https://learn.microsoft.com/en-us/azure/network-watcher/ip-flow-verify-overview)   

IP flow verify looks at the rules of all network security groups applied to a virtual machine's network interface, whether the network security group is associated to the virtual machine's subnet or network interface. It additionally, looks at the Azure Virtual Network Manager rules applied to the virtual network of the virtual machine.

IP flow verify uses:

- traffic direction
- protocol
- local IP
- remote IP
- local port
- remote port 

to to test security and admin rules that apply to the virtual machine's network interface.

IP flow verify returns **Access denied** or **Access allowed**, 
**the name of the security rule that denies or allows** the traffic, and the network security group with a link to it so you can edit it if you need to. 

It doesn't provide a link if a default security rule is denying or allowing the traffic. 

---

[Connection monitor: Network Performance Monitor solution in Azure](https://learn.microsoft.com/en-us/previous-versions/azure/azure-monitor/insights/network-performance-monitor)  

Network Performance Monitor is a cloud-based hybrid network monitoring solution that helps you monitor network performance between various points in your network infrastructure.

 It also helps you monitor network connectivity to:

 - service endpoints 
 - application endpoints 
 - monitor the performance of Azure ExpressRoute

Network Performance Monitor **detects network issues** like:

- traffic blackholing
- routing errors
- issues that conventional network monitoring methods aren't able to detect

Network Performance Monitor offers three broad capabilities:

- Performance Monitor: 
across cloud deployments and on-premises locations, multiple data centers, and branch offices and mission-critical multitier applications or microservices. 
With Performance Monitor, you can detect network issues 
**before users complain**.

- Service Connectivity Monitor: 
monitor the connectivity from your users to the services you care about
identify where network bottlenecks occur. 
You can know about outages before your users
see the exact location of the issues along your network path.
This capability helps you perform tests based on: 
**HTTP, HTTPS, TCP, and ICMP** 

- ExpressRoute Monitor: 
Monitor end-to-end connectivity and performance between your branch offices and Azure, over Azure ExpressRoute.

---

## Q173:

You deploy several VMs for different purposes.
You deploy Network Watcher in the East US region.
You see some odd traffic on a VM named VM1.
VM1 makes connections to a unknown SFTP service.

You need to configure a filter to capture those packages 
to the unknown SFTP service.
You decide to use PS for this task.

```
$res = Get-AzResource | `
Where {$_.ResourceType -eq OPTIONS-1 -and $_.Location -eq "East US"}

$nw = Get-AzNetworkWatcher -Name $res.Name `
-ResourceGroupName $res.ResourceGroupName

$diagnosticSA = Get-AzStorageAccount -Name  "diagnosticSA" `
-ResourceGroupName diagnosticsRG

$filter1 = New-AzPackageCaptureFilterConfig -Protocol TCP `
-RemoteIPAddress OPTIONS-2 `
-LocalIPAddress "10.0.0.3" `
-LocalPort OPTIONS-3 `
-RemotePort 

OPTIONS-4 -NetworkWatcher $nw `
-TargetVirtualMachineId  $vm.Id `
-PacketCaptureName "Capture SFTP Traffic" `
-StorageAccountId $diagnosticSA.Id `
-TimeLimitInSeconds 60 `
-Filter $filter1
```

OPTIONS-1:
"Micorsoft.Network/networkWatchers"
"Micorsoft.Network/networkWatchers/packetCaptures"

OPTIONS-2:
"0.0.0.0",
"0.0.0.0-255.255.255.255",

OPTIONS-3:
"0"
"1-65535"
"20,21"
"20-21"
"22"

OPTIONS-4:
New-AzNetworkWatcherPacketCapture
New-AzNetworkWatcher

---

### Answer:

```
$res = Get-AzResource | `
Where {$_.ResourceType -eq "Micorsoft.Network/networkWatchers" -and $_.Location -eq "East US"}

$nw = Get-AzNetworkWatcher -Name $res.Name `
-ResourceGroupName $res.ResourceGroupName

$diagnosticSA = Get-AzStorageAccount -Name  "diagnosticSA" `
-ResourceGroupName diagnosticsRG

$filter1 = New-AzPackageCaptureFilterConfig -Protocol TCP `
-RemoteIPAddress "0.0.0.0-255.255.255.255" `
-LocalIPAddress "10.0.0.3" `
-LocalPort "1-65535" `
-RemotePort "22"

New-AzNetworkWatcherPacketCapture -NetworkWatcher $nw `
-TargetVirtualMachineId  $vm.Id `
-PacketCaptureName "Capture SFTP Traffic" `
-StorageAccountId $diagnosticSA.Id `
-TimeLimitInSeconds 60 `
-Filter $filter1
```
The answer is slef-explanatory

The only two details worth noticing are for the `New-AzPackageCaptureFilterConfig` command.

`-RemoteIPAddress "0.0.0.0-255.255.255.255"`
`-LocalPort "1-65535" `

These mean literally **any remote IP address** and **any remote port** that is destination of the packets. 

`-RemotePort "22"`
Port 22 is the port used to communicate over SFTP.

---

### References:


[New-AzPacketCaptureFilterConfig](https://learn.microsoft.com/en-us/powershell/module/az.network/new-azpacketcapturefilterconfig?view=azps-11.5.0)  

creates a new packet capture filter object. This object is used to restrict the type of packets that are captured during a packet capture session using the specified criteria. 

[New-AzNetworkWatcherPacketCapture](https://learn.microsoft.com/en-us/powershell/module/az.network/new-aznetworkwatcherpacketcapture?view=azps-11.5.0)  

---

[Manage packet captures for virtual machines with Azure Network Watcher using PowerShell](https://learn.microsoft.com/en-us/azure/network-watcher/packet-capture-vm-powershell)  

```
# Install Network Watcher agent on a Linux virtual machine.
Set-AzVMExtension -Publisher 'Microsoft.Azure.NetworkWatcher' -ExtensionType 'NetworkWatcherAgentLinux' -Name 'AzureNetworkWatcherExtension' -VMName 'myVM' -ResourceGroupName 'myResourceGroup' -TypeHandlerVersion '1.4' -EnableAutomaticUpgrade 1

# Install Network Watcher agent on a Windows virtual machine.
Set-AzVMExtension -Publisher 'Microsoft.Azure.NetworkWatcher' -ExtensionType 'NetworkWatcherAgentWindows' -Name 'AzureNetworkWatcherExtension' -VMName 'myVM' -ResourceGroupName 'myResourceGroup' -TypeHandlerVersion '1.4' -EnableAutomaticUpgrade 1

# --------------
# START CAPTURE 
# --------------

# Place the virtual machine configuration into a variable.
$vm = Get-AzVM -ResourceGroupName 'myResourceGroup' -Name 'myVM'

# Place the storage account configuration into a variable.
$storageAccount = Get-AzStorageAccount -ResourceGroupName 'myResourceGroup' -Name 'mystorageaccount'

# Start the Network Watcher capture session.
New-AzNetworkWatcherPacketCapture -Location 'eastus' -PacketCaptureName 'myVM_1' -TargetVirtualMachineId $vm.Id  -StorageAccountId $storageAccount.Id


# --------------
# STOP CAPTURE 
# --------------

# Manually stop a packet capture session.
Stop-AzNetworkWatcherPacketCapture -Location 'eastus' -PacketCaptureName 'myVM_1'

# --------------
# DOWNLOAD CAPTURE 
# --------------

# Download the packet capture file from Azure storage container.

Get-AzStorageBlobContent -Container 'network-watcher-logs' -Blob 'subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/myresourcegroup/providers/microsoft.compute/virtualmachines/myvm/2024/01/25/packetcapture_22_44_54_342.cap' -Destination 'C:\Capture\myVM_1.cap'



```
---

## Q172:

You Azure environment consists of the following resources:

- four VNets
- 48 Windows Server and Linux VMs
- six genearl purpose SAs

you must design a universal monitoring solution that enables
you to query all diagnostics and telemetry data emitted by all
the resources.

What should you do first?

- activate resource diagnostic settings
- enable network watcher
- create a Log Analytics Workspace
- install teh Microsoft Monitoring Agent

---

### Answer:
- create a Log Analytics Workspace

This is the obvous answer.

---

### References:

---

## Q171:

You have a RG named RG1 with a Windoes Servr VM named VM1.
You plan to use Azure Monitor to configure an alert rule on VM1.
You need to configure an alert that notifies you whenever the VM is restarted.

What should you do?

---

### Answer:

- define a metric-based alert condition
- define aa Activity Log alert condition
- define an action group with am ITSM action type
- define an action group with a webhook action type


---

### References:
- define aa Activity Log alert condition

This is the obvious answer. You want to monitor the **restart**
of the VM which is **an event in the Activity Log** on Azure Monitor.
Clearly the VMN must have the Azure Monitor Agent installed on it and its activity logs must be selected for export to Azure Monitor.

---

## Q170:

your company develops a LOB app that uses Azure SQL Database.
The app uses Windows and Linux VMs for the business and presentation
layers.

Some users report errors in the app.
You need to be alerted every time an exeption arises in any part of the app.
The solution must require minimum admin effort.

Which two actions should you perform?


- create an alert using a seach query that looks for exception in the business layer and presentation layer VMs

- create an alert using a seach query that looks for exception in the business layer VMs

- create an alert using a seach query that looks for exception in the application layer servers

- create an alert using a seach query that looks for exception in the Linux VMs

- create an alert using a seach query that looks for exception in the Windows VMs



---

### Answer:

- create an alert using a seach query that looks for exception in the Linux VMs:
In this case you can use **Loag Analytics or Application Insights** resources types. You can then write search queries to get all the **Windows Events** that contain the word `Ecxeptoion`.

- create an alert using a seach query that looks for exception in the Windows VMs:
In this case you use **Syslog messages**.

The remainign options do not apply.


---

### References:

[Collect Windows event log data sources with Log Analytics agent](https://learn.microsoft.com/en-us/azure/azure-monitor/agents/data-sources-windows-events)   

**Windows event logs** are one of the most common data sources for **Log Analytics agents on Windows virtual machines** because many applications write to the Windows event log. 

You can collect events from **standard logs**, such as **System and Application**, and any **custom logs created by applications** you need to monitor.

> [Migrate to Azure Monitor Agent from Log Analytics agent](https://learn.microsoft.com/en-us/azure/azure-monitor/agents/azure-monitor-agent-migration)

`Azure Monitor Agent (AMA)` replaces the Log Analytics agent (also known as Microsoft Monitor Agent (MMA) and OMS) for Windows and Linux machines, in Azure and non-Azure environments, including on-premises and third-party clouds. 

---

[Collect Syslog data sources with the Log Analytics agent](https://learn.microsoft.com/en-us/azure/azure-monitor/agents/data-sources-syslog)  

**Syslog** is an event logging protocol that's common to **Linux**.

Applications send messages that might be:
- stored on the local machine or 
- delivered to a Syslog collector

When the Log Analytics agent for Linux is installed, it configures the local Syslog daemon to forward messages to the agent. The agent then sends the messages to Azure Monitor where a corresponding record is created.

---

## Q169:

your company develops a LOB app that uses Azure SQL Database.
**System Center Service Manager** is also deployed.

You need to configure an alert when the DB reaches 70% of CPU.
When the alert is triggered you must notify several users by email 
and SMS.
You also need to automatically create a tickt in the **ITSM system**.
The solution must be that of minimum admin effort.

Which **two** actions should you perform?

- configure System Center Service Manager with Azure Automation

- configure one action group with two actions: one for email and SMS notification and one action for the ITSM ticket creation

- configure two action group with one action action each: one AG for the action email and the action SMS notification and the other AG for the action ITSM ticket creation

- **configure an it service connector ITSMC**

---

### Answer:

- configure one action group with two actions: one for email and SMS notification and one action for the ITSM ticket creation
an AG can be defined with multiple actions, therefore there is no need to use two separate AGs.
The types of actions in an AG are:

- send email
- send sms
- send voice message
- run an Azure Runbook
- run an Azure LogicApp
- trigger a Webhook
- trigger a secure Webhook
- trigger a ITSM action: this requires a ITSMC and configuration

- **configure an it service connector ITSMC**:
you need a connector in order to link your particular ITSM to Azure.
This connector is what allows Azure to create a ticket into it.
In this case the ITSMC is **System Center Service Manager** nad 
such connector exists.


---

### References:

[Azure Monitor - Action Groups](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/action-groups)   

**Alerts triggered by Azure Monitor can contain action groups**, 
**which are a collection of notification preferences**. 

- Azure Monitor
- Azure Service Health
- Azure Advisor 

use action groups to notify users about the alert and take an action.

Each action is made up of:

- Name: A unique identifier within the action group.

- Type: 
The notification that's sent or action that's performed. 
  - send email
  - send sms
  - send voice message
  - run an Azure Runbook
  - run an Azure LogicApp
  - trigger a Webhook
  - trigger a secure Webhook
  - trigger a ITSM action: this requires a ITSMC and configuration

- Details: 
The corresponding details that vary by type.

> an action group is a global service

Global requests from clients can be processed by action group services **in any region**. If one region of the action group service is down, the traffic is automatically routed and processed in other regions. 

**As a global service, an action group helps provide a disaster recovery solution.**

- You can add up to five action groups to an alert rule.
- Action groups are executed concurrently, in no specific order.
- Multiple alert rules can use the same action group.

---

[Azure Monitor IT Service Management integration](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/itsmc-overview)  

Azure services like **Log Analytics** and **Azure Monitor** provide tools to: 

- detect
- analyze
- troubleshoot 

problems with your **Azure** and **non-Azure** resources. 
But the work items related to an issue typically reside in an ITSM product or service.

**Azure Monitor provides a bidirectional connection between Azure and ITSM tools** to help you resolve issues faster. You can create work items in your ITSM tool based on: 

- your Azure metric alerts
- activity log alerts
- log search alerts


Azure Monitor supports connections with the following ITSM tools:

- ServiceNow ITSM or IT Operations Management (ITOM)
- BMC

> ITSM integration workflow:

For ServiceNow ITOM events or BMC Helix, use the **secure webhook action**:

1. Register your app with Microsoft Entra ID
2. Define a service principal
3. Create a secure webhook action group
4. Configure your partner environment. Secure Export supports connections with the following ITSM tools:
ServiceNow ITOM
BMC Helix

---

[Azure Monitor: Connect ServiceNow with IT Service Management Connector](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/itsmc-connections-servicenow)  

configure the connection between a ServiceNow instance and the IT Service Management Connector (ITSMC) in Log Analytics.

--- 

[About System Center - Service Manager](https://learn.microsoft.com/en-us/system-center/scsm/service-manager?view=sc-sm-2022)   

System Center - Service Manager provides **an integrated platform** 
**for automating and adapting** your organization's IT service **management best practices**, such as those in: 

- Microsoft Operations Framework (MOF) 
- Information Technology Infrastructure Library (ITIL). 

It provides: 

- built-in processes for incident and problem resolution
- change control
- asset lifecycle management

---

## Q168:

your company develops a LOB app that uses Azure IoT Hub to gather info from devices.
The app uses IoT Hub Service SDK to read device telemetry from the IoT Hub.
You must monitor the device telemetry and be able to configure alerts based
on the telemetry values.

Your solution should require the minimum admin effort.

What should you do?

- enable Azure Monitor resource diagnostics logs on the IoT Hub
- use Azure Application Insignts in the LOB app
- use Azure activity logs
- use Azure Resource Health

---

### Answer:
- enable Azure Monitor resource diagnostics logs on the IoT Hub

zure Monitor resource diagnostics logs are resource-level logs. 
This allows you to moniotr the events inside the reosurce: IoT Hub.

Each resource ahs its own set of events, 
**for IoT Hub the event category DeviceTelemetry** is what fits in this scenario
to satify the requirements.

The remaing options do not apply:

- use Azure Application Insignts in the LOB app:
OK but it requires coding.

- use Azure activity logs:
this provides info about (management) **actions performed on the resource** through the 
Resource Manager. 

- use Azure Resource Health:
this is another service alltogether, used to set up test probes on Azure Resources.

---

### References:

[Sources of monitoring data for Azure Monitor and their data collection methods](https://learn.microsoft.com/en-us/azure/azure-monitor/data-sources)  

[Resource Health overview](https://learn.microsoft.com/en-us/azure/service-health/resource-health-overview)  

---

## Q167:

you have an Azure subscription with a Windows Server 2019 VM named VM1.
You must enable **guest OS diagnostics** on VM1 with Azure Cloud Shell.

Complete the command:

```
$vmrg = "prod"
$vm = "vm1"
$path = "config.xml"
OPTIONS-1 -ResourceGroupName $vmrg -VMName $vm OPTIONS-2 $path
```

OPTIONS-1:
Set-AzDiagnosticSetting
Set-AzDiagnosticExtension
Set-AzVMBootdiagnostic

OPTIONS-2:
-DiagnosticsConfigurationPath
-DefaultProfile
-StorageContext

---

### Answer:

```
$vmrg = "prod"
$vm = "vm1"
$path = "config.xml"
Set-AzDiagnosticExtension -ResourceGroupName $vmrg -VMName $vm -DiagnosticsConfigurationPath $path
```

`Set-AzDiagnosticExtension` is used to  enable **guest OS diagnostics** on VMs.
This command enables Azure to retrieve **diagnostic telemetry data** from 
**Performance Monitor and Event Logs** of a VM.

This data is then sent to a **Log Analytics Workspace**.

`-DiagnosticsConfigurationPath $path` specifies a XML file that specifies which
guest OS diagnostics are to be collected and sent over.

---

### References:

[Use PowerShell to enable Azure Diagnostics in a virtual machine running Windows](https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/diagnostics-windows)  

Azure Diagnostics is the capability within Azure that enables the collection of diagnostic data on a deployed application. You can use the diagnostics extension to collect diagnostic data like application logs or performance counters from an Azure virtual machine (VM) that is running Windows.

```
$vm_resourcegroup = "myvmresourcegroup"
$vm_name = "myvm"
$diagnosticsconfig_path = "DiagnosticsPubConfig.xml"

Set-AzVMDiagnosticsExtension -ResourceGroupName $vm_resourcegroup -VMName $vm_name -DiagnosticsConfigurationPath $diagnosticsconfig_path
```
> send Diagnostics data to a Storage Account:

If the diagnostics configuration file specifies a StorageAccount element (of teh XML file)with a storage account name, then the `Set-AzVMDiagnosticsExtension` script will automatically set the diagnostics extension to send diagnostic data to that storage account. 
**For this to work, the storage account needs to be in the same subscription as the VM**.

If no StorageAccount was specified in the diagnostics configuration, 
then you need to pass in the `StorageAccountName` parameter to the cmdlet. 

If the StorageAccountName parameter is specified, then the cmdlet will always use the storage account that is specified in the parameter and not the one that is specified in the diagnostics configuration file.

> If the diagnostics storage account is in a different subscription from the VM:

you need to explicitly pass in both of the parameters to the cmdlet: 
`StorageAccountName` 
`StorageAccountKey`

```
Set-AzVMDiagnosticsExtension -ResourceGroupName $vm_resourcegroup -VMName $vm_name -DiagnosticsConfigurationPath $diagnosticsconfig_path -StorageAccountName $diagnosticsstorage_name -StorageAccountKey $diagnosticsstorage_key
```

---

[Set-AzVMDiagnosticsExtension](https://learn.microsoft.com/en-us/powershell/module/az.compute/set-azvmdiagnosticsextension?view=azps-11.5.0&viewFallbackFrom=azps-2.6.0)  

---

[Set-AzDiagnosticSetting](https://learn.microsoft.com/en-us/powershell/module/az.monitor/set-azdiagnosticsetting?view=azps-0.10.0&viewFallbackFrom=azps-2.6.0)   

enables or disables each time grain and log category for the particular resource.
The logs and metrics are stored in the specified storage account.

```
Set-AzDiagnosticSetting -ResourceId "Resource01" -Enabled $True
```

> Example 3: Enable/disable multiple metrics categories:

```
Set-AzDiagnosticSetting -ResourceId "Resource01" -Enabled $False `
-MetricCategory MetricCategory1,MetricCategory2
```

> Example 4: Enable/disable multiple log categories:

```
Set-AzDiagnosticSetting -ResourceId "Resource01" -Enabled $True `
-Category Category1,Category2
StorageAccountId   : <storageAccountId>
StorageAccountName : <storageAccountName>
```

> Example 4: Enable a time grain and multiple categories

time grain examples:
PT1M  > means that the metrics should be aggregated every 1 minute
PT10M > means that every time autoscale runs, it queries metrics for the past 10

```
Set-AzDiagnosticSetting -ResourceId "Resource01" -Enabled $True `
-Category Category1,Category2 -Timegrain PT1M
```

---

[Set-AzVMBootDiagnostic](https://learn.microsoft.com/en-us/powershell/module/az.compute/set-azvmbootdiagnostic?view=azps-11.5.0&viewFallbackFrom=azps-2.6.0)   

cmdlet modifies boot diagnostics properties of a virtual machine.

> Example 1: Enable boot diagnostics:

```
$VM = Get-AzVM -ResourceGroupName "ResourceGroup11" -Name "ContosoVM07"
Set-AzVMBootDiagnostic -VM $VM -Enable -ResourceGroupName "ResourceGroup11" -StorageAccountName "DiagnosticStorage"
Update-AzVM -VM $VM -ResourceGroupName "ResourceGroup11"
```

`-StorageAccountName`
Specifies the name of the storage account in which to save boot diagnostics data. If not provided, it will look for a StorageUri in the BootDiagnostic Profile in the PSVirtualMachine object provided in the '-VM' parameter. If StorageUri is null, it will default to used a managed storage account.

---

## Q166:

Your organization, in which your are an Azure admin, uses an Azure LB.
You must retrieve the LB info using the **Azure Instance Metadata Service (IMDS)**.

You see the following error:
`Error code: 404; no load balancer metadata is found.`

You must troubleshoot teh issue: which two things can you infer from teh question?

- the load balancer is Basic SKU and not Standard SKU
- the VM is not assciated with the LB
- there is a rate limit
- the path is misconfigured

---

### Answer:

- the load balancer is Basic SKU and not Standard SKU
- the VM is not assciated with the LB

**IMDS** provides info about currently running VMs instances behind a LB.


---

### References:

[Common error codes when using IMDS to retrieve load balancer information](https://learn.microsoft.com/en-us/azure/load-balancer/troubleshoot-load-balancer-imds)  

- 404	No load balancer metadata is found. 

Please check if your VM is using any nonbasic SKU load balancer and retry later.	
The error code indicates that your virtual machine isn't associated with a load balancer 
or the load balancer is basic SKU instead of standard.
For more information, see Quickstart: Create a public load balancer to load balance VMs using the Azure portal to deploy a standard load balancer.

- 404	API is not found: Path = "<UrlPath>", Method = "<Method>"	

The error code indicates a misconfiguration of the path.
Learn How to retrieve load balancer metadata using the Azure Instance Metadata Service (IMDS) to fix the request body and issue a retry.

- 429	Too many requests	
The error code indicates a rate limit.
For more information on rate limiting, see Azure Instance Metadata Service (IMDS).

[Retrieve load balancer metadata using Azure Instance Metadata Service (IMDS)](https://learn.microsoft.com/en-us/azure/load-balancer/howto-load-balancer-imds?tabs=windows)  

`Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -NoProxy -Uri "http://169.254.169.254:80/metadata/loadbalancer?api-version=2020-10-01" | ConvertTo-Json`

```
{
   "loadbalancer": {
    "publicIpAddresses":[
      {
         "frontendIpAddress":"51.0.0.1",
         "privateIpAddress":"10.1.0.4"
      }
   ],
   "inboundRules":[
      {
         "frontendIpAddress":"50.0.0.1",
         "protocol":"tcp",
         "frontendPort":80,
         "backendPort":443,
         "privateIpAddress":"10.1.0.4"
      },
      {
         "frontendIpAddress":"2603:10e1:100:2::1:1",
         "protocol":"tcp",
         "frontendPort":80,
         "backendPort":443,
         "privateIpAddress":"ace:cab:deca:deed::1"
      }
   ],
   "outboundRules":[
      {
         "frontendIpAddress":"50.0.0.1",
         "privateIpAddress":"10.1.0.4"
      },
      {
         "frotendIpAddress":"2603:10e1:100:2::1:1",
         "privateIpAddress":"ace:cab:deca:deed::1"
      }
    ]
   }
}
```

---

## Q165:

you are an Azure admin at an independent software vendor.
Your company uses an Azure internal LB configured inside an Azure VNet.
Your backend VMs behind the LB are listed as healthy and respond to the
health probes.
However, the BE VMs do not respond to traffic on the configured data port.

You diagnose and find that one of the VMs in the BE tries to access the 
internal LB frontend, resulting in the failure of data flow.

You must troubleshoot the issue: which TWO actions should you perform?

- use internal Application Gateway with HTTP(S)
- combine the Azure internal LB with a 3rd party proxy e.i Nginx
- configure separate BE pool VMs per application
- evaluate the NSGs for the BE pool VM, list them and reconfigure the NSG rules on the BE VMs

---

### Answer:
- use internal Application Gateway with HTTP(S)
- combine the Azure internal LB with a 3rd party proxy e.i Nginx

The scanario is the following:

All the VMs in the BE of a LB are listed as healthy in that they respond to 
the health probes with 200 OK HTTP codes within the agreed time interval.
However, the VMs do not responds to data queries therefore they do not generate
the expecteed data traffic.

**There might be multiple reasons for this behaviour!**

In this case after some investigation you have found that:

one of the VMs in the BE tries to access the internal LB frontend, resulting in the failure of data flow. The result is **intermittent connection timeout** when the data
flow goes back to the same BE that originated the flow.

---

### References:

[Troubleshoot Azure Load Balancer backend traffic responses](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-troubleshoot-backend-traffic)  

There are several possible failure scenarios:

> Scenario 1 : VMs behind a load balancer are receiving uneven distribution of traffic
 
There might be multiole reaosns for this behavior.
Azure Load Balancer distributes traffic based on connections.
Be sure to check traffic distribution per connection and not per packet.

- Cause 1: You have session persistence configured

Using source persistence distribution mode can cause an uneven distribution of traffic.
[Azure Load Balancer distribution modes](https://learn.microsoft.com/en-us/azure/load-balancer/distribution-mode-concepts)  

> Session persistence:
is also known session affinity, source IP affinity, or client IP affinity. 
It uses a 
- two-tuple (source IP and destination IP) or 
- three-tuple (source IP, destination IP, and protocol type) 

hash to route to backend instances. 
When using session persistence, connections from the same client go to the same backend instance within the backend pool.

Session persistence mode has two configuration types:

- Client IP (2-tuple) 
Specifies that successive requests from the same client IP address are handled by the same backend instance.

- Client IP and protocol (3-tuple)
Specifies that successive requests from the same client IP address and protocol combination are handled by the same backend instance.

> Use cases:

--- 

- Cause 2: You have a proxy configured:

Clients that run behind proxies might be seen as one unique client application 
from the load balancer's point of view.

---

> Scenario 2: VMs behind a load balancer aren't responding to traffic on the configured data port

**This is the scenario that is covered in the question!**
However, it is the case prior to the additional investigation!

If a backend pool VM is listed as healthy and responds to the health probes, 
but is still not participating in the load balancing, or isn't responding to
the data traffic, it may be due to any of the following reasons:

- A load balancer backend pool VM isn't listening on the data port
- Network security group is blocking the port on the load balancer backend pool VM 
- Accessing the load balancer from the same VM and NIC
- Accessing the Internet load balancer frontend from the participating load balancer backend pool VM

- Cause 1: A load balancer backend pool VM isn't listening on the data port

it may be because either:
- the target port isn't open on the participating VM 
- or he VM isn't listening on that port 

On the VM use the command: `netstat -an`
If the port isn't listed with state LISTENING, configure the proper listener port.
If the port is marked as LISTENING, then check the target application on that port for any possible issues.

---

- Cause 2: A network security group is blocking the port on the load balancer backend pool VM 

For the public load balancer, the IP address of the Internet clients will be used for communication between the clients and the load balancer backend VMs. 
**Make sure the IP address of the clients are allowed in the backend VM's network security group**.
Check the **effective NSG rules** that are applied ot the VM that does not respond to 
the datatraffic and correct the rules need it be the case. 

---

- Cause 3: Access of the internal load balancer from the same VM and network interface

**If your application hosted in the backend VM of an internal load balancer** is trying to access another application hosted in the same backend VM over the same network interface, **it's an unsupported scenario and will fail**.

You can resolve this issue via one of the following methods:

1. Configure separate backend pool VMs per application.
2. Configure the application in dual NIC VMs so each application was using its own network interface and IP address.

---

- Cause 4: Access of the internal load balancer frontend from the participating load balancer backend pool VM

**This is the scenario that is covered in the question!**
However, it is the case AFTER the additional investigation!

If an internal load balancer is configured inside a virtual network, and one of the participant backend VMs is trying to access the internal load balancer frontend, 
failures can occur when the flow is mapped to the originating VM. 

**This scenario isn't supported**.

- Resolution:

There are several ways to unblock this scenario, including using a proxy. 
Evaluate **Application Gateway** or other third party proxies

- Details:

**Internal load** balancers **don't** translate outbound originated connections to the front end of an internal load balancer because both are in private IP address space.

**Public load balancers** provide outbound connections from private IP addresses inside the virtual network to public IP addresses. 

**For internal load balancers**, this approach avoids potential SNAT port exhaustion inside a unique internal IP address space, where translation isn't required.

> Side Effect:

A side effect is that if an outbound flow from a VM in the backend pool attempts a flow to front end of the internal load balancer in its pool and is mapped back to itself, the two legs of the flow don't match. 

Because they don't match, the flow fails. 

The flow succeeds if the flow didn't map back to the same VM in the backend pool that created the flow to the front end.

When the flow maps back to itself, the outbound flow appears to originate from the VM to the front end, and the corresponding inbound flow appears to originate from the VM to itself. **From the guest operating system's point of view, the inbound and outbound parts of the same flow don't match inside the virtual machine**. 
**The TCP stack won't recognize these halves of the same flow as being part of the same flow**.
**The source and destination don't match.**

When the flow maps to any other VM in the backend pool, the halves of the flow do match and the VM can respond to the flow.

> symptom:

The symptom for this scenario is intermittent connection timeouts

> Workarounds:

Common workarounds include insertion of a proxy layer behind the internal load balancer.
[Multiple frontends for Azure Load Balancer](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-multivip-overview)  

---

## Q164:

your company uses an Azure standard public LB, you are Azure admin.
You must troubleshooot outbound connectivity with Azure LB.
You want to proactively monitor the data path availability and 
perform health probe status checks on the LB.

you create the following metrics: `getBatch API`

```
POST subscription/<the-sub-id>/metrics:getBatch?
metricNamespace=micorsoft.compute/virtualMachines&api-version=2023-03-01-preview
Host: eastus.metrics.monitor.azure.com
Content-Type: application/json
Authorization: Bearer <TOKEN-VALUE>
{
  "resourceIds":[
    ".../virtualMachines/vmss-Id1"  
    ".../virtualMachines/vmss-Id2"  
    ]
}
```

You need to retrieve the multi-dimentional definitions and metrics programmatically 
via APIs.

Select yes/no:

- the metrics `getBatch API` here allows you to prevent throttling and performance issues when querying multiple resources in a single REST request
Yes

- both VMs `vmss-Id1` & `vmss-Id2` can be spread across multiple Azure Regions

- both VMs `vmss-Id1` & `vmss-Id2` can be in the same Azure Region

---

### Answer:

- the metrics `getBatch API` here allows you to prevent throtling and performance issues when querying multiple resources in a single REST request
Yes: see reference below.

- both VMs `vmss-Id1` & `vmss-Id2` can be spread across multiple Azure Regions
No: see reference below.

- both VMs `vmss-Id1` & `vmss-Id2` can be in the same Azure Region
Yes: see reference below.


---

### References:

[Metrics Batch - Batch](https://learn.microsoft.com/en-us/rest/api/monitor/metrics-batch/batch?view=rest-monitor-2023-10-01&tabs=HTTP)  

[How to migrate from the metrics API to the getBatch API](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/migrate-to-batch-api?tabs=individual-response)  

Heavy use of the metrics API can result in **throttling or performance problems**.
`metrics:getBatch` API allows you to query multiple resources in a single REST request
therefore reducing these problems.


```
POST /subscriptions/<subscriptionId>/metrics:getBatch?metricNamespace=<resource type namespace>&api-version=2023-10-01
Host: <region>.metrics.monitor.azure.com
Content-Type: application/json
Authorization: Bearer <token>
{
   "resourceids":[<comma separated list of resource IDs>]
}
```

> Restrictions:

- All resources in a batch must be in the same subscription.
- All resources in a batch must be in the same Azure region.
- All resources in a batch must be the same resource type.

---

[Azure monitoring REST API walkthrough](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/rest-api-walkthrough?tabs=portal)  

Retrieve: 

- metric definitions
- dimension values
- metric values 

using the Azure Monitor API and use the data: 

- in your applications
- or store in a database for analysis. 
- You can also list alert rules and view activity logs 

> Authenticate Azure Monitor requests:

All requests are authenticated with Microsoft Entra ID.
One approach to authenticating the client application is to create a Microsoft Entra service principal and retrieve an authentication token.

```
POST /<tenant-id>/oauth2/token
    Host: https://login.microsoftonline.com
    Content-Type: application/x-www-form-urlencoded
    
    grant_type=client_credentials
    &client_id=<app-client-id>
    &resource=https://management.azure.com
    &client_secret=<password>
```

> Retrieve metric definition available for a service:

```
GET /subscriptions/<subscription id>/resourcegroups/<resourceGroupName>/providers/<resourceProviderNamespace>/<resourceType>/<resourceName>/providers/microsoft.insights/metricDefinitions?api-version=<apiVersion>
Host: management.azure.com
Content-Type: application/json
Authorization: Bearer <access token>
```

> Retrieve dimension values:

After the retrieving the available metric definitions, 
retrieve the range of values for the metric's dimensions. 

```
GET /subscriptions/<subscription-id>/resourceGroups/  
<resource-group-name>/providers/<resource-provider-namespace>/  
<resource-type>/<resource-name>/providers/microsoft.insights/  
metrics?metricnames=<metric>  
&timespan=<starttime/endtime>  
&$filter=<filter>  
&resultType=metadata  
&api-version=<apiVersion>   HTTP/1.1
Host: management.azure.com
Content-Type: application/json
Authorization: Bearer <access token>
```

> Example: retrieve dimension values

The following example retrieves the list of dimension values that were emitted for the API Name dimension of the **Transactions metric**, **where the GeoType dimension** has 
**a value of Primary**, for the specified time range.

```
curl --location --request GET 'https://management.azure.com/subscriptions/12345678-abcd-98765432-abcdef012345/resourceGroups/azmon-rest-api-walkthrough/providers/Microsoft.Storage/storageAccounts/ContosoStorage/providers/microsoft.insights/metrics  \
?metricnames=Transactions \
&timespan=2023-03-01T00:00:00Z/2023-03-02T00:00:00Z \
&resultType=metadata \
&$filter=GeoType eq \'Primary\' and ApiName eq \'*\' \
&api-version=2019-07-01'
-header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJ0e..meG1lWm9Y'
```

> Retrieve metric values:

After retrieving 

1. the metric definitions 
2. dimension values

retrieve the metric values.

Use the metric's `name.value` element in the filter definitions.
If no dimension filters are specified, the rolled up, aggregated metric is returned.

To fetch multiple time series with specific dimension values 
specify a filter query parameter that specifies both dimension values such as:

`"&$filter=ApiName eq 'ListContainers' or ApiName eq 'GetBlobServiceProperties'"`

To return a time series for every value of a given dimension, use an * filter such as:

`"&$filter=ApiName eq '*'"`

**The Top and OrderBy query parameters can be used to limit and order the number of time series returned**.

```
GET /subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/<resource-provider-namespace>/<resource-type>/<resource-name>/providers/microsoft.insights/metrics?metricnames=<metric>&timespan=<starttime/endtime>&$filter=<filter>&interval=<timeGrain>&aggregation=<aggreation>&api-version=<apiVersion>
Host: management.azure.com
Content-Type: application/json
Authorization: Bearer <access token>
```

> Querying metrics for multiple resources at a time:

In addition to querying for metrics on an individual resource, 
**some resource types also support querying for multiple resources** 
in a single request.

The following example shows an individual metric definitions request:

```
GET https://management.azure.com/subscriptions/12345678-abcd-98765432-abcdef012345/resourceGroups/EASTUS-TESTING/providers/Microsoft.Compute/virtualMachines/TestVM1/providers/microsoft.insights/metricdefinitions?api-version=2021-05-01
```

The following request shows the **equivalent metric definitions request** 
for multiple resources:

```
GET https://management.azure.com/subscriptions/12345678-abcd-98765432-abcdef012345/providers/microsoft.insights/metricdefinitions?api-version=2021-05-01&region=eastus&metricNamespace=microsoft.compute/virtualmachines
```

The following example shows an individual metrics request:


```
GET https://management.azure.com/subscriptions/12345678-abcd-98765432-abcdef012345/resourceGroups/EASTUS-TESTING/providers/Microsoft.Compute/virtualMachines/TestVM1/providers/microsoft.Insights/metrics?timespan=2023-06-25T22:20:00.000Z/2023-06-26T22:25:00.000Z&interval=PT5M&metricnames=Percentage CPU&aggregation=average&api-version=2021-05-01
```

Below is an equivalent metrics request for multiple resources:

```
GET https://management.azure.com/subscriptions/12345678-abcd-98765432-abcdef012345/providers/microsoft.Insights/metrics?timespan=2023-06-25T22:20:00.000Z/2023-06-26T22:25:00.000Z&interval=PT5M&metricnames=Percentage CPU&aggregation=average&api-version=2021-05-01&region=eastus&metricNamespace=microsoft.compute/virtualmachines&$filter=Microsoft.ResourceId eq '*'
```

A `Microsoft.ResourceId eq '*'` filter is added in the example for the multi resource metrics requests. The filter tells the API to return a separate time series per virtual machine resource in the subscription and region. 

Without the filter the API would return a single time series aggregating the average CPU for all VMs. 

The times series for each resource is differentiated by the Microsoft.ResourceId metadata value on each time series entry, as can be seen in the following sample return value. If there are no resourceIds retrieved by this query an empty time series"timeseries": [] is returned.

---

[Azure Monitor Metrics overview](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/data-platform-metrics#multi-dimensional-metrics)  

> Nondimensional metric:

The following table shows sample data from a nondimensional metric, network throughput. It can only answer a basic question like "What was my network throughput at a given time?"

> Multi-dimensional metrics:

One of the challenges to metric data is that it often has limited information to provide context for collected values. Azure Monitor addresses this challenge with multi-dimensional metrics.

**Metric dimensions are name/value pairs that carry more data to describe the metric value**.

> Example1:

a metric called `Available disk space` might have a dimension called `Drive` 
with values C: and D:

That dimension would allow viewing available disk space across all drives
or for each drive individually.

> Example2: Network throughput and two dimensions ("IP" and "Direction")

The following table shows sample data from a multidimensional metric, network throughput **with two dimensions called IP and Direction**. 
It can answer questions such as "What was the network throughput for each IP address?" and "How much data was sent versus received?"

Timestamp	Dimension "IP"	Dimension "Direction"	Metric value
8/9/2017 8:14	IP="192.168.5.2"	Direction="Send"	646.5 Kbps
8/9/2017 8:14	IP="192.168.5.2"	Direction="Receive"	420.1 Kbps
8/9/2017 8:14	IP="10.24.2.15"	Direction="Send"	150.0 Kbps
8/9/2017 8:14	IP="10.24.2.15"	Direction="Receive"	115.2 Kbps
...

---

[Troubleshoot Azure Load Balancer outbound connectivity issues](https://learn.microsoft.com/en-us/azure/load-balancer/troubleshoot-outbound-connection)  

---

## Q163:

Your company plans to release a new web app.
The app is deployed using several resources in Azure and will be 
available to users on the domain `company1.com` that is a DNS 
available for purchase but has not yet been purchased.

You must ensure that `company1.com` can be resolved on the Internet.
You must follow best practice guidlines.

Which three actions should you perform?

- create a NS record in your registrar that points to azure-dns servers
- create a NS record in your Azure DNS zone that points to azure-dns servers
- create a SOA record in your registrar that points to azure-dns servers
- create a SOA record in your DNS Zone that points to azure-dns servers
- configure a reverse DNS zone in Azure 
- configure a DNS Forwarder in Azure 
- purchase `company1.com` domain by using a registrar
- purchase `company1.com` domain by using Azure DNS




---

### Answer:

- purchase `company1.com` domain by using a registrar
- configure a DNS Forwarder in Azure 
- create a NS record in your registrar that points to azure-dns servers

It is not possible ot purchase `company1.com` from Azure DNS, it must be
purchased from a registrar.

Then you **create a DNS zone in Azure that will work as a DNS Forwarder**.
This Azure DNS Zone is used to resolve DNS names such as `company1.com` 
to the IP addresses where of the application resources in Azure.

> NS record:

**In your registrar** then you **create a NS record** that points to the 
Azure DNS Servers. This NS record or any NS record in general represents
the name server that host the DNS Zone for the DNS domain.

It might be the case that there is already a NS record in your registrar
that points to the DNS Server of the registrar for the domain `company1.com`. 
In this case you do not create a new NS record instead you just modify the 
existing NS record in your registrar.

If you did not add this NS record in your registrar its own NS record would
point to the DNS Server of the registrar itself and not the Azure DNS Server
and therefore the resolution of `company1.com`  to IP addresses in Azure would 
not be possible.

The names of the Azure DNS Servers are:
`ns1-01.azure-dns.com` 
`ns2-01.azure-dns.net` 
`ns3-01.azure-dns.org`
`ns4-01.azure-dns.info`

The remaining options do not apply:

- purchase `company1.com` domain by using Azure DNS:
This has already been discussed: it is not possible ot purchase `company1.com` from Azure DNS, it must be purchased from a registrar.

- configure a reverse DNS zone in Azure:
a **reverse DNS** is used to convert IP addresses to domain names.
It simply does not apply in this case.

- create a NS record in your Azure DNS zone that points to azure-dns servers:
this is unnecessary as when you create an Azure DNS Zone the NS records that point to 
`ns1-01.azure-dns.com.` 
`ns2-01.azure-dns.net.` 
`ns3-01.azure-dns.org.`
`ns4-01.azure-dns.info.`
are created automatically for you.

**Notice that there is a trailing period in the azure-dns server names**, it is not a mistake!

- create a SOA record in your DNS Zone that points to azure-dns servers:
- create a SOA record in your registrar that points to azure-dns servers:
the SOA (Start fo Authority) record is always created automatically in and by
the registrar where the domain is purchased.

---

### References:

[Tutorial: Host your domain in Azure DNS](https://learn.microsoft.com/en-us/azure/dns/dns-delegate-domain-azure-dns)   

You can use Azure DNS to host your DNS domain and manage your DNS records. 

> Advantages of hosting your DNS domain in Azure DNS:

By hosting your domains in Azure, you can manage your DNS records by using the same credentials, APIs, tools, and billing as your other Azure services.
**For example, you can use PowerShell to manage your domains rather than the specific UI of a registrar**. 

> Example:

Suppose you buy the domain `contoso.com` from a domain name registrar and then 
**create a zone with the name `contoso.com` in Azure DNS**. 
Since you're the owner of the domain, your registrar offers you the option to 
configure the name server (NS) records for your domain. 

**The registrar stores the NS records in the .com parent zone**. 
Internet users around the world are then directed to your domain in your Azure DNS zone when they try to resolve DNS records in `contoso.com`.

> Delegate the domain:

This is when you go to your registrar to create or edit the NS record to make it 
point to the  Azure DNS name servers (for your `contoso.com` Azure DNS Zone):
`ns1-01.azure-dns.com.` 
`ns2-01.azure-dns.net.` 
`ns3-01.azure-dns.org.`
`ns4-01.azure-dns.info.`

Use all four name servers, regardless of the name of your domain. 
**Domain delegation doesn't require a name server to use the same top-level domain as your domain**.

When you copy each name server address, make sure you copy the trailing period at the end of the address. The trailing period indicates the end of a fully qualified domain name. Some registrars append the period if the NS name doesn't have it at the end. To be compliant with the DNS RFC, include the trailing period.

> Verify the delegation:

`nslookup -type=SOA contoso.com`

Query the Start of Authority (SOA) record for your zone.

```
Server: ns1-04.azure-dns.com
Address: 40.90.4.1

contoso.com
        primary name server = ns1-04.azure-dns.com
        responsible mail addr = azuredns-hostmaster.microsoft.com
        serial = 1
        refresh = 3600 (1 hour)
        retry = 300 (5 mins)
        expire = 604800 (7 days)
        default TTL = 300 (5 mins)
ns1-01.azure-dns.com    internet address = 40.90.4.1
ns1-01.azure-dns.com    AAAA IPv6 address = 2603:1061::1
```

---

[Delegation of DNS zones with Azure DNS](https://learn.microsoft.com/en-us/azure/dns/dns-domain-delegation)  


---


## Q162:

You plan to deploy a LOB app in Azure.

The app must be distributed in three different layers: 
frontend, backend and data persistence layer.

To ensure high availability for each layer, you deploy two VMs per layer with an availability set.

You also plan to configure an internal LB for the backend and persistence layers.

The LOB application must have the following minimum required services running on each layer:

- FE: IIS listening on TCP:80  + internal health point on TCP:80 
- BE: IIS listening on TCP:443 + internal health point on TCP:80 
- DL: SQL Server on TCP:1433

You must configure the VMs for the backend layer.
You must configure the internal LB for the BE.
You must ensure that your solution is resilient ot hardware and software failures.
Your solution must be cost effective.

Which four action should you you perform?

- create a BE pool using the availability set
- create a BE pool using the VMs
- create a LB rule using port 80
- create a LB rule using port 443
- create an HTTP health probe using port 80
- create a LB Basic SKU
- create a LB Standard SKU

---

### Answer:

- create a LB Standard SKU
- create a BE pool using the availability set
- create an HTTP health probe using port 80
- create a LB rule using port 443

You must use a STD SKU LB to meet all the requirements.

The VMs deployed to an availabiltity set AS that you have created are deployed ot the 
same datacenter. However, they a located on different Failure Domains and therefore 
are independent of hardware failures in each other domain.

The health bprdes are necessary in order for teh LB to balance the 
traffic to the BE and the DL.

the requireMENT **create a LB rule using port 443** is a **HTTPS** rule and the 
**Basic SKU LB does not support HTTPS rules** a **STD SKU LB** must be used. 

The remaining options do not apply:

- create a BE pool using the VMs
- create a LB rule using port 80
- create a LB Basic SKU


---

### References:

---


## Q161:

your company has an Azure DNS zone named `company.com`.
You create a subdomain `development.company.com`.
The new domain should delegate to a different DNS server in Azure than `company.com`.

You must configure delegation for the domain.

What should you do?

- create a DNS Start of Authority (SOA) record for `development.company.com`
- modify the DNS Start of Authority (SOA) record for `company.com`
- create a DNS name server (NS) reord set named `development` in the  `company.com` zone
- create a DNS name server (NS) reord set named `development` in the  `dvelopment.company.com` zone


---

### Answer:

- create a DNS name server (NS) reord set named `development` in the  `company.com` zone

The concept of NS (Name Server) was examined in detail in one of the previous questions.

Here you want to create a NS record `development`set in the **apex** 
domain name zone `company.com`.
**The NS record identifies the Azure DNS name server assigned to the zone**.
You **can create, modify and delete NS record sets for delegated zones**.
You **cannot** delete top-level NS records.

The other options do not apply:

The **Start of Authority (SOA) record** for `company.com` is created automatically
and it is automatically deleted when the zone is deleted.
A SOA record is never for a delegated zone.


---

### References:

[Delegate an Azure DNS subdomain](https://learn.microsoft.com/en-us/azure/dns/delegate-subdomain)  

For example, if you own the `adatum.com domain`, you can delegate a subdomain called `engineering.adatum.com` to another separate zone that you can administer separately 
from the `adatum.com` zone.

To delegate an Azure DNS subdomain, the parent public domain must first be delegated 
to Azure DNS.
This means that `adatum.com` must first be delegated to Azure DNS.


---

[Overview of DNS zones and records](https://learn.microsoft.com/en-us/azure/dns/dns-zones-records)

---

## Q160:

you deploy three Azure Windows VMs: VM1, VM2, VM3.
These VMs host the front-end layer of a web-app.
You configure a Standard LB LB1 and its back-end pool is VM1, VM2, VM3.
You configure a balancing rule for TCP traffic only.

You also configure three public static IPs that are assigned as follows: 

IP1 -> VM1
IP2 -> LB1
IP3 -> LB1

Select yes/no:

- outbound flow on VM1 will always use IP2
- outbound flow on LB1 will use IP2 & IP3 at the same time
- outbound flow on VM3 will use IP2 & IP3 for UDP traffic

---

### Answer:

- outbound flow on VM1 will always use IP2
No

- outbound flow on LB1 will use IP2 & IP3 at the same time
Yes

- outbound flow on VM3 will use IP2 & IP3 for UDP traffic
No

- The outbound flow from VM1 will NOT use IP2:

VM01 is in the back-end of LB01
VM01 has also its own IP1
->
in this case IP1 takes precedence over IP2 & IP3

- The outbound flow on LB1 will use IP2 & IP3 at the same time:

LB1 is a **Standard SKU LB** this means that Azure  will **use** all assigned static IPs
**at the same time** for the outbound traffic.
**Basic SKU LB** do not have this feature, although all its static IPs are considered 
when deciding which one to use for the outbound traffic only one will be used.

- outbound flow on VM3 will NOT use IP2 & IP3 for UDP traffic:

The LB1 is configured with a TCP rule not a UDP rule!
There will be no balancing at all for UDP traffic inbound or outbound.

---

### References:

[Multiple frontends for Azure Load Balancer](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-multivip-overview)    

Azure Load Balancer allows you to load balance services on: 

- multiple ports
- multiple IP addresses
- or both

When you define an Azure Load Balancer, a **frontend and a backend pool configuration** 
are connected with a **load balancing rule**. 
The **health probe** referenced by the load balancing rule is used to determine the health 
of a VM on a certain port and protocol.
Based on the health probe results, new flows are sent to VMs in the backend pool.

The frontend is defined using a **three-tuple** comprised of: 

- an IP address (public or internal)
- a transport protocol (UDP or TCP)
- and a port number

| Frontend	| IP address |	protocol	| port |
| --------- | ---------- | ---------- | ---- |
| 1	        | 65.52.0.1	 | TCP        | 80   |
| 4	        | 65.52.0.2	 | TCP	      | 80   |
2	65.52.0.1	TCP	8080
3	65.52.0.1	UDP	80

#1 and #4 are an example of **multiple frontends**, where the same frontend protocol and port are reused across multiple frontend IPs.

There are two types of rules:

1. The default rule with no backend port reuse.
2. The Floating IP rule where backend ports are reused.

Azure Load Balancer allows you to mix both rule types on the same load balancer configuration. 

> Rule type #1: No backend port reuse:

green  frontend 1	65.52.0.1	TCP	80
purple frontend 2	65.52.0.2	TCP	80

in this case **each VM exposes the desired service on a unique port** 
on the backend instance IP. This service is associated with the 
frontend IP (FIP) through a rule definition.

> Rule type #2: backend port reuse by using Floating IP:


---

[Use Source Network Address Translation (SNAT) for outbound connections](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-outbound-connections)   

---

## Q159:

You configure the `companycs.com` zone in Azure DNS.
You have an **A record set** named `app` that points to an App Service.
You must make this application available by using the `webapp.companycs.com`domain name.
This new domain name must point to the public IP address of the App Service.
You must ensure that the DNS record for this new domain name is updated
or deleted automatically in case the `app.companycs.com` DNS record is 
modified or deleted.

Which type of record set should you create?

- an A alias record set
- a CNAME alias record set
- a CNAME record set
- a A record set

---

### Answer:
- an A alias record set

An **A alias record set** is aka **Address Mapping Record Set**.
It allows you to create an alternative name for a record set in your domain zone or for resources in your subscription. 

**This is different from a CNAME (canonical name) record type!**

The A alias record set will be updated or delete when the target record set is 
updated or deleted respectively. 
The CNAME record set does not have this proerty.

**The A alias record set must be for any off the following tepes in an Azre DNS Zone:** 

- a A type  record set
- an AAAA type record set
- a CNAME type record set

---

### References:

[Azure DNS alias records overview](https://learn.microsoft.com/en-us/azure/dns/dns-alias)  

Azure DNS alias records are **qualifications on** a DNS record set. 
They can reference other Azure resources from within your DNS zone.
For example, you can create an alias record set that references an Azure public IP address instead of an A record. 
As a result, the alias record set seamlessly updates itself during DNS resolution.

An alias record set is supported for the following record types in an Azure DNS zone:

- A
- AAAA
- CNAME

> Capabilities:

- Point to a public IP resource from a DNS A/AAAA record set:

You can create an A/AAAA record set and make it an alias record set to point to a public IP resource (standard or basic). The DNS record set changes automatically if the public IP address changes or is deleted. 
**Dangling DNS records that point to incorrect IP addresses are avoided**.

- Point to a **Traffic Manager profile** from a DNS A/AAAA/CNAME record set:

You can create an A/AAAA or CNAME record set and use alias records to point it to a Traffic Manager profile. 

It's especially useful when you need to route traffic at a zone apex, as traditional CNAME records aren't supported for a zone apex. For example, say your Traffic Manager profile is `myprofile.trafficmanager.net` and your business DNS zone is `contoso.com`. 
You can create an alias record set of type A/AAAA for `contoso.com` (the zone apex) and point to `myprofile.trafficmanager.net`.

- Point to an Azure Content Delivery Network (CDN) endpoint:

This alias type is useful when you create static websites using Azure storage and Azure CDN.

- Point to another DNS record set within the same zone :

Alias records can reference other record sets of the same type. 
For example, a DNS CNAME record set can be an alias to another CNAME record set. 
This arrangement is useful if you want some but not all record sets to be aliases.

> Common Scenarios:

- Prevent dangling DNS records:

A common problem with traditional DNS records is dangling records i.e. when a resource in Azure such as an App Service is deleted or its IP is changed.

For example, DNS records that haven't been updated to reflect changes to IP addresses. 
The issue occurs especially with A/AAAA or CNAME record types.
With a traditional DNS zone record, when the target IP or CNAME no longer exists, 
the DNS record associated with it has been updated manually.
**A delay in updating the DNS record can potentially cause an extended outage for the users**.

- Update DNS record-set automatically when application IP addresses change
Similar to the previous scenario.

- Host load-balanced applications at the zone apex:

**The DNS protocol prevents the assignment of CNAME (canonical name) records at the zone apex**.

 You can create CNAME records for `somelabel.contoso.com` 
 but you can't create a CNAME for `contoso.com` itself.

**This restriction presents a problem for application owners who have load-balanced applications behind Azure Traffic Manager**. Since using a Traffic Manager profile requires creation of a CNAME record, it's not possible to point to Traffic Manager profile from the zone apex.

**To resolve this issue, you can use alias records.**
Unlike CNAME records, alias records are created at the zone apex.
Application owners can use it to point their zone apex record to a Traffic Manager profile that has external endpoints.
For example, `contoso.com` and `www.contoso.com` can point to the same Traffic Manager profile. 

- Point zone apex to Azure CDN endpoints:

Just like a Traffic Manager profile, you can also use alias records to point your DNS zone apex to Azure CDN endpoints. 

---

[Tutorial: Create an alias record to support apex domain names with Traffic Manager](https://learn.microsoft.com/en-us/azure/dns/tutorial-alias-tm)  

---

## Q158:

You have an Azure RG `rg1` that contains two VMs.

VNet1: East US, 4 Windows Server VMs
VNet2: West US, 8 Linux VMs

You must configure hostname resolution for all VMs within `rg1`.

Requiremnts:

- You must minimize costs
- You must minimize complexity
- VMs within each VNet must be able to resolve each other's FQDNs
- VMs in VNet1 must be able to resolve hostnames fo VMs in VNet2
- VMs in VNet2 must be able to resolve hostnames fo VMs in VNet1

What should you do?

- enable Azure-provided resolution
- define vnet1-vnet2 peering 
- create a Private Zone in Azure DNS
- deploy a VNet-to-VNet private VPN

---

### Answer:
- create a Private Zone in Azure DNS
This is the obvious answer, refer to the references below.

The remaining options do not apply:

- define vnet1-vnet2 peering 
- deploy a VNet-to-VNet private VPN

These are definitely more expensive and complex.

- enable Azure-provided resolution
This does not work because it does not allow name resolution between VNtes
without any additional configuration. 
**VNets in Azure are by default isolated communication boundaries**, you must
do something i.e. peering or use Azure Private DNS Zones to connect them.

---

### References:

This was discussed in details in a previous question:

[Name resolution for resources in Azure virtual networks](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-name-resolution-for-vms-and-role-instances?tabs=redhat)  

There are basically 4 methods that can be use to resolve DNS names in Azure:

1. Azure DNS private zones
2. Azure-provided name resolution
3. Name resolution that uses your own DNS server (which might forward queries to the Azure-provided DNS servers)
4. Azure DNS Private Resolver

---

[What is Azure Private DNS?](https://learn.microsoft.com/en-us/azure/dns/private-dns-overview)

Azure Private DNS provides a reliable and secure DNS service for your virtual networks.
Azure Private DNS manages and resolves domain names in the virtual network without the need
to configure a custom DNS solution. 
By using private DNS zones, you can use your own custom domain name instead of the 
Azure-provided names during deployment.
Using a custom domain name helps you tailor your virtual network architecture to best suit 
your organization's needs. 
It provides a naming resolution for virtual machines (VMs) within a virtual network and
connected virtual networks.

> split-horizon:

Additionally, you can configure zones names with a split-horizon view, which allows a 
private and a public DNS zone to share the name.
This is the case of old/new version of na app pointed to by the same domain name.

> Link VNet to PZ:

To resolve the records of a private DNS zone from your virtual network, 
you must link the virtual network with the zone.
Linked virtual networks have full access and can resolve all DNS records published in 
the private zone. 

> Autoregistration:

When you enable autoregistration on a virtual network link, the DNS records for the 
virtual machines in that virtual network are registered in the private zone. 
When autoregistration gets enabled, Azure DNS will update the zone record whenever a
virtual machine gets created, changes its' IP address, or gets deleted.

---

[Configure a VNet-to-VNet VPN gateway connection - Azure portal](https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-howto-vnet-vnet-resource-manager-portal)   

**This type of configuration creates a connection between two virtual network gateways**.

The virtual networks can be in different regions and from different subscriptions.
When you connect VNets from different subscriptions, the subscriptions don't need 
to be associated with the same tenant.
It's similar to creating a Site-to-Site IPsec connection to an on-premises location.
Both connection types use a VPN gateway to provide a secure tunnel with **IPsec/IKE** 
and function the same way when communicating. 
However, they differ in the way the local network gateway is configured.


<img src="./Q158-1.png">


---

## Q157:

a client asks to assist in moving a public website and DNS domain form the 
current host into Azure.

You help the client migrate the website to an Azure App Service web app.
You also create a zone in Azure DNS for the client's `company1.com` and
create a type A record to map it to the App Service.

You must configure the DNS so that user requests to `company1.com` resolve
to the App Service app.

What should you do next?

- create an alias CNAME record for `company1.com` in Azure DNS
- configure Azure DNS as a secondary name server 
- set the TTL to 10 seconds
- delegate the `company1.com` zone to Azure DNS

---

### Answer:
- delegate the `company1.com` zone to Azure DNS

These what you have already done on the Azure side :

1. create a zone in Azure DNS for the client's `company1.com` 
2. create a type A record to map it to the App Service.

These are necessary steps according to what is described at the following reference:

[Tutorial: Create DNS records in a custom domain for a web app](https://learn.microsoft.com/en-us/azure/dns/dns-web-sites-custom-domain)   


However, the missing step is now:
- delegate the `company1.com` zone to Azure DNS

That is done on the **client's registar** by the client as they have access to their registar. They must tell the registar that they want the `company1.com`  they own to
point to the **private Azure DNS zone** that you have created for them in Azure.

Once this is in place the the DNS infrastructure will resolve to the private Azure DNS
zone and that then resolves to the App Service app.

---

### References:

[Delegation of DNS zones with Azure DNS](https://learn.microsoft.com/en-us/azure/dns/dns-domain-delegation)  

Azure DNS allows you to host a DNS zone and manage the DNS records for a domain in Azure. 

**In order for DNS queries for a domain to reach Azure DNS, the domain has to be delegated to Azure DNS from the parent domain**. 
**Keep in mind Azure DNS isn't the domain registrar**. 
This article explains how domain delegation works and how to delegate domains to Azure DNS.

> How DNS delegation works:

> top-level domains, such as com, net, org, uk or jp
> second-level domains, such as org.uk or co.jp

The domains in the DNS hierarchy are hosted using separate DNS zones.
These zones are globally distributed, hosted by DNS name servers around the world.

> DNS zone:

A domain is a unique name in the Domain Name System, for example `contoso.com`.
**A DNS zone is used to host the DNS records for a particular domain**.

For example, the domain `contoso.com` may contain several DNS records such as:
`mail.contoso.com` (for a mail server) 
`www.contoso.com` (for a website).

> Domain registrar:
A domain registrar is a company who can provide Internet domain names.
They verify if the Internet domain you want to use is available and allow you to purchase it. 

> Resolution and delegation:

There are two types of DNS servers:

1. authoritative DNS server:
hosts DNS zones. 
It answers DNS queries for records in those zones only.
**Azure DNS provides an authoritative DNS service**.

2. recursive DNS server:
doesn't host DNS zones. 
It answers all DNS queries by calling authoritative DNS servers 
to gather the data it needs.

**Cloud Services and VMs in Azure are automatically configured to use a recursive DNS service that is provided separately as part of Azure's infrastructure**.
DNS clients in PCs or mobile devices typically call a recursive DNS server to do any DNS queries the client applications need.

> The DNS query and resoulution process:

When a **recursive DNS server receives a query for a DNS record** such as 
`www.contoso.com`. 

it **first needs to find the name server hosting the zone for** the `contoso.com` domain. To find the name server, it starts at the root name servers, and from there finds the name servers hosting the `com` zone. It then queries the com name servers to find the name servers hosting the `contoso.com` zone. 

Finally, it's able to query these name servers for `www.contoso.com`.
This procedure is called resolving the DNS name.
Strictly speaking, DNS resolution includes more steps such as following CNAMEs, but that's not important to understanding how DNS delegation works.

> NS record: How does a parent zone point to the name servers for a child zone?

It does this using a special type of DNS record called an NS record (Name Server).
For example, the root zone contains NS records for com and shows the name servers 
for the com zone.
In turn, the `com` zone contains NS records for `contoso.com`, which shows the name servers for the `contoso.com` zone. 

> Delegation:

Setting up the NS records for a child zone in a parent zone is called delegating the domain.
Each delegation actually has two copies of the NS records; one in the parent zone pointing to 
the child, and another in the child zone itself.
The `contoso.net` zone contains the NS records for `contoso.net` 
(in addition to the NS records in net). 
These records are called **authoritative NS records** and they sit at the **apex** of the child zone.


<img src="./Q157-1.png">

---

[Azure DNS FAQ](https://learn.microsoft.com/en-us/azure/dns/dns-faq)    

[Overview of DNS zones and records](https://learn.microsoft.com/en-us/azure/dns/dns-zones-records)  

---

## Q156:

You ned to connect a VNet to a private DNS Zone to support new application 
namespaces in the private zone. The VNet already has VMs assigned to it and
has existing private DNS zones assigned to it.

What should you do first?

- set up a new VNet and ssign the private DNS to this VNet and move the existing VMs to it

- remove the existing VMs from the VNet

- set the existing VMs to support the new DNS zone via the Windows Server IP Configuration DNS settings app

- add the new private DNS zone to the existing VNet

---

### Answer:
- add the new private DNS zone to the existing VNet

To complete this task this is the easist option, you can indeed add 
a private DNS zone to a VNet even if this has already other private DNS Zones 
assigned to it.

The remaining options do not apply:

- remove the existing VMs from the VNet:

**In this case this is not required**. However, this **would be required**
if the VNet did not already have private DNS zones assigned to it!

- set up a new VNet and ssign the private DNS to this VNet and move the existing VMs to it
This would work for the new private zone but it would remove the old private zone
to the same VNet.


---

### References:

[Tutorial: Host your domain in Azure DNS](https://learn.microsoft.com/en-us/azure/dns/dns-delegate-domain-azure-dns)  

> Advantages of using Azure DNS:

By hosting your domains in Azure [Azure DNS], you can manage your DNS records by using the same credentials, APIs, tools, and billing as your other Azure services.

> Example:

Suppose you buy the domain `contoso.com` from a domain name registrar and 
then create a **DNS zone** with the name `contoso.com` in Azure DNS. 

Since you're the owner of the domain, your registrar offers you the option to configure the name server (NS) records for your domain. 
The registrar stores the NS records in the `.com` parent zone. 
Internet users around the world are then directed to your domain in your Azure DNS zone when they try to resolve DNS records in `contoso.com`.

This is the same as the reference below that illustrate the case for the 
specific case of an app in Azure App Server:

[Tutorial: Create DNS records in a custom domain for a web app](https://learn.microsoft.com/en-us/azure/dns/dns-web-sites-custom-domain)   

---

The following reference has already been discussed in detail:

[What is Azure Private DNS?](https://learn.microsoft.com/en-us/azure/dns/private-dns-overview)   

Azure Private DNS provides a reliable and secure DNS service for your virtual networks.
Azure Private DNS manages and resolves domain names in the virtual network without the need to configure a custom DNS solution. 

---

## Q155:

Your company plans to release a new web app  called `applicationx`.
This application is deployed by using App Service in Azure and will
be available to users of the `company1.com` domain name that has 
already been purchased.

You configure `company1.com` Azure DNS zone and delegate it to 
Azure DNS.

You must ensure that web apps can be accessed by using the 
`company1.com` domain name.

You decide to use PS to accomplish this task.
Complte the command.

```
New-AzDnsRecordSet -Name OPTIONS-1 `
-RecordType OPTIONS-2 `
-ZoneName "company1.com" `
--ResourceGroupName "rg1"  `
-Ttl 600 `
-DnsRecords "<the ip address of the Azure App Service>"


New-AzDnsRecordSet -Name OPTIONS-3 `
-RecordType OPTIONS-4 `
-ZoneName "company1.com" `
--ResourceGroupName "rg1"  `
-Ttl 600 `
-DnsRecords (New-AzDnsRecordConfig -Value "applicationx.azurewebsites.net")
```

OPTIONS-1/3:
"@"
"company1.com"
"www.company1.com"
"applicationx.azurewebsites.net"

OPTIONS-2/4:
"A"
"AAAA"
"TXT"
"CNAME"

---

### Answer:

```
New-AzDnsRecordSet -Name "@" `
-RecordType "A" `
-ZoneName "company1.com" `
--ResourceGroupName "rg1"  `
-Ttl 600 `
-DnsRecords "<the ip address of the Azure App Service>"


New-AzDnsRecordSet -Name "@" `
-RecordType "TXT" `
-ZoneName "company1.com" `
--ResourceGroupName "rg1"  `
-Ttl 600 `
-DnsRecords (New-AzDnsRecordConfig -Value "applicationx.azurewebsites.net")
```

---

### References:

[Tutorial: Create DNS records in a custom domain for a web app](https://learn.microsoft.com/en-us/azure/dns/dns-web-sites-custom-domain)   

You can configure Azure DNS to host a custom domain for your web apps.

> To do this, you have to create three records:

1. A root "A" record pointing to contoso.com
2. A root "TXT" record for verification
3. A "CNAME" record for the www name that points to the A record

> A root "A" record pointing to contoso.com: apex record

```
New-AzDnsRecordSet -Name "@" -RecordType "A" -ZoneName "contoso.com" -ResourceGroupName "MyAzureResourceGroup" -Ttl 600 -DnsRecords (New-AzDnsRecordConfig -IPv4Address "<ip of web app service>")
```

> Create the TXT record: domain ownership verification record

```
New-AzDnsRecordSet -ZoneName contoso.com -ResourceGroupName MyAzureResourceGroup -Name "@" -RecordType "txt" -Ttl 600 -DnsRecords (New-AzDnsRecordConfig -Value  "contoso.azurewebsites.net")
```

> Create the CNAME record:

CNAME means **canonical name** tha tis another name for your website.

In this case the other nam is `contoso.azurewebsites.net` and we want the 
Azure DNS to translate it to `www.contoso.com`.


```
New-AzDnsRecordSet -ZoneName contoso.com -ResourceGroupName "MyAzureResourceGroup" -Name "www" -RecordType "CNAME" -Ttl 600 -DnsRecords (New-AzDnsRecordConfig -cname "contoso.azurewebsites.net")
```

> Test the new records:

You can validate the records were created correctly by querying the "www.contoso.com" and "contoso.com" using nslookup, as shown below:

```
nslookup
Default Server:  Default
Address:  192.168.0.1
...

```

> Add custom host names:

After the names have been registered with the Azure DNS as shown above 
you can add the custom host names to your web app:

```
set-AzWebApp -Name contoso -ResourceGroupName <your web app resource group> -HostNames @("contoso.com","www.contoso.com","contoso.azurewebsites.net")
```

---

[Set-AzWebApp](https://learn.microsoft.com/en-us/powershell/module/az.websites/set-azwebapp?view=azps-11.5.0)  


---

## Q154:

you are asked to configure Azure DNS records for the root domain
`company1.com` and add two records to that zone for independently
hosted websites on different servers but using the same alias `www`.

These servers will **round-robin** the DNS requets to provide high
availability of the service.

The TTL for the records must be set to 1h.

How should you complete the script?

```
OPTIONS-1 -Name "@" -RecordType A -ZoneName "company1.com" `
--ResourceGroupName "rg1"  `
-Ttl OPTIONS-2 `
-DnsRecords (OPTIONS-3 -IPv4Address "1.2.3.4")

$aRecord = @()
$aRecord += OPTIONS-4 -IPv4Address "2.3.4.5"
$aRecord += OPTIONS-4 -IPv4Address "3.4.5.6"

OPTIONS-5 -Name "www" -ZoneName "company1.com" `
--ResourceGroupName "rg1"  `
-Ttl OPTIONS-2 `
-DnsRecords $aRecord
```

OPTIONS-1/3/5/4:
New-AzDnsRecordConfig
Set-AzDnsRecordConfig
New-AzDnsRecordSet
New-AzDnsZone

OPTIONS-2:
1
60
3600

---

### Answer:

```

# New-AzDnsRecordConfig: to create a record in a recordset
# New-AzDnsRecordSet: to map recordsets to a zone name

# create a record set that holds a single A type record 
# this A record is for the IP address 1.2.3.4 and 
# it points the zone name company1.com to it.
# the thing to notice here that the -DnsRecords embeds the 
# call to New-AzDnsRecordConfig.
# This is the cose anly when there is a sigle record in the set.

# ------------------------------------------------------------------
# another important fact here is that teh name fo the record is: @
# this is a special name that identifies the ROOT domain!
# ------------------------------------------------------------------

New-AzDnsRecordSet -Name "@" -RecordType A -ZoneName "company1.com" `
--ResourceGroupName "rg1"  `
-Ttl 3600 `
-DnsRecords (New-AzDnsRecordConfig -IPv4Address "1.2.3.4")

# in this case instead there are multiple records in the set 
# therefore an aobject must be used to hold them before passing it 
# to New-AzDnsRecordSet.

$aRecord = @()
$aRecord += New-AzDnsRecordConfig -IPv4Address "2.3.4.5"
$aRecord += New-AzDnsRecordConfig -IPv4Address "3.4.5.6"

# this time -Name "www" and NOT @ that is this is an ALIAS

New-AzDnsRecordSet -Name "www" -ZoneName "company1.com" `
--ResourceGroupName "rg1"  `
-Ttl 3600 `
-DnsRecords $aRecord
```

> Ttl is expressed in seconds: 3600 s = 1 h

TTL (time to live) is the amount of time in seconds a **record should be chached**
**by the clients** before a new client DNS query is requested to teh DNS Server.

Notice that there are now the following records:

company1.com -> 1.2.3.4
www.company1.com -> 2.3.4.5
www.company1.com -> 3.4.5.6
 

---

### References:

[New-AzDnsRecordSet](https://learn.microsoft.com/en-us/powershell/module/az.dns/new-azdnsrecordset?view=azps-11.5.0&viewFallbackFrom=azps-2.6.0)  

creates a new Domain Name System (DNS) record set with the specified name and type in the specified zone. 

[New-AzDnsRecordConfig](https://learn.microsoft.com/en-us/powershell/module/az.dns/new-azdnsrecordconfig?view=azps-11.4.0)   
creates a local DnsRecord object.
An array of these objects is passed to the New-AzDnsRecordSet cmdlet using the DnsRecords parameter to specify the records to create in the record set.

> Example 1: Create a RecordSet of type A
```

$Records = @()
$Records += New-AzDnsRecordConfig -IPv4Address 1.2.3.4
$Records += New-AzDnsRecordConfig -IPv4Address 2.3.4.5
# add more records to the same record set object..

$RecordSet = New-AzDnsRecordSet -Name "www" `
-RecordType A `
-ResourceGroupName "MyResourceGroup" `
-TTL 3600 `
-ZoneName "myzone.com" `
-DnsRecords $Records

# When creating a RecordSet containing a single record, 
# the above sequence can also be condensed into a single line:

$RecordSet = New-AzDnsRecordSet -Name "www" `
-RecordType A `
-ResourceGroupName "MyResourceGroup" `
-TTL 3600 -ZoneName "myzone.com" `
-DnsRecords (New-AzDnsRecordConfig -IPv4Address 1.2.3.4)

# To create a record set containing multiple records, 
# use New-AzDnsRecordConfig to add each record to the $Records array,
# then call New-AzDnsRecordSet, as follows:

$Records = @()
$Records += New-AzDnsRecordConfig -IPv4Address 1.2.3.4
$Records += New-AzDnsRecordConfig -IPv4Address 5.6.7.8

$RecordSet = New-AzDnsRecordSet -Name "www" `
-RecordType A `
-ResourceGroupName "MyResourceGroup" `
-TTL 3600 `
-ZoneName "myzone.com" `
-DnsRecords $Records
```

[Set-AzDnsRecordSet](https://learn.microsoft.com/en-us/powershell/module/az.dns/set-azdnsrecordset?view=azps-11.5.0&viewFallbackFrom=azps-2.6.0)  

updates a record set in the Azure DNS service from a local RecordSet object.
The record set is not updated if it has been changed in Azure DNS since the local RecordSet object was retrieved. 
**This provides protection for concurrent changes**. 

```
$RecordSet = Get-AzDnsRecordSet -ResourceGroupName MyResourceGroup -ZoneName myzone.com -Name www -RecordType A
Add-AzDnsRecordConfig -RecordSet $RecordSet -Ipv4Address 172.16.0.0
Add-AzDnsRecordConfig -RecordSet $RecordSet -Ipv4Address 172.31.255.255
Set-AzDnsRecordSet -RecordSet $RecordSet

# These cmdlets can also be piped:

Get-AzDnsRecordSet -ResourceGroupName MyResourceGroup -ZoneName myzone.com -Name www -RecordType A | Add-AzDnsRecordConfig -Ipv4Address 172.16.0.0 | Add-AzDnsRecordConfig -Ipv4Address 172.31.255.255 | Set-AzDnsRecordSet
```
---

[Manage DNS records and recordsets in Azure DNS using Azure PowerShell](https://learn.microsoft.com/en-us/azure/dns/dns-operations-recordsets)   

> How Azure DNS organizes DNS records into DNS record sets?

In Azure DNS, records are specified by using relative names. 

- what is the difference between FQDN and relative names?
A fully qualified domain name (FQDN) includes the zone name, 
whereas a relative name does not. 

For example, the **relative record name** `www` in the zone `contoso.com` 
gives the fully qualified record name `www.contoso.com`.

> apex record (@) aka root record

An apex record is a DNS record at the root (or apex) of a DNS zone.

For example, in the DNS zone `contoso.com` an **apex record** also has the fully qualified name `contoso.com` (this is sometimes called a **naked domain**). 
**By convention, the relative name '@'** is used to represent apex records.

> Record types:

Each DNS record has a **name and a type**. 
Records are organized into various types according to the data they contain.
The most common type is an **'A' record, which maps a name to an IPv4 address**. 
Another common type is an **'MX' record, which maps a name to a mail server**.

Azure DNS supports all common DNS record types: 
A, AAAA, CAA, CNAME, MX, NS, PTR, SOA, SRV, and TXT = SPF. 

> Record sets:

Azure DNS manages all DNS records using record sets. 
An Azure record set is the collection of DNS records in a zone 
that **have the same name and are of the same type**. 


Sometimes you need to create more than one DNS record with a given name and type.

- Example:
For example, suppose the `www.contoso.com` web site is hosted on 
two different IP addresses. 

The website requires two different A records, one for each IP address
and together they give the Azure DNS record set: 

```
www.contoso.com.        3600    IN    A    134.170.185.46
www.contoso.com.        3600    IN    A    134.170.188.221
```

> SOA & CNAME record types are exceptions!

**The SOA and CNAME record types are exceptions.**
The DNS standards don't permit multiple records with the same name for these types.
therefore these record sets can only contain a single record.

> Create a new DNS record

To create a new record set, it has to have a different name and type than any existing records. If the new record has the same name and type as an existing record, you'll need to add it to the existing record set.

> Create 'A' record for the apex in a new record set: New-AzDnsRecordSet

To create a record set at the 'apex' of a zone (in this case, 'contoso.com'), 
use the record set name '@' (excluding quotation marks):

```
New-AzDnsRecordSet -Name "@"  `
-RecordType A `
-ZoneName "contoso.com" `
-ResourceGroupName "MyResourceGroup" `
-Ttl 3600 `
-DnsRecords (New-AzDnsRecordConfig -IPv4Address "1.2.3.4")
```

> Create 'A' record as ALIAS in a new record set: New-AzDnsRecordSet

The following example creates a record set with the **relative name** 
`www` in the DNS Zone `contoso.com`

```
New-AzDnsRecordSet -Name "www" `
-RecordType A `
-ZoneName "contoso.com" `
-ResourceGroupName "MyResourceGroup" `
-Ttl 3600 `
-DnsRecords (New-AzDnsRecordConfig -IPv4Address "1.2.3.4")
```

> Create multiple A records in a recordset:

This is the case when the same DNS name points to several physical IPv4.

```
$aRecords = @()
$aRecords += New-AzDnsRecordConfig -IPv4Address "1.2.3.4"
$aRecords += New-AzDnsRecordConfig -IPv4Address "2.3.4.5"
New-AzDnsRecordSet -Name www –ZoneName "contoso.com" `
-ResourceGroupName MyResourceGroup `
-Ttl 3600 `
-RecordType A `
-DnsRecords $aRecords
```

> record set metadata:

You can associate **application-specific data** with each record set, 
as key-value pairs. 

```
New-AzDnsRecordSet -Name "www" `
-RecordType A `
-ZoneName "contoso.com" `
-ResourceGroupName "MyResourceGroup" `
-Ttl 3600 `
-DnsRecords (New-AzDnsRecordConfig -IPv4Address "1.2.3.4") `
-Metadata @{ dept="finance"; environment="production" }
```

> empty records:

Empty records in Azure DNS can act as a **placeholder** to 
**reserve a DNS name before creating DNS records**. 

```
New-AzDnsRecordSet -Name "www" `
-RecordType A `
-ZoneName "contoso.com" `
-ResourceGroupName "MyResourceGroup" `
-Ttl 3600 -DnsRecords @()
```

> Create records of other types (other than A type records)

This is a "AAAA" for an IPv6.

```
New-AzDnsRecordSet -Name "test-aaaa" -RecordType AAAA -ZoneName "contoso.com" -ResourceGroupName "MyResourceGroup" -Ttl 3600 -DnsRecords (New-AzDnsRecordConfig -Ipv6Address "2607:f8b0:4009:1803::1005")
```

Azure DNS supports all common DNS record types: 
A, AAAA, CAA, CNAME, MX, NS, PTR, SOA, SRV, and TXT = SPF. 
There are examples for each of these types.

> List record sets:
```
$recordsets = Get-AzDnsRecordSet -ZoneName "contoso.com" -ResourceGroupName "MyResourceGroup" 
# -RecordType A
# | where {$_.Name.Equals("www")}
```

---

## Q153:

you must configure public IP addressing for four identicallty configured backend VMs all located in the same Azure VNet.

Your solutiomn must meet the requirements:

- minimize the VMs attack surface
- minimize administrative complecity
- minimize maintenance complecity
- minimize costs

What should you do?

- assign a public IP address to a public LB and use NAT
- assign a public IP address to an Azure VPN Gateway and use a public  LB 
- assign a public IP to each VM and use NSG 
- assign a public IP to each VM NIC and use JIT VM access

---

### Answer:
- assign a public IP address to a public LB and use NAT
This configuration meets all the requirements

The following do not apply:

this are much more complex and costly
- assign a public IP address to an Azure VPN Gateway and use a public  LB 
- assign a public IP to each VM and use NSG 

the following does not even address the requiremtes as JIT is a authentication & authorization mechanism part of Microsoft Defender
- assign a public IP to each VM NIC and use JIT VM access

---

### References:

---

## Q152:

You deploy a group of new VMs to an Azure subscription.
These VMs are the frontend layer of an application.
You plan to configure a Satndard SKU Load Balancer for these VMs.
You need to configure the public IP that you will assign to the LB.

Select yes/no:

- you can only use a Standard SKU IP eith a Standard SKU LB
- Standard SKU public IP allow inbound communication by default
- Standard LBs support standard SKU IP only
- you can specify the IP address of a public IP resource


---

### Answer:

- you can only use a Standard SKU IP with a Standard SKU LB
Yes
- Standard LBs support standard SKU IP only
Yes

- Standard SKU public IP allow inbound communication by default
No
- you can specify the IP address of a public IP resource
No: you cannot do this.

With a Standard SKU LB you must use a Standard SKU IP which contrary to a Basic SKU IP is **secure by default** that is on the Standard SKU IP all the inbound communication are blocked by default.

In order to allow inblound connection to a Standard SKU IP you must use  a NSG on which there are rules to allow inbound connection as required.

LB has two allocation methods:

- Basic:
Basic public IP addresses are commonly used for when there's no dependency on the IP address.

> IP address assignment:

- static: 
this is the method to use to assign a public IP as the LB frontend public IP address.
The resource is assigned an IP address at the time it's created. 
The IP address is released when the resource is deleted.

**Even when you set the allocation method to static, you cannot specify the actual IP address assigned to the public IP address resource**.
Azure assigns the IP address from a pool of available IP addresses in the Azure location the resource is created in.

> Static public IP addresses are commonly used in the following scenarios:

- You use TLS/SSL certificates linked to an IP address
- Your Azure resources communicate with other apps or services that use an IP address-based security model.
- DNS name resolution, where a change in IP address would require updating A records
- When you must update firewall rules to communicate with your Azure resources

- dynamic:
The IP address isn't given to the resource at the time of creation when selecting dynamic. The IP is assigned when you associate the public IP address with a resource. The IP address is released when you stop, or delete the resource.

> Standard SKU Public IP Availability Zone:

Public IP addresses with a standard SKU can be created as 

- nonzonal:
A "nonzonal" public IP address is placed into a zone for you by Azure and doesn't give a guarantee of redundancy.
**All basic SKU public IP addresses are created as non-zonal**.

- zonal
- zone-redundant in regions that support availability zones.

A **zone-redundant IP** is created in all zones for a region and can survive any single zone failure.

---

[What is Azure Load Balancer?](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-overview)    

<img src="./Q152-1.png">

---

### References:

[Public IP addresses](https://learn.microsoft.com/en-us/azure/virtual-network/ip-services/public-ip-addresses)   

Public IP addresses allow Internet resources to communicate inbound to Azure resources. 

The following resources can be associated with a public IP address:

Virtual machine network interfaces
Virtual Machine Scale Sets
Public Load Balancers
Virtual Network Gateways (VPN/ER)
NAT gateways
Application Gateways
Azure Firewalls
Bastion Hosts
Route Servers
Api Management

> SKU: Standard or Basic.
The SKU determines their 
- functionality including allocation method
- feature support
- the resources they can be associated with



---

## Q151:

You are an Azure admin for an e-commerce.

Your organization wants to access over a private endpoint in your VNet:
- Azure SQL Database services 
- azure-hosted customer-owned resources

You use **Azure Private Link** to achiev the desired outcome.
You must select the source IP address for the APL.
You have created the following ARM template.

```
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "languageVersion": "",
  "contentVersion": "",
  "apiProfile": "",
  "definitions": { },
  "parameters": { },
  "variables": { },
  "functions": [ ],
  "resources": [ 
    "name": "orgVNet",
    "type": "Microsoft.Network/virtualNetwors",
    "apiVersion": "2023-02-01",
    "location": "EastUS",
    "properties": {
            "addressSpace": {
               "addressPrefix": ["10.1.0.0/16"] 
            },
            "subnets": [
              {
                "name": "default",   
                "properties": {
                  "addressPrefix": "10.1.4.0/24", 
                  "privateLinkServiceNetworkPolicies": "Disabled" 
                },
              },
            ]
        },
  ], 
  "outputs": { }
}
```

Select yes/no:

- the `privateLinkServiceNetworkPolicies`: `Disabled` is only applicable for the specific private IP address you select as the source IP of teh Private Link service

- the `privateLinkServiceNetworkPolicies`: `Disabled` setting is configured automatically if you use teh Azure Portal to create the Private Link service

- for other resources in the subnet the newtowrk traffic is filtered by the Access Control List (ACL)


---

### Answer:

- the `privateLinkServiceNetworkPolicies`: `Disabled` is only applicable for the specific private IP address you select as the source IP of teh Private Link service
Yes
- the `privateLinkServiceNetworkPolicies`: `Disabled` setting is configured automatically if you use teh Azure Portal to create the Private Link service
Yes

- for other resources in the subnet the newtowrk traffic is filtered by the Access Control List (ACL)
No

---

### References:

[Disable network policies for Private Link service source IP](https://learn.microsoft.com/en-us/azure/private-link/disable-private-link-service-network-policy?tabs=private-link-network-policy-powershell)   

To choose a source IP address for your Azure Private Link service, the explicit disable setting **is required on the subnet**: 
`privateLinkServiceNetworkPolicies` 

This setting only applies for the specific private IP address you chose as the source IP of the Private Link service. 
For other resources in the subnet, access is controlled based on the network security group security rules definition.

**When you use the portal to create an instance of the Private Link service, this setting is automatically disabled**. eployments using any Azure client (PowerShell, Azure CLI, or templates) require an extra step to change this property.

---

[What is a private endpoint?](https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-overview)  

A private endpoint is a network interface that uses a private IP address from your virtual network. 

This network interface connects you privately and securely to a service that's powered by Azure Private Link. 

**By enabling a private endpoint, you're bringing the service into your virtual network**.

The service could be an Azure service such as:

Azure Storage
Azure Cosmos DB
Azure SQL Database
Your own service, using Private Link service.

> Private endpoints enable connectivity between the customers from the same:

Virtual network
Regionally peered virtual networks
Globally peered virtual networks
On-premises environments that use VPN or Express Route
Services that are powered by Private Link

- Network connections can be initiated only by clients that are connecting to the private endpoint. 

- Connections can be established in a single direction only.

- A read-only network interface is automatically created for the lifecycle of the private endpoint. The interface is assigned a dynamic private IP address from the subnet that maps to the private-link resource. The value of the private IP address remains unchanged for the entire lifecycle of the private endpoint.

- The private endpoint must be deployed in the same region and subscription as the virtual network.

- Multiple private endpoints can be created with the same private-link resource.

- Multiple private endpoints can be created on the same or different subnets within the same virtual network. 

- The subscription that contains the private link resource must be registered with the Microsoft network resource provider. 

- The subscription that contains the private endpoint must also be registered with the Microsoft network resource provider.

> A private-link resource is the destination target of a specified private endpoint. 

---

[Network security of private endpoints](https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-overview#network-security-of-private-endpoints)  

When you use private endpoints, traffic is secured to a private-link resource. The platform validates network connections, allowing only those that reach the specified private-link resource. To access more subresources within the same Azure service, more private endpoints with corresponding targets are required. In the case of Azure Storage, for instance, you would need separate private endpoints to access the file and blob subresources.

**Private endpoints provide a privately accessible IP address for the Azure service, but do not necessarily restrict public network access to it**.

> Private endpoints support network policies:

- Network Security Groups (NSG)
- User Defined Routes (UDR)
- Application Security Groups (ASG)

---

[Manage network policies for private endpoints](https://learn.microsoft.com/en-us/azure/private-link/disable-private-endpoint-network-policy?tabs=network-policy-portal)  

network policies:

- Network Security Groups (NSG)
- User Defined Routes (UDR)
- Application Security Groups (ASG)

**By default, network policies are disabled for a subnet in a virtual network**. To use network policies network policy support must be enabled for the subnet. 

**This setting only applies to private endpoints in the subnet and affects all private endpoints in the subnet.**

To choose a source IP address for your Azure Private Link service, the explicit disable setting `privateLinkServiceNetworkPolicies` 
is required on the subnet. This setting only applies for the specific private IP address you chose as the source IP of the Private Link service. 

> What does it mean?

Eaxh Private Link service deployed to a subnet takes an IP address from the IP address space of the subnet it is deployed to. If any Network Policies are applied to the subnets then these would also be applied to the IP reserved for the Private Link service in the same subnet.
This interferes which the Private Link Service.

For this reason when a Private Link service is deployed to a subnet the 
following must be present in the ARM template that deployes it: `"privateLinkServiceNetworkPolicies": "Disabled"`

If the OPrivate Link is deployed throught teh Azure Portal this happens automatically. However, this **must be explicit when the Private Link Service is deplyed by**:

> ARM template, Azure CLI, PowerShell 

> Example:

```
"resources": [ 
    "name": "orgVNet",
    "type": "Microsoft.Network/virtualNetwors",
    "apiVersion": "2023-02-01",
    "location": "EastUS",
    "properties": {
            "addressSpace": {
               "addressPrefix": ["10.1.0.0/16"] 
            },
            "subnets": [
              {
                "name": "default",   
                "properties": {
                  "addressPrefix": "10.1.4.0/24", 
                  "privateLinkServiceNetworkPolicies": "Disabled" 
                },
              },
            ]
        },
  ],
```

> Powershell:

```
$subnet = 'default'

$net = @{
    Name = 'myVNet'
    ResourceGroupName = 'myResourceGroup'
}
$vnet = Get-AzVirtualNetwork @net

($vnet | Select -ExpandProperty subnets | Where-Object {$_.Name -eq $subnet}).privateLinkServiceNetworkPolicies = "Disabled"

$vnet | Set-AzVirtualNetwork
```
> Azure CLI:

```
az network vnet subnet update \
    --name default \
    --vnet-name MyVnet \
    --resource-group myResourceGroup \
    --disable-private-link-service-network-policies yes
```

---

[Configure an application security group with a private endpoint](https://learn.microsoft.com/en-us/azure/private-link/configure-asg-private-endpoint?tabs=portal)  

Azure Private Link private endpoints support application security groups (ASGs) for network security. **You can associate private endpoints with an existing ASG in your current infrastructure alongside virtual machines and other network resources**.

> Powershell:

```
## Place the previously created webapp into a variable. ##
$webapp = Get-AzWebApp -ResourceGroupName myResourceGroup -Name myWebApp1979

## Create the private endpoint connection. ## 
$pec = @{
    Name = 'myConnection'
    PrivateLinkServiceId = $webapp.ID
    GroupID = 'sites'
}
$privateEndpointConnection = New-AzPrivateLinkServiceConnection @pec

## Place the virtual network you created previously into a variable. ##
$vnet = Get-AzVirtualNetwork -ResourceGroupName 'myResourceGroup' -Name 'myVNet'

## Place the application security group you created previously into a variable. ##
$asg = Get-AzApplicationSecurityGroup -ResourceGroupName 'myResourceGroup' -Name 'myASG'

## Create the private endpoint. ##
$pe = @{
    ResourceGroupName = 'myResourceGroup'
    Name = 'myPrivateEndpoint'
    Location = 'eastus'
    Subnet = $vnet.Subnets[0]
    PrivateLinkServiceConnection = $privateEndpointConnection
    ApplicationSecurityGroup = $asg
}
New-AzPrivateEndpoint @pe
```

> Azure CLI:

```
id=$(az webapp list \
    --resource-group myResourceGroup \
    --query '[].[id]' \
    --output tsv)

asgid=$(az network asg show \
    --name myASG \
    --resource-group myResourceGroup \
    --query id \
    --output tsv)

az network private-endpoint create \
    --connection-name myConnection \
    --name myPrivateEndpoint \
    --private-connection-resource-id $id \
    --resource-group myResourceGroup \
    --subnet myBackendSubnet \
    --asg id=$asgid \
    --group-id sites \
    --vnet-name myVNet    
```

---

[What is Azure Private Link?](https://learn.microsoft.com/en-us/azure/private-link/private-link-overview)  

Azure Private Link enables you to access:

- Azure PaaS Services (for example, Azure Storage and SQL Database) 
- Azure hosted customer-owned/partner services 

over a private endpoint in your virtual network.
Traffic between your virtual network and the service travels the Microsoft backbone network.

**Exposing your service to the public internet is no longer necessary.**
**You can create your own private link service in your virtual network and deliver it to your customers.** 

> Key benefits:

- Privately access services on the Azure platform:

- On-premises and peered networks:
Access services running in Azure from on-premises over 
 - ExpressRoute private peering
 - VPN tunnels 
 -  peered virtual networks 

 using private endpoints. 

 There's no need to configure ExpressRoute Microsoft peering or traverse the internet to reach the service. Private Link provides a secure way to migrate workloads to Azure.

- Protection against data leakage:
A private endpoint is mapped to an instance of a PaaS resource instead of the entire service. 
Consumers can only connect to the specific resource.
**For example: you must have a Private Link EP for ech of the subservices of a SA thus one PLED for Blobs, one for Queues, one for Table, one for Files**

- Global reach: Connect privately to services running in other regions.
The consumer's virtual network could be in region A and it can connect to services behind Private Link in region B.

- Extend to your own services: 
Enable the same experience and functionality to render your service privately to consumers in Azure. 
**Place your service behind a standard Azure Load Balancer**, you can enable it for Private Link. 
**The consumer can then connect directly to your service using a private endpoint in their own virtual network**. 
You can manage the connection requests using an `approval call flow`. **Azure Private Link works for consumers and services belonging to different Microsoft Entra tenants**.

---

## Q150:

you work for a company that hosts its infrastructure in Azure:
Vnets, VMs and Azure File Shares

Following security policy chnages, all IT admins must use only
Azure Bastion to connect to VMs hosted in Azure.

You must provision Azure Bastion via the Azure Portal in the VNet with IPAS 10.3.2.0/23 and an existing subnet with IPAS 10.3.2.0/24.

You must also create a change control document for approval.

Which IPAS should you use for Azure Bastion?

- 10.3.3.0/26
- 10.3.2.0/26
- 10.3.3.50/27
- 10.3.5.2/27

---

### Answer:
- 10.3.3.0/26

The IPAS with CIDER /27 cannot be used for Azure Bastion you must use a 
/26 at a minimum.

- 10.3.2.0/26
cannot be used because there is already an existing subnet with 
IPAS 10.3.2.0/24. 

The details abount Azure Bastion have laready been discussed in a previouis question.


---

### References:

---

## Q149:

you work for a company that hosts its infrastructure in Azure.
you plan to use ASGs to control access between VMs and cloud-hosted
applications.

The following ASG assignments have been completed:

AGS01: NIC01 in VNET01
AGS02: NIC02 in VNET02
AGS03: NIC03 in VNET02

The remaining NICs need to be assigned to these three ASGs:

VNet01: NIC04, NIC09, NIC11, NIC12        NIC01
VNet02: NIC05, NIC06, NIC07, NIC10,       NIC02, NIC03 
VNet03: NIC08 

Which NICs can be assigned to each ASG?

OPTIONS assign to ASG01
OPTIONS assign to ASG02
OPTIONS assign to ASG03

OPTIONS:
all NICs
NIC08 only
NIC04, NIC09, NIC11, NIC12 
NIC05, NIC06, NIC07, NIC10

---

### Answer:

NIC04, NIC09, NIC11, NIC12 assign to ASG01
NIC05, NIC06, NIC07, NIC10 assign to ASG02
NIC05, NIC06, NIC07, NIC10 assign to ASG03

An ASG represents a group of VMs that are used to provide 
the same, or related, applications or services.
**The ASG must encompass VMs from the same VNet**, although the 
VMs can be assigned to different subnets within the same VNet.

**ASG can be used as Source IPs and Destination IPs in the definition of NSG rules** and are commonly used in this context to simply the rules and reduce their number and corresponding admin effort.

---

### References:


[Application security groups](https://learn.microsoft.com/en-us/azure/virtual-network/application-security-groups)   


Application security groups enable you to configure network security as a natural extension of an application's structure, allowing you to group virtual machines and define network security policies based on those groups.

**You can reuse your security policy at scale without manual maintenance of explicit IP addresses.**

> Eamples:

| Priority | Prot | Dir  | A  | Source IPs   | Destination IPs  | S Ports | D Ports | Name |
| -------- | ---- | ---- | -- |------------- | ---------------- | ------- | ------- | -------   |
| 120      | TCP  | InB  | A  | Internet     | AsgWeb           | *       | 80      | allowHttp |
| 120      | TCP  | InB  | A  | Internet     | AsgWeb           | *       | 443     | allowHttps |
| 120      | TCP  | InB  | A  | Internet     | AsgWeb           | *       | 80, 443 | allowHttp(s) |

| 119      | Any  | InB  | A  | AsgLogic     | AsgDb            | *       | 1433    | allowBusinessLayerConnetionToDb |
| 120      | Any  | InB  | D  | *            | AsgDb            | *       | 1433    | blockConnetionToDb |

---

## Q148:

A global organization uses Azure for its IaaS.
Following a security incident the organization requires a security
policy to forbid the follwoing incoming traffic:
- ports 22 (SSH) 
- port 3389 (RDP)

There are Linux & Windows VMs available to teh Dev Team who have
traditionally used SSH & RDP to connect to VMs remotely.

You must recommend a solution that will allow the Dev Team to 
connect remotely to the VMs with SSH and/or RDP without circumventig
the organization's security policy.

What do you recommend?

- configure Azure Bastion
- configure a NSG with a rule that allows RDP from public IPs
- configure a P2S VPN
- configure a S2S VPN

---

### Answer:
- configure Azure Bastion

This is clearly the simplest solution and it has already been discussed in detail in one of the previous questions.

---

### References:


---

## Q147:

Your company has an Azure subscription with a VNet named `vnet1`
which contains the following subnets and VMs.

subnet1: VM1, VM2, VM3
subnet2: VM4, VM5
subnet3: VM6, VM7

you want to use NSGs to manage network traffic.
You should:

1. allow all connections from the Internet to VM4, VM5, VM6, VM7
2. allow all connections between VM1, VM2, VM3
3. block all external RDP connections to VM1
4. any other connection should be blocked
5. you must not block open network ports unnecessarily

You must determine how many NSGs you need to meet the requirements:
1 | 3 | 4 | 7

---

### Answer: 3

1. allow all connections from the Internet to VM4, VM5, VM6, VM7
these are in the subnet2 & subnet3 you need a rule like this: 

| Priority | Prot | Dir  | A  | Source IPs   | Destination IPs  | S Ports | D Ports | Name |
| -------- | ---- | ---- | -- |------------- | ---------------- | ------- | ------- | ------- |
| 1000     | *    | InB  | A  | Internet     | subnet2, subnet3 | *       | *       | rule1 |

2. allow all connections between VM1, VM2, VM3
these 3 VMs arre all in subnet1 therefore you do not need any NSG rule to allow them to communicate 
over any port and protocol.

3. block all external RDP connections to VM1
you need a NSG rule to be applied to VM1 NIC

| Priority | Prot | Dir  | A  | Source IPs   | Destination IPs  | S Ports | D Ports | Name |
| -------- | ---- | ---- | -- |------------- | ---------------- | ------- | ------- | ------- |
| 1001     | TCP  | InB  | A  | Internet     | subnet1          | 3389    | 3389    | rule2 |

4. any other connection should be blocked
you need a NSG rule to be applied to all subnets: subnet1, subnet3, subnet3

| Priority | Prot | Dir  | A  | Source IPs   | Destination IPs  | S Ports | D Ports | Name |
| -------- | ---- | ---- | -- |------------- | ---------------- | ------- | ------- | ------- |
| 1002     | *    | InB  | B  | *            | *                | *       | *       | rule3 |

Each NSG can have up to 100 rules and the Priority can be set from 100 to 4096 therefore by using 1002 rule3 is processed just after rule2.

Priority values below 100 are reserved by Azure for default rules.

---

### References:


---

## Q146:

You have a Azure VM in a VNet in your Azure subscription.

<img src="./Q146-1.png">

You create a NSG and assign it as shown in the exhibit.
You must determine how the NSG rules are processed.
Select yes/no:

- NGS1 applies to the incoming traffic to VM1 before NSG2
- NSG2 ONLY applies to traffic between VM1 & VM2
- NSG3 applies to traffic between VM6 & VM7

---

### Answer:

- NGS1 applies to the incoming traffic to VM1 before NSG2
yes
the rules of NSG1 applied to subnet1 are processed before 
the rules of NSG2 applied to the VM1 NIC

- NSG2 ONLY applies to traffic between VM1 & VM2
no
the rules of NSG2 are applied to the VM1 NIC and therefore to
any traffic not just the traffic between VM1 & VM2

- NSG3 applies to traffic between VM6 & VM7
yes
**IMPORTANT!**: 
NSG rules apply to traffic **INTO OR OUT OF** the subnet
and any VMs in the subnet!

NSG1 > subnet1: VM1, VM2, VM3
NSG2 >          VM1
NSG3 > subnet3: VM6, VM7

---

### References:

[How network security groups filter network traffic](https://learn.microsoft.com/en-us/azure/virtual-network/network-security-group-how-it-works)  


---

## Q145:

You have an Azure VNet anemd `vnet1` with IPAS 
10.2.0.0/22.

vnet1 contains `subnet1` with IPAS 
10.2.0.0/24.

subnet1 contains an Azure Windows 10 VM `vm1`.
The NIC of vm1 does not have a public IP.

You must implement **Azure Bastion** and connect to vm1 using
RDP from the Internet.

Which three actions do you perform in a sequence?

- connect vm1 using RDP client
- create a subnet named BastionSubnet and IPAS 10.2.0.2/28
- create a subnet named AzureBastionVNet and IPAS 10.3.0.0/22
- create a subnet named AzureBastionSubnet and IPAS 10.2.1.0/26
- add a public Satndard SKU IP to vm1 
- connect to vm1 using the Azure Portal in web browser

---

### Answer:

- create a subnet named AzureBastionSubnet and IPAS 10.2.1.0/26
- cerate a bastion and assign the existing relevant subnet
- connect to vm1 using the Azure Portal in web browser

In order to deploy Azure Bastion to a VNet a specially named subnet must be 
created `AzureBastionSubnet` with a minimum CIDR rquirement for `/26`.
The `10.2.1.0/26` is indeed within the Vnet IPAS 10.2.0.0/22.

Then from the Azure Portal you cann **deploy Azure Bastion** as a service
to the `AzureBastionSubnet`.

Azure Bastion is designed to provide secure RDP OR SSH access to a Windows VM in the 
same VNet where the `AzureBastionSubnet` is located from the Azure Portal directly in the user's browser.

---

### References:

[Tutorial: Deploy Azure Bastion by using specified settings](https://learn.microsoft.com/en-us/azure/bastion/tutorial-create-host-portal)  

<img src="./Q145-1.png">

[Create an RDP connection to a Windows VM using Azure Bastion](https://learn.microsoft.com/en-us/azure/bastion/bastion-connect-vm-rdp-windows)  

[Azure Bastuion configuration Settings](https://learn.microsoft.com/en-us/azure/bastion/configuration-settings)  

> Instances and host scaling:

Each instance can support:
20 concurrent RDP connections 
and 
40 concurrent SSH connections for medium workloads

- Basic SKU
using the Basic SKU, two instances are created.

- Standard SKU
you can specify the number of instances (with a minimum of two instances). 

> Custom ports:

You can specify the port that you want to use to connect to your VMs. 

By default the inbound ports used to connect are: 
3389 for RDP 
22 for SSH 

If you configure a custom port value, specify that value when you connect to the VM.
Custom port values are supported for the **Standard SKU** only.

> Shareable link:

The Bastion Shareable Link feature lets users connect to a target resource using Azure Bastion **without accessing the Azure portal**.

When a **user without Azure credentials** clicks a shareable link, a webpage opens that prompts the user to sign in to the target resource via RDP or SSH. 

**Users authenticate using username and password or private key**, depending on what you have configured in the Azure portal for that target resource. Users can connect to the same resources that you can currently connect to with Azure Bastion: VMs or virtual machine scale set.

---

## Q144:

You have four VMs in Azure all connected to the same `subnet1`.
The VMs host applications exposed to the Internet.
A NSG is associated to the subnet.
The output of the command `Get-AzNetworkSecurityRuleConfig` is 
shown in the exhibit.


<img src="./Q144-1.png">

The VMs can be accessed by RDP.
The security department approves RDP connection only from a specific range of IP addresses.
You notice RDP connections from non-approved IP addresses are still possible.

You must correct this issue.

What should you do?

- delete rule3 of nsg1
- modify rule1 of nsg1 and set the source to the approved IP range
- modify rule2 of nsg1 and set the source to the approved address range
- modify rule3 of nsg1 and set the source to the approved IP range
- disable the public IP addresses of the VMs NICs
- create an ASG and associate the VMs with this ASG

---

### Answer:
- modify rule1 of nsg1 and set the source to the approved IP range

The output of the command `Get-AzNetworkSecurityRuleConfig` shown in the exhibit reports that there are three NSG rules applied to the subnet `subnet1` of the VMs, the question states that the NSG with this rules is applied to the subnet level.

> security rule:
- Name
- Priority: between 100 and 4096.
- Protocol: TCP, UDP, ICMP, ESP, AH, or Any.
- Direction: inbound | outbound
- Action: allow | deny
- Port range: i.e.  80 or 10000-10005 
- Source OR Destination: 
10.0.0.0/24, 10.1.0.0/24 service tag, ASG.


| Priority | Prot | Dir  | A  | Source IPs   | Destination IPs| S Ports | D Ports | Name |
| -------- | ---- | ---- | -- |------------- | -------------- | ------- | ------- | ------- |
| 100      | TCP  | InB  | A  | *            | *              | 3389    | 3389    | rule1 |
| 110      | TCP  | InB  | A  | *            | *              | 80, 443 | 80, 443 | rule2 |
| 4096     | *    | InB  | D  | *            | *              | *       | *       | rule3 |

rule1 is concerned with RDP as the 3389 is used for this communication protocol.
rule1 allows * that is any IP address range to initiate a inbound communication and this is 
not compliant with the policy requested the security department. 

---

### References:

[Get-AzNetworkSecurityRuleConfig](https://learn.microsoft.com/en-us/powershell/module/az.network/get-aznetworksecurityruleconfig?view=azps-11.4.0)  

gets a network security rule configuration for an NSG.

```
Get-AzNetworkSecurityRuleConfig
   [-Name <String>]
   -NetworkSecurityGroup <PSNetworkSecurityGroup>
   [-DefaultRules]
   [-DefaultProfile <IAzureContextContainer>]
   [<CommonParameters>]
```

```
-DefaultRules
Indicates whether this cmdlet gets a user-created rule configuration or a default rule configuration.
```

```
# 1: Retrieving a network security rule config
# retrieves the default rule named "AllowInternetOutBound" 
# from Azure network security group named "nsg1" in resource group "rg1"

Get-AzNetworkSecurityGroup -Name nsg1 -ResourceGroupName rg1 | Get-AzNetworkSecurityRuleConfig -Name AllowInternetOutBound -DefaultRules

# retrieves user defined rule named "rdp-rule"
Get-AzNetworkSecurityGroup -Name nsg1 -ResourceGroupName rg1 | Get-AzNetworkSecurityRuleConfig -Name "rdp-rule"

```
---

## Q143:

You have a subnet named `private-subnet1` in a VNet named `vnet1`.
The NSG `nsg1` is shown in the exhibit and is applied to `private-subnet1`.

<img src="./Q143-1.png">

The organization has various teams that have their own VNet in Azure.
The VNets are ALL peered with `vnet1` and have NSGs that allow ALL ports to reach the `private-subnet1`.
All the Vnet are configured with IP addresses from the range 10.0.0.0/8.

A DNS is hosted on `private-subnet1` and listens for requests on port 53.

Various teams in your organization report that are delays in resolving
DNS names using the DNS server.

You must resolve the issue.
What should you do?

- change the priority of the DNS rule to 100
- delete the DNS-Deny rule from `nsg1`
- change the port for the DNS rule to Any
- change the protocol for the DNS rule to Any

---

### Answer:
- change the port for the DNS rule to Any

In the exhibit you see that the DNS rule is defined with protocol
set to TCP while the DNS-Deny is set to Any.

The teams report that are delays in the DNS resolution, that is
the DNS eventually resolves the URL to an IP but it takes longer 
that it should be.

This is the case due to the fact that DNS resolution is carried out
with UDP (User Datagram Protocol) as the **primary** protocol, as it is faster than TCP, thus the DNS-Deny rule will be matched for the UDP traffic instead of the DNS rule therefore blocking the primary traffic fro DNS resolution.

DNS is designed to be robust therefore it tries to resolve also over TCP and this time it succeeds as this traffic matches the DNS rule on the NSG for the subnet of the DNS Server.


---

### References:


---

## Q142:

The Azure subscription is named `subA`.
You are configuring a Linux VM to be used as a SFTP Server. 
Secure File Transfer Protocol requires SSH port 22.

The SFTP server has to be accessable over the Internet 
and 
allow only SSH calls from IP addresses in the range 151.112.10.0/24.

The NIC for the VM si dynamically assigned a private IP address from its subnet.

The subnet that hosts the VM must:

- allow HTTP (80)
- allow HTTPS (443)
- block SSH (port 22) from 151.112.10.0/24 as there are also other servers on the same subnet

How shold you configure the VM?

- configure a NSG on the VM NIC to allow inbound SSH from 151.112.10.0/24
- configure a NSG on the subnet to allow inbound SSH from 151.112.10.0/24
- configure a NSG on the VM NIC to allow SSH from the Internet
- configure a NSG on the VM NIC to deny HTTP and HTTPS

---

### Answer:
- configure a NSG on the VM NIC to allow inbound SSH from 151.112.10.0/24

This answer is obvious as the NSG applied to the subnet that provides 
the SFTP Server VM NIC with a private IP address has a NSG rule to: 
block SSH (port 22) from 151.112.10.0/24 as there are also other servers on the same subnet

This rule must be overridden at the VM NIC's level.


---

### References:


---

## Q141:

You host a LOB app on a VNet in Azure.
A S2S VPN links the on-prem environment with Azure VNet.

You plan to use a NSG to restric inbound traffic into the 
VNet following the IPv4 address ranges:

192.168.2.0/24
192.168.4.0/24
192.168.8.0/24

Solution requirements:

1. limit rule scope to the three IPv4 address ranges above
2. minimize the number of NSG rules
3. minimize future admin management effort

What should you do?

- pass the IPv4 range 192.168.0.0/22 into the NSG rule
- pass the IPv4 ranges into the NSG rule as comma-separated list
- define a NSG rule that includes the VirtualNetwork service tag
- define three NSG rules one for each IPv4 range

---

### Answer:
- pass the IPv4 ranges into the NSG rule as comma-separated list

It is possible to use comma-separated list of IPv4 ranges in the 
source IP of 

> security rule:
- Name
- Priority: between 100 and 4096.
- Protocol: TCP, UDP, ICMP, ESP, AH, or Any.
- Direction: inbound | outbound
- Action: allow | deny

- Source OR Destination: 
Any, or an individual IP address, classless inter-domain routing (CIDR) block (10.0.0.0/24, for example), service tag, or application security group.
Fewer security rules are needed when you specify a range, a service tag, or application security group. 

- Port range: i.e.  80 or 10000-10005 
Specifying ranges enables you to create fewer security rules. 

---

### References:

[How network security groups filter network traffic](https://learn.microsoft.com/en-us/azure/virtual-network/network-security-group-how-it-works)    

[Augmented security rules](https://learn.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview#augmented-security-rules)    

You can combine multiple ports and multiple explicit IP addresses and ranges into a single, easily understood security rule. 
Use augmented rules in the source, destination, and port fields of a rule. 
There are limits to the number of addresses, ranges, and ports that you can specify in a rule. 

---

## Q140:

You configure a NSG, the default security rules are already in place.

You must configure the NSG to support the following traffic into the
subnet from the Internet:

- RDM: Remote Desktop Management 
- HTTPS
- HTTP

Which three ports should you configure in the NSG configuration?

- 3389
- 21
- 443
- 80
- 53

---

### Answer:

- 3389 : RDP
- 443  : HTTPS
- 80   : HTTP

The remaining options do not apply:

- 21 : Telnet
- 53 : FTP

---

### References:

[Port Assignments for Well-Known Ports](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc959828(v=technet.10))  

---

## Q139:

you have an Azure VNet named `vnet1` with a subnet named `subnet1`.
there are three Windows Server 2019 VMs in `subnet1`. 
You must design a NSG that blocks inbound RDP traffic into `subnet1`.

How should you configure the NSG?

source: ?
desitnation: ?
desitnationport ranges: ?

OPTIONS: 
Service Tag | 3389 | Any | Internet | Azure Cloud |
App Security Group | 5985 (WinRM: Windows Remote Manager)

---

### Answer:

source: Internet
desitnation: Any
desitnationport ranges: 3389

I think this is the correct solution.

The author instead uses: 
source: Service Tag

which I do not think is the correct option in this specific case.


---

### References:


[Network security groups](https://learn.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview)    

[Tutorial: Filter network traffic with a network security group using the Azure portal](https://learn.microsoft.com/en-us/azure/virtual-network/tutorial-filter-network-traffic)    

[Troubleshoot Remote Desktop connections to an Azure virtual machine](https://learn.microsoft.com/en-us/troubleshoot/azure/virtual-machines/windows/troubleshoot-rdp-connection)  

---

## Q138:

you configure a NSG to:
- allow RDP connectivity 
- HTTP traffic from the Internet

the NSG will be created for resuse on multiple VMs subnets in the same subscription.

Complete the script:

```
$rule1 = OPTIONS -Name rdp -Description "allor rdp" `
-Access Allow Protocol Tcp -Direction Inbound `
-Priority 100 `
-SourceAddressPrefix Internet `
-SourceAddressPortRange * `
-DestinationAddressPortRange 3389 `

$rule2 = OPTIONS -Name web -Description "allor http"
-Access Allow Protocol Tcp -Direction Inbound `
-Priority 101 `
-SourceAddressPrefix Internet `
-SourceAddressPortRange 80 `
-DestinationAddressPortRange * `

$nsg = OPTIONS -ResourceGroupName rg1 -Location westus `
-Name "nsg-frontend" -SecurityRules $rule1, $rule2
```

OPTIONS:
New-AzNetworkSecurityGroup
Set-AzNetworkSecurityGroup
New-AzNetworkSecurityGroupRuleConfig
Set-AzNetworkSecurityGroupRuleConfig
New-AzNetworkInterfaceIpConfig

---

### Answer:

```
$rule1 = New-AzNetworkSecurityGroupRuleConfig -Name rdp -Description "allor rdp" `
-Access Allow Protocol Tcp -Direction Inbound `
-Priority 100 `
-SourceAddressPrefix Internet `
-SourceAddressPortRange * `
-DestinationAddressPortRange 3389 `

$rule2 = New-AzNetworkSecurityGroupRuleConfig -Name web -Description "allor http"
-Access Allow Protocol Tcp -Direction Inbound `
-Priority 101 `
-SourceAddressPrefix Internet `
-SourceAddressPortRange 80 `
-DestinationAddressPortRange * `

$nsg = New-AzNetworkSecurityGroup -ResourceGroupName rg1 -Location westus `
-Name "nsg-frontend" -SecurityRules $rule1, $rule2
```

The remaining options do not apply.

---

### References:

[Set-AzNetworkSecurityGroup](https://learn.microsoft.com/en-us/powershell/module/az.network/set-aznetworksecuritygroup?view=azps-11.4.0)   
updates a network security group

```
Get-AzNetworkSecurityGroup -Name "Nsg1" -ResourceGroupName "Rg1" | Add-AzNetworkSecurityRuleConfig -Name "Rdp-Rule" -Description "Allow RDP" -Access "Allow" -Protocol "Tcp" -Direction "Inbound" -Priority 100 -SourceAddressPrefix "Internet" -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange "3389" | Set-AzNetworkSecurityGroup
```

[Set-AzNetworkSecurityRuleConfig](https://learn.microsoft.com/en-us/powershell/module/az.network/set-aznetworksecurityruleconfig?view=azps-11.4.0)
Updates a network security rule configuration for a network security group.

```
$nsg = Get-AzNetworkSecurityGroup -Name "NSG-FrontEnd" -ResourceGroupName "TestRG"
$nsg | Get-AzNetworkSecurityRuleConfig -Name "rdp-rule"
Set-AzNetworkSecurityRuleConfig -Name "rdp-rule" -NetworkSecurityGroup $nsg -Access "Deny"
```

---

[New-AzNetworkInterfaceIpConfig](https://learn.microsoft.com/en-us/powershell/module/az.network/new-aznetworkinterfaceipconfig?view=azps-11.4.0)   
Creates a network interface IP configuration.

[Add-AzNetworkInterfaceIpConfig](https://learn.microsoft.com/en-us/powershell/module/az.network/add-aznetworkinterfaceipconfig?view=azps-11.5.0)  
Adds a network interface IP configuration to a network interface.

```
$subnet = New-AzVirtualNetworkSubnetConfig -Name MySubnet -AddressPrefix 10.0.1.0/24
$vnet = New-AzVirtualNetwork -Name MyVNET -ResourceGroupName MyResourceGroup -Location "West US" -AddressPrefix 10.0.0.0/16 -Subnet $subnet

$nic = New-AzNetworkInterface -Name MyNetworkInterface -ResourceGroupName MyResourceGroup -Location "West US" -Subnet $vnet.Subnets[0]

$asg = New-AzApplicationSecurityGroup -ResourceGroupName MyResourceGroup -Name MyASG -Location "West US"

$nic | Set-AzNetworkInterfaceIpConfig -Name $nic.IpConfigurations[0].Name -Subnet $vnet.Subnets[0] -ApplicationSecurityGroup $asg | Set-AzNetworkInterface

$nic | Add-AzNetworkInterfaceIpConfig -Name MyNewIpConfig -Subnet $vnet.Subnets[0] -ApplicationSecurityGroup $asg | Set-AzNetworkInterface
```

---

## Q137:

You are an Azure admin and the company uses VMs to host applications.
You modify the NIC for an Azure VM.
The VM is a **multi-NIC** with Windows OS.
Tge CM fails to connect to another Azure VM.

You must troubleshoot this issue with minimal effort.
What should you do first?

- **use Azure Network Watcher IP flow verify** to determine whether there is a NSG that interferes with the traffic flow

- add a NIC
- disable the organization firewall
- redeploy the VM 


---

### Answer:
- add a NIC

the most significant point in this scenario is that the VM is a **multi-NIC** with Windows OS. However, the statement of the question does not say that there are already multiple NIC attached to the VM, it only says that there is one attached NIC and the VM fails to communicate to another VM **after** this NIC has been modified .

In such case, the simplest solution and therefore the solution with minimal effort to troubleshoot the issue is to try to add a second NIC and test whether this second NIC restores the communication.

The next best answer is clealy:

- **use Azure Network Watcher IP flow verify** to determine whether there is a NSG that interferes with the traffic flow

and you would use this after the simpler option above fails.

The remaining optins clearly do not apply as they required much greater effort.

---

### References:

[Troubleshooting connectivity problems between Azure VMs](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-troubleshoot-connectivity-problem-between-vms)    


> Troubleshooting guidance

1. Check whether NIC is misconfigured:
see details below

2. Check whether network traffic is blocked by NSG or UDR
use Network Watcher IP Flow Verify as described later 
and Connection troubleshoot (below)

3. Check whether network traffic is blocked by VM firewall
Disable the firewall, and then test the result.
Verify the firewall settings, and then re-enable the firewall.

4. Check whether VM app or service is listening on the port
for VMs and App Services
```
# Windows
netstat –ano

#Linux
netstat -l
```

5. Check whether the problem is caused by SNAT:
Source Network Address Translation (SNAT)
In scenarios when a VM is placed behind a load balance solution that has a dependency on resources outside of Azure and there is **intermittent** 
**outbound connectivity**. 
The problem may be caused by **SNAT port exhaustion**. 


6. Check whether traffic is blocked by ACLs for the classic VM
7. Check whether the endpoint is created for the classic VM
8. Try to connect to a VM network share
9. Check Inter-VNet connectivity


> Details:

---

5. Check whether the problem is caused by SNAT:

There are number of solution for outbound connectivity:

<img src="./Q137-1.png">

[1. Use Source Network Address Translation (SNAT) for outbound connections](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-outbound-connections)  

The frontend IPs of a public load balancer can be used to provide outbound connectivity to the internet for backend instances. 
This configuration uses source network address translation (SNAT) to translate virtual machine's private IP into the load balancer's public IP address. 

> VM Private IP -> LB Public IP
> SNAT maps the backend VM IP address to the public IP of the LB

<img src="./Q137-2.png">

Outbound rules enable you to explicitly define SNAT (source network address translation) for a standard SKU public load balancer. 
This configuration allows you to use the public IP or IPs of your load balancer for outbound connectivity of the backend instances.

This configuration enables:

- IP masquerading
- Simplifying your allowlists
- Reduces the number of public IP resources for deployment

With outbound rules, you have full declarative control over outbound internet connectivity.

> Manual allocation of SNAT ports:

Manually allocating SNAT port based on the backend pool size and number of `frontendIPConfigurations` **can help avoid SNAT exhaustion**.

You can manually allocate SNAT ports either:
- by "ports per instance" (recommended for VMs backend) 
- or "maximum number of backend instances" (recommended for VMSS backend) 

> Calculate ports per instance as follows:
`Number of frontend IPs * 64K / Number of backend instances`

> If you have Virtual Machine Scale Sets in the backend:
allocate ports by "maximum number of backend instances"

---

[SNAT Port exhaustion](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-outbound-connections#port-exhaustion)  

Every connection to: 
- the same destination IP 
- and destination port uses a SNAT port

This connection maintains a distinct traffic flow from the 
backend instance or client to a server. 
This process gives the server a distinct port on which to address traffic. 
Without this process, the client machine is unaware of which flow a packet is part of.

Without SNAT ports for the return traffic, the client has no way to separate one query result from another.

> Example:
Destination IP = 23.53.254.142
Destination Port = 443
Protocol = TCP

**Outbound connections can burst**.
A backend instance can be allocated insufficient ports. 
New outbound connections to a destination IP fail when port exhaustion occurs.
Connections succeed when a port becomes available. 
**Each IP address provides 64,000 ports that can be used for SNAT.**
Each port can be used for both TCP and UDP connections to a destination IP address.
A TCP SNAT port can be used for multiple connections to the same destination IP provided the destination ports are different.
**This exhaustion occurs when the 64,000 ports from an IP address are spread thin across many backend instances**. 

> Load Balancer:

For TCP connections, the load balancer uses **a single SNAT port for every destination IP and port**. 
This multiuse enables multiple connections to the same destination IP with the same SNAT port. 
**This multiuse is limited if the connection isn't to different destination ports**.

---

[How does default SNAT work?](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-outbound-connections#how-does-default-snat-work)  

When a VM creates an outbound flow, Azure translates the source IP address to an **ephemeral IP address**. 

This translation is done via SNAT:

> SOURCE IP ADDRESS -> EPHEMERAL IP ADDRESS

If using SNAT **without outbound rules** via a public load balancer, 
SNAT ports are pre-allocated as described in the following 
**default SNAT ports allocation table**:

- load balancing rules are selected to use default port allocation 
OR
- outbound rules are configured with "Use the default number of outbound ports", 

SNAT ports are allocated by default based on the backend pool size. 
Backends will receive the number of ports defined by the table, 
per frontend IP, up to a maximum of 1024 ports.

> Example:

with 100 VMs in a backend pool and only one frontend IP
each VM will receive 512 ports: 512/vm
If a second frontend IP is added
each VM will receive an additional 512 ports: 1024 / vm
- exhaustion:
As a result, adding a third frontend IP **will NOT increase** 
the number of allocated SNAT ports beyond 1024 ports.

```
MIN
(
  #default SNAT ports provided based on pool size * number of frontend IPs associated with the pool, 
  1024
)
```
Default SNAT table
Pool size (VM instances)	Default SNAT ports
1-50	          : 1,024
51-100	        : 512
101-200	        : 256
201-400	        : 128
401-800	        : 64
801-1,000	       : 32

---

[2. Associate a NAT gateway to the subnet](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-outbound-connections)  

<img src="./Q137-3.png">

**Azure NAT Gateway simplifies outbound-only Internet connectivity** 
for virtual networks. 

When configured on a subnet, all outbound connectivity uses your specified static public IP addresses. 

Outbound connectivity is possible without load balancer or public IP addresses directly attached to virtual machines. NAT Gateway is fully managed and highly resilient.

Using a NAT gateway is the best method for outbound connectivity. 
A NAT gateway is highly extensible, reliable, and 
**doesn't have the same concerns of SNAT port exhaustion**.

---

[3. Assign a public IP to the virtual machine](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-outbound-connections#3-assign-a-public-ip-to-the-virtual-machine)  
This is the least secure solution and it is also much harder to maintain.

> default outbound access:

In Azure, virtual machines created in a virtual network without explicit outbound connectivity defined are assigned a default outbound public IP address.
This IP address enables outbound connectivity from the resources to the Internet.
This access is referred to as **default outbound access**.
**This method of access is not recommended as it is insecure and the IP addresses are subject to change.** 

---

2. Check whether network traffic is blocked by NSG or UDR

[Connection troubleshoot overview](https://learn.microsoft.com/en-us/azure/network-watcher/connection-troubleshoot-overview)  

**This is especially useful in complex networking scenarios**.

The connection troubleshoot feature of Azure Network Watcher helps 
reduce the amount of time to diagnose and troubleshoot network 
connectivity issues.

**Connection troubleshoot reduces the Mean Time To Resolution (MTTR)**:
- performing all connection major checks
detect issues pertaining to: 
- network security groups
- user-defined routes
- blocked ports

It provides the following results with **actionable insights**. 

check TCP or ICMP connections from any of these Azure resources:

Virtual machines
Virtual machine scale sets
Azure Bastion instances
Application gateways (except v1)

---

1. Check whether NIC is misconfigured:

[How to reset network interface for Azure Windows VM](https://learn.microsoft.com/en-us/troubleshoot/azure/virtual-machines/windows/reset-network-interface)  

The virtual machine will restart to initialize the new NIC to the system.

```
#Set the variables 
$SubscriptionID = "<Subscription ID>"​
$ResourceGroup = "<Resource Group>"
$NetInter="<The Network interface of the VM>"
$VNET = "<Virtual network>"
$subnet= "<The virtual network subnet>"
$PrivateIP = "<New Private IP>"

#You can ignore the publicIP variable if the VM does not have a public IP associated.
$publicIP = Get-AzPublicIpAddress -Name <the public IP name> `
-ResourceGroupName  $ResourceGroup

#Log in to the subscription​ 
Add-AzAccount
Select-AzSubscription -SubscriptionId $SubscriptionId

#Check whether the new IP address is available in the virtual network.
Get-AzVirtualNetwork -Name $VNET -ResourceGroupName $ResourceGroup | Test-AzPrivateIPAddressAvailability -IPAddress $PrivateIP

#Add/Change static IP. This process will change MAC address
$vnet = Get-AzVirtualNetwork -Name $VNET -ResourceGroupName $ResourceGroup

$subnet = Get-AzVirtualNetworkSubnetConfig -Name $subnet -VirtualNetwork $vnet

$nic = Get-AzNetworkInterface -Name  $NetInter `
-ResourceGroupName  $ResourceGroup

#Remove the PublicIpAddress parameter if the VM does not have a public IP.
$nic | Set-AzNetworkInterfaceIpConfig -Name ipconfig1 `
-PrivateIpAddress $PrivateIP `
-Subnet $subnet `
-PublicIpAddress $publicIP `
-Primary

$nic | Set-AzNetworkInterface
```

---


---

[IP flow verify overview](https://learn.microsoft.com/en-us/azure/network-watcher/ip-flow-verify-overview)   

It's a quick and simple tool to diagnose connectivity issues:

- to or from other Azure resources
- the internet and on-premises environment

It helps you to troubleshoot virtual machine connectivity issues by checking:
- network security group (NSG) rules 
- and Azure Virtual Network Manager admin rules

you can use it to check if a packet is allowed or denied to or from an Azure virtual machine.

**IP flow verify looks at the rules of all NSGs applied to a VM** **NIC**, whether the NSG is associated to the VM's subnet or network interface. 

It **additionally**, looks at the `Azure Virtual Network Manager rules` applied to the VNet of the VM.

IP flow verify uses:

- traffic direction
- protocol
- local IP
- remote IP
- local port and remote port 

IP flow verify returns:

- **Access denied** or **Access allowed**
- the name of the security rule that denies or allows the traffic
- the NSG with a link to it so you can edit it if you need to

> It doesn't provide a link if a default security rule is denying or allowing the traffic. 

> Considerations:

- IP flow verify only tests TCP and UDP rules
- to test **ICMP traffic rules, use NSG diagnostics**
- You must have a Network Watcher instance in the Azure subscription and region of the virtual machine
- 

---

[NSG diagnostics overview](https://learn.microsoft.com/en-us/azure/network-watcher/network-watcher-network-configuration-diagnostics-overview)  

This is similar to **IP flow verify** but it also covers the particular case of:
**ICMP traffic rules**.

The NSG diagnostics is an Azure Network Watcher tool that helps you understand which network traffic is allowed or denied in your Azure virtual network along with detailed information for debugging. 

**NSG diagnostics can help you verify that your network security group rules are set up properly.**

> How does NSG diagnostics work?

The NSG diagnostics tool can simulate a given flow based on the source and destination you provide. It returns whether the flow is allowed or denied with detailed information about the security rule allowing or denying the flow.

---

## Q136:

you manage VNets in Azure.
There are the following VMs accross the following VNets:

- vnet1 with address space 10.0.0.0/16
- vnet2 with address space 10.1.0.0/16
- vnet3 with address space 10.2.0.0/16

You configure the VNet Peering on the following VNets:

- vnet1-vnet2
- vnet2-vnet3
- vnet3-vnet2

You must determine if VMs in a specific VNet can communicate with the
VMs in the other VNets.

Azure VMs on vnet1 can connect to VMs on: OPTIONS
Azure VMs on vnet2 can connect to VMs on: OPTIONS
Azure VMs on vnet3 can connect to VMs on: OPTIONS

OPTIONS:
vnet1 only
vnet2 only
vnet3 only
vnet2 & vnet3
vnet1 & vnet3
vnet1 & vnet2
---

### Answer:

Azure VMs on vnet1 can connect to VMs on: vnet2 only
Azure VMs on vnet2 can connect to VMs on: vnet2 & vnet3 = vnet3 only
Azure VMs on vnet3 can connect to VMs on: vnet2 & vnet3 = vnet2 only

This question is about transitivity of VNet Peering
AND
the direction of the of VNet Peering

A VNet Peering i.e. vnetX-vnetY has is composed by two sides:
the peering in the X->Y direction
the peering in the Y->X direction

This has already been discussed in detail in a previous question.

In this question it is specified that: 

the peering between vnet2 and vnet3 is configured on both sides:
- vnet2-vnet3
- vnet3-vnet2

This means that 2->3 and 3->2 are possible

However,
the peering between vnet1 and vnet2 is configured on a sinlge side:
- vnet1-vnet2

this means that ONLY 1->2 are possible.

The remaining question is whether also the 1->3 is possible that is:
1->2->3   ?

The answer is NO because VNet Peering INS NOT TRANSITIVE!

---

### References:

---

## Q135:

You manage an Azure SA named `sa1`, this is used exclusively by 
an Azure VM which uses a VNet named `vnet1` that is configured
as shown below:

- `vnet1` has address range 10.0.0.0/16
- `appsubnet` has address range 10.0.0.0/24 in `vnet1`
- `storagesubnet` has address range 10.0.1.0/24 in `vnet1`

The VM is configured to use `appsubnet`.
To meet a security requirement you must secure `sa1` to allow only network 
connection that originates from `storagesubnet`.
All resources are in a RG named `rg1`.

You must configuer a network access rule to meet the requirement.

```
OPTIONS-1 -ResourceGroupName `rg1` -Name 'sa1' -DefaultAction Deny

Get-AzVirtualNetwork -ResourceGroupName `rg1` -Name 'vnet1' | `
OPTIONS-2 -Name 'OPTIONS-3' `
-AddressPrefix "OPTIONS-4" `
-ServiceEndpoint 'Microsoft.Storage' | Set-AzVirtualNetwork

$subnet = Get-AzVirtualNetwork -ResourceGroupName `rg1` -Name 'vnet1' | ` 
Get-AzVirtualNetworkSubnetConfig -Name -Name 'OPTIONS-5' | `

OPTIONS-6 -ResourceGroupName `rg1` -Name 'sa1' `
-VirtualNetworkResourceId $subnet.Id
```

OPTIONS-1/2/6:
Add-AzStorageAccountNetworkRule
Update-AzStorageAccountNetworkRuleSet
Set-AzVirtualNetworkSubnetConfig

OPTIONS-3/5:
appsubnet
storagesubnet

OPTIONS-4:
10.0.0.0/16
10.0.0.0/24
10.0.1.0/24

---

### Answer:

---

### References:


---

## Q134:

You have an Azure VM named `vm1`.
The networking blade of `vm1` is shown in the exhibit.

<img src="./Q134-1.png">

You want to connect to a web app running on port 80 in `vm1` 
over the Internet.

What should you do firts?

- create a NSG and associate it with the subnet in the `0419b-vnet` VNet
- enable just-in-time access on vm1
- enable accelerated networking
- create a public IP and associate it with the IP configuration of `ipconfig1`

---

### Answer:
- create a public IP and associate it with the IP configuration of `ipconfig1`

The `vm1` NIC `vm166` does not have a public IP in the configuration `ipconfig1`.
Inbound communication from the Internet requires such IP address.

The remaining options do not apply:

- enable accelerated networking:
this is to enhance network performance but it does not solve the problem

- create a NSG and associate it with the subnet in the `0419b-vnet` VNet
this is to enhance network security but it does not solve the problem

- enable just-in-time access on vm1
this is partof **access control** but will not solve the problem


---

### References:

---

## Q133:

Your company maintains two subscriptions named s1 and s2.
These are associated to the Microsoft Entra ID t1 and t2 respectively.

s1 contains three VNets: vnet1-1, vnet1-2, vnet1-3
s2 contains two   VNets: vnet2-1, vnet2-2

You need to use VNet peering to manage communication between the VNets.

Which VNets can be peered with vnet1-1?

- vnet2-1 only
- vnet2-2 only
- vnet1-2, vnet1-3 only
- vnet1-1, vnet1-2, vnet2-1, vnet2-2

---

### Answer:
- vnet1-1, vnet1-2, vnet2-1, vnet2-2

Peering between VNets can be configured between any VNet even 
accross Azure subscriptions and tenants and/or on-prem networks.
It can also be configured **accross regions**.

There are two types of VNet peering:
- Virtual network peering: Connecting virtual networks within the same Azure region.

- Global virtual network peering: Connecting virtual networks across Azure regions.

---

### References:

---

## Q132:

You company's Azure subscription contains three VNets: `vnet1`, `vnet2`, `vnet3`.
`vnet2` isncludes a **virtual appliance that operates as a router**.

You configure a **VNet hub and spoke topology** that uses `vnet2` as a hub network.
You must configure communication between `vnet1` and `vnet3`.
You must keep configuration changes ot a minimum.

Select yes/no:

- you should configure allow gateway transit in the `vnet2` peering connection only
- you should configure allow forwarding traffic transit in the `vnet2` peering connection only
- you should configure use remote gateways in the `vnet1` and `vnet3`  peering connection only

---

### Answer:

- you should configure allow gateway transit in the `vnet2` peering connection only
yes

- you should configure allow forwarding traffic transit in the `vnet2` peering connection only
no

- you should configure use remote gateways in the `vnet1` and `vnet3`  peering connection only
yes

This makes it possible for the spokes to communicate through the Hub.

You must **allow gateway transit** in the Hub node: `vnet2`
You must **use remote gateways** in the spokes: `vnet1` & `vnet3`
You must **allow forward traffic** in the spokes: `vnet1` & `vnet3` NOT in the hub!

---

### References:

[Hub-spoke network topology in Azure](https://learn.microsoft.com/en-us/azure/architecture/networking/architecture/hub-spoke?tabs=cli)   

This topology is useful for when you want to isolate a virtual network 
but still want it to have connectivity to common resources in the 
hub virtual network.

**By default, this connectivity is only for virtual networks in the same region**. 
To allow connectivity across different Azure regions, you need to enable **Global mesh**. 

You can also **enable Gateway transit** to 
**allow spoke virtual networks to use the VPN or ExpressRoute gateway deployed in the hub**.

> Hub virtual network:

The hub virtual network hosts shared Azure services. 
Workloads hosted in the spoke virtual networks can use these services. 
The hub virtual network is the central point of connectivity for cross-premises networks.

> Spoke virtual networks:

Spoke virtual networks isolate and manage workloads separately in each spoke. 
Each workload can include multiple tiers, with multiple subnets connected 
through Azure load balancers. 
Spokes can exist in different subscriptions and represent different environments, 
such as Production and Non-production.

> Virtual network connectivity:
his architecture connects virtual networks by using 

- peering connections 

- or connected groups:
[connected groups](https://learn.microsoft.com/en-us/azure/virtual-network-manager/concept-connectivity-configuration#connected-group)  
A virtual network can be part of up to two connected groups.
Virtual networks in a connected group can communicate to each other just like if 
you were to connect virtual networks together manually. 
Virtual networks connected together in a connected group 
**don't have a peering configuration listed** under Peerings for the virtual network.

> [Use hub as a gateway](https://learn.microsoft.com/en-us/azure/virtual-network-manager/concept-connectivity-configuration#use-hub-as-a-gateway)    

You can also enable Gateway transit to allow spoke virtual networks to use the VPN or ExpressRoute gateway deployed in the hub.
Each virtual network, including a peered virtual network, can have its own gateway. 
A virtual network can use its gateway to connect to an on-premises network.

---

[Configure VPN gateway transit for virtual network peering](https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-peering-gateway-transit)  

Virtual network peering seamlessly connects two Azure virtual networks, 
merging the two virtual networks into one for connectivity purposes. 

Gateway transit is a peering property that lets one virtual network use the
VPN gateway in the peered virtual network for cross-premises or VNet-to-VNet 
connectivity.

<img src="./Q132-1.png">

> Motivation:

**In hub-and-spoke network architecture**, gateway transit allows spoke virtual networks to share the VPN gateway in the hub, instead of deploying VPN gateways in every spoke virtual network. 

```
$SpokeRG = "SpokeRG1"
$SpokeRM = "Spoke-RM"
$HubRG   = "HubRG1"
$HubRM   = "Hub-RM"

$spokermvnet = Get-AzVirtualNetwork -Name $SpokeRM -ResourceGroup $SpokeRG
$hubrmvnet   = Get-AzVirtualNetwork -Name $HubRM -ResourceGroup $HubRG

Add-AzVirtualNetworkPeering -Name SpokeRMtoHubRM -VirtualNetwork $spokermvnet -RemoteVirtualNetworkId $hubrmvnet.Id -UseRemoteGateways

Add-AzVirtualNetworkPeering -Name HubRMToSpokeRM -VirtualNetwork $hubrmvnet -RemoteVirtualNetworkId $spokermvnet.Id -AllowGatewayTransit
```

---

## Q131:

You have two VMs running Windows as shown in the first exhibit.

<img src="./Q131-exhibit.png">

You create a VNet peering by executing the following:

```
$vnet1 = Get-AzVirtualNetwork -Name 'vnet1' -ResourceGroup 'rg1'
$vnet2 = Get-AzVirtualNetwork -Name 'vnet2' -ResourceGroup 'rg2'
Add-AzVirtualNetworkPeering -Name `vnet1-vnet2` `
-VirtualNetwork $vnet1 `
-RemoteVirtualNetwork $vnet2.Id 
```

The peering overview of VNet1 is shown in the second exhibit.

You open the local Windows Firewall by running the following on both VMs:

`New-NetFirewallRule -DisplayName 'Enable ping' -Protocol 'ICMPv4'`

a ping from VM1 to the private IP address VM2 fails.

You must make sure that VM1 can connet to VM2.

What should you do?

- create a VNet gateway
- use the public IP address to connect
- move VM2 to East US region
- add a VNet peering from vnet2 to vnet1
- modify the vnet addres space of Vnet2
- create a NSG and associate both subnets to the NSG
- create a VNet gateway
- move VM2 to the East US region

---

### Answer:
- add a VNet peering from vnet2 to vnet1

VNet peering requires both channels in both directions:
VNet1-VNet2 & VNet2-VNet1

The exhibit shows that the status of the peering `VNet1-VNet2` is `initiated`
but in order to be working the status should progress to `connected`.
This will happen when the `VNet2-VNet1` sideof the peering is also created and
set up.

When you create a Vnet peering from the Azure Portal this option is available
in the form a check box. By clicking it the Portal will create and configure
both sides of the peering: `VNet1-VNet2` & `VNet2-VNet1`

When the same process is perform with a script you must take care of both sides:

```
$vnet1 = Get-AzVirtualNetwork -Name 'vnet1' -ResourceGroup 'rg1'
$vnet2 = Get-AzVirtualNetwork -Name 'vnet2' -ResourceGroup 'rg2'

# vnet1-vnet2
Add-AzVirtualNetworkPeering -Name `vnet1-vnet2` `
-VirtualNetwork $vnet1 `
-RemoteVirtualNetwork $vnet2.Id 

# vnet2-vnet1
Add-AzVirtualNetworkPeering -Name `vnet2-vnet1` `
-VirtualNetwork $vnet2 `
-RemoteVirtualNetwork $vnet1.Id 
```

---

### References:


---

## Q130:

You must configure a subnet named `subnet1` that is part of a Vnet named `vnet1`.
Hosts on `subnet1` of `vnet1` must be able to reach resources on `vnet2` 
and also to reach a **proxy server** that scans all outbound internet requests 
from resources hosted on `subnet1`.

The **proxy server** is hosted on your on-prem Vnet.
You have an **ExpressRoute** circuit named `exp-route1` configured 
between `vnet2` and your on-prem network.

You want `vnet1` to use `exp-route1` to reach the proxy server.
The solution must minimize costs and create no additional resources!

Which two actions should you perform?

- configure VNet Peering between vnet1 and vnet2
- create a Virtual Network Gateway in vnet1
- link the virtual betwork gateways in vnet1 with `exp-route1`
- configure vnet1 peering to use the remote gateway
- configure vnet2 peering to use the remote gateway

---

### Answer:
- configure VNet Peering between vnet1 and vnet2
- configure vnet1 peering to use the remote gateway

For `vnet1` to leverage the `exp-route1` to connect the on-prem network
`vnet1` must be peered with `vnet2` as `vnet2` holds the link to `exp-route1`
and then `vnet1` must use the gateway of `vnet2`.
This gateway is used to reach the on-prem network and therefore the proxy server.

---

### References:

[Virtual network peering](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview)    
[What is Azure ExpressRoute?](https://learn.microsoft.com/en-us/azure/expressroute/expressroute-introduction)   
[About ExpressRoute virtual network gateways](https://learn.microsoft.com/en-us/azure/expressroute/expressroute-about-virtual-network-gateways)   
[Connect a virtual network to ExpressRoute circuits using the Azure portal](https://learn.microsoft.com/en-us/azure/expressroute/expressroute-howto-linkvnet-portal-resource-manager?pivots=expressroute-current)   

---

[About ExpressRoute virtual network gateways](https://learn.microsoft.com/en-us/azure/expressroute/expressroute-about-virtual-network-gateways)   

To o connect your Azure virtual network and your on-premises network using ExpressRoute, 
**you must first create a virtual network gateway**. 

**A virtual network gateway serves two purposes**: 

1. exchange IP routes between the networks and route network traffic. 
This article explains different gateway types, gateway SKUs, and estimated performance by SKU. 

2. **ExpressRoute FastPath**:
This article also explains **ExpressRoute FastPath**, a feature that enables the network traffic 
from your on-premises network to bypass the virtual network gateway to improve performance.

> Gateway Types:
`-GatewayType`: specifies whether the gateway is used for 
Each virtual network can have only one virtual network gateway per gateway type.

- VPN traffic:
aka Site-to-Site, Point-to-Site, and VNet-to-VNet connection
to send **encrypted** traffic across the public Internet

- ExpressRoute:
to send network traffic on a private connection

> Gateway SKU: 
When you create a virtual network gateway, you need to specify the gateway SKU.

- ERGwScale (Preview)
- Standard
- HighPerformance
- UltraPerformance
- ErGw1Az
- ErGw2Az
- ErGw3Az

The SKU controls the following specs: 

- Express route coexistence: yes/no
- FastPath Feature: yes/no
- Max number of circuit connections: 4, 8, 16
- Bandwith Gbps: 1, 2, 10 
- Connections per seconds x1000: 7, 14, 16 

> Gateway subnet:
Before you create an ExpressRoute gateway, you must create a gateway subnet named `GatewaySubnet`.
Is is recommended that you create a gateway subnet of **/27 or larger**. 
The gateway subnet contains the IP addresses that the virtual network gateway VMs and services use.
Never deploy anything else into the gateway subnet.

> Zone-redundant gateway SKUs:
You can also deploy ExpressRoute gateways in Azure Availability Zones. 
his configuration physically and logically separates them into different Availability Zones.

- ErGw1AZ
- ErGw2AZ
- ErGw3AZ

> FastPath:
When enabled, sends network traffic directly to virtual machines in the virtual network, bypassing the gateway
to improve the data path performance between your on-premises network and your virtual network.

> VNet-to-VNet connectivity:
By default, connectivity between virtual networks is enabled when you link multiple virtual networks 
to the same ExpressRoute circuit.
**Microsoft recommends not using your ExpressRoute circuit for communication between virtual networks.**
**Instead, we recommend you to use virtual network peering.**

[Connectivity between virtual networks over ExpressRoute](https://learn.microsoft.com/en-us/azure/expressroute/virtual-network-connectivity-guidance)  

When multiple virtual networks are linked to an ExpressRoute circuit, VNet to VNet connectivity is enabled. 
**Microsoft doesn't recommend this solution.**

An ExpressRoute virtual network gateway gets deployed into each virtual network.
Then a connection is created between the gateway and the ExpressRoute circuit
When this connection gets established, connectivity to virtual machines (VMs) and private endpoints are enabled from on-premises. 

**To establish connectivity between virtual networks, VNet peering should be implemented instead for the best performance possible.** 

---

[What is Azure ExpressRoute?](https://learn.microsoft.com/en-us/azure/expressroute/expressroute-introduction)   

ExpressRoute lets you extend your on-premises networks into the Microsoft cloud 
over a private connection with the help of a connectivity provider.
With ExpressRoute, you can establish connections to Microsoft cloud services, such as Microsoft Azure and Microsoft 365.

<img src="./Q130-1.png">

- Layer 3 connectivity between your on-premises network and the Microsoft Cloud (BGP protocol)
- more reliability + redundancy: two connections to two Microsoft Enterprise edge routers (MSEEs) at an ExpressRoute Location 
- faster speeds
- consistent latencies
- higher security than typical connections over the Internet, because they don’t go over the public Internet. 

> Resiliency

Microsoft offers multiple ExpressRoute peering locations in many geopolitical regions. For maximum resiliency, 
Microsoft recommends that you establish connection to two ExpressRoute circuits in two peering locations.

 If **ExpressRoute Metro** is available with your service provider and in your preferred peering location, 
 you can achieve a higher level of resiliency compared to a **standard ExpressRoute circuit**.

**For non-production and non-critical workloads**, you can achieve standard resiliency by connecting 
to a single ExpressRoute circuit that offers redundant connections within a single peering location.

---

[Virtual network peering](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview)    
Virtual network peering enables you to seamlessly connect two or more Virtual Networks in Azure.
The virtual networks appear as one for connectivity purposes.
The traffic between virtual machines in peered virtual networks uses the Microsoft backbone infrastructure. 
Like traffic between virtual machines in the same network, traffic is routed through Microsoft's private network only.

There are two types of VNet peering:
- Virtual network peering: Connecting virtual networks within the same Azure region.
- Global virtual network peering: Connecting virtual networks across Azure regions.

This subject was examined in detail in one of the previous questions.

---

## Q129:

You deployed two VNets that have the following properties:

- dev-vnet-west (West US)
- prod-vnet-east (East US)

You configure **global VNet peering** to link to `dev-vnet-west` and `prod-vnet-east` VNets.
You need to ensure that VMs in either VNet can resolve fully qualified domain names (FQDNs)
of any other VM in Azure.

What should you do?

- use Azure provided DNS in each VNet
- create a private zone in Azure DNS
- add service endpoints to each VNet
- deploy DNS servers in each VNet and add their private IP addresses to the DNS server list

---

### Answer:
- create a private zone in Azure DNS

**Peered VNets are unable to support hostname resolution between themselves**.
That is if you have a FQDN on a VM2 in a peered VNet2 you cannot automatically 
resove its IP address from VNet1, **you must either**: 

- set up an external DNS server in VNet1
- use Azure DNS and a private zone to resolve the non-public, routable IP of VM2 in VNet2

The rpinciple is that VM2 in VNet2 registers its non-public, routable IP and host record 
with the private Azure DNS Zone and the Azure DNS provides resolution of the hostename
from Vnet1 to Vnet2.

The remaining options do not apply:

- use Azure provided DNS in each VNet
- add service endpoints to each VNet
- deploy DNS servers in each VNet and add their private IP addresses to the DNS server list

---

### References:

[AZ-700-Azure DNS Private Resolver Deep Dive - John Savill](https://www.youtube.com/watch?v=V8ChsYAyxTc&t=236s)    

--- 

[Name resolution for resources in Azure virtual networks](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-name-resolution-for-vms-and-role-instances?tabs=redhat)    

In order to facilitate communication between the virtual machines (VMs) and 
other resources deployed in a virtual network, it may be necessary to allow them 
to communicate with each other. 

The use of easily remembered and unchanging names simplifies the communication 
process, rather than relying on IP addresses.

> Resolve FQDNs to IP addresses internal to Azure:
When resources deployed in virtual networks need to resolve domain names to internal IP addresses, 
they can use one of four methods:

1. [Azure DNS private zones](https://learn.microsoft.com/en-us/azure/dns/private-dns-overview)  

2. [Azure-provided name resolution](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-name-resolution-for-vms-and-role-instances?tabs=redhat#azure-provided-name-resolution)  

3. [What is Azure DNS Private Resolver?](https://learn.microsoft.com/en-us/azure/dns/dns-private-resolver-overview)    

4. [Name resolution that uses your own DNS server](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-name-resolution-for-vms-and-role-instances?tabs=redhat#name-resolution-that-uses-your-own-dns-server)    


The type of name resolution you use depends on how your resources need to communicate with each other. 

> Scenario-1:
- VMs in the same VNet 
- or Azure Cloud Services role in the same cloud service
> solution-1: Azure Private DNS | Azure-provided name resolution
> DNS suffix: FQDN | hostname 

-------------------------------------------------------------------------------------

> Scenario-2:
- VMs in different VNets
- or Azure Cloud Services role in the different cloud service
> solution-2: Azure Private DNS | Azure DNS Private Resolver
> DNS suffix: FQDN

> Scenario-3:
- from an Azure App Service, Function, Bot with VNet integration 
  to role instances or VMs in the same virtual network.
> solution-3: Azure DNS Private Resolver | Name resolution using your own DNS server
> DNS suffix: FQDN

> Scenario-4:
- from App Service Web Apps to VMs in the same virtual network
> solution-4: Azure DNS Private Resolver | Name resolution using your own DNS server
> DNS suffix: FQDN

> Scenario-5:
- from App Service Web Apps to VMs in a DIFFERENT virtual network
> solution-5: Azure DNS Private Resolver | Name resolution using your own DNS server
> DNS suffix: FQDN

> Scenario-6:
- from VMs or role instances in Azure TO on-premises computer and service names
> solution-6: Azure DNS Private Resolver | Name resolution using your own DNS server
> DNS suffix: FQDN

-------------------------------------------------------------------------------------

> Scenario-6:
- from on-premises computer TO VMs or role instances in Azure
> solution-6 :  Name resolution using your own DNS server
> DNS suffix: FQDN

> Scenario-7:
- from on-premises computer TO Azure hostnames
> solution-7 :  Name resolution using your own DNS server
> DNS suffix: FQDN

> Scenario-8:
- resolution between VMs or role instances located in different cloud services, not in a virtual network
> solution-8 : all 4 methods are applicable
> DNS suffix: NA

-------------------------------------------------------------------------------------

> Scenario-9:
- Reverse DNS for internal IPs
> solution-9 : Connectivity between VMs and role instances in different cloud services isn't supported outside a virtual network.
> DNS suffix: NA

-------------------------------------------------------------------------------------


---

1. [What is Azure Private DNS?](https://learn.microsoft.com/en-us/azure/dns/private-dns-overview)  

Azure DNS is a hosting service for domains and provides naming resolution using the Microsoft Azure infrastructure. 
Azure DNS not only supports internet-facing DNS domains, but **it also supports private DNS zones**.
**Azure Private DNS provides a reliable and secure DNS service for your virtual networks**,
**without the need to configure a custom DNS solution.**

By using private DNS zones, you can use your own custom domain name instead of the Azure-provided
names during deployment. Using a custom domain name helps you tailor your virtual network architecture 
to best suit your organization's needs. 
**It provides a naming resolution for virtual machines (VMs) within a virtual network and connected** 
**virtual networks**.

> Link a VNet with a Zone 
To resolve the records of a **private DNS zone from your virtual network**, you must link the virtual network with the zone.
Linked virtual networks have full access and can resolve all DNS records published in the private zone. 

> Autoregistration:
**You can also enable autoregistration on a virtual network link** and then the DNS records for the virtual machines 
in that virtual network are **automatically** registered in the private zone. 
When autoregistration gets enabled, Azure DNS will update the zone record whenever a virtual machine gets 
**created, changes its' IP address, or gets deleted**.

> Benefits of Azure Private DNS:

- Removes the need for custom DNS solutions

- Use all common DNS records types:
Azure DNS supports A, AAAA, CNAME, MX, PTR, SOA, SRV, and TXT records. 

- Automatic hostname record management:
Azure automatically maintains hostname records for the VMs in the specified virtual networks. 
> Autoregistration enabled: Automatic registration of virtual machines from a virtual network that's linked to a private zone 

- Hostname resolution between virtual networks:
Unlike Azure-provided host names, private DNS zones can be shared between virtual networks. 
This capability simplifies cross-network and service-discovery scenarios, such as virtual network peering.

- **Split-horizon DNS support**:
With Azure DNS, you can create zones with the same name that resolve to different answers from 
within a virtual network and from the public internet. 
A typical scenario for split-horizon DNS is to provide a dedicated version of a service for use inside your virtual network.

- Forward DNS resolution is supported across virtual networks that are linked to the private zone
- Reverse DNS lookup is supported within the virtual-network scope

---

2. [Azure-provided name resolution](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-name-resolution-for-vms-and-role-instances?tabs=redhat#azure-provided-name-resolution)  

Azure provided name resolution **provides only basic authoritative DNS capabilities**.
VMs and instances in a cloud service share the same DNS suffix, so the host name alone is sufficient.
Azure provides internal name resolution for VMs and role instances that reside within the same virtual network or cloud service. 

> ARM Deployment Model:
In virtual networks deployed using the Azure Resource Manager deployment model, the DNS suffix is consistent 
across the all virtual machines within a virtual network, so the FQDN isn't needed.

> Classic Deployment Model:
**But in virtual networks deployed using the classic deployment model**, 
different cloud services have different DNS suffixes. 
**In this situation, you need the FQDN to resolve names between different cloud services**.

> Advantages:

- easy to use
- high availability
- You can use the service with your own DNS servers, to resolve both on-premises and Azure host names
- You can use name resolution between VMs and role instances within the same cloud service, without the need for an FQDN
- You can use name resolution between VMs in virtual networks that use the Azure Resource Manager deployment model, without need for an FQDN
- You can use host names that best describe your deployments, rather than working with autogenerated names.

> Notes:
- The **Azure DNS IP** address is `168.63.129.16`. This address is a static IP address and doesn't change.

> Limitations:

- Virtual networks in the classic deployment model require an FQDN when you're resolving names in different cloud services.
- The Azure-created DNS suffix can't be modified
- You can't manually register your own records
- Use a different name for each virtual machine in a virtual network to avoid DNS resolution issues.

---

3. [What is Azure DNS Private Resolver?](https://learn.microsoft.com/en-us/azure/dns/dns-private-resolver-overview)  

[AZ-700-Azure DNS Private Resolver Deep Dive - John Savill](https://www.youtube.com/watch?v=V8ChsYAyxTc&t=236s)    

Azure DNS Private Resolver is a service that enables you to query Azure DNS private zones 
**from an on-premises environment and vice versa without deploying VM based DNS servers**.
You don't need to change any DNS client settings on your virtual machines (VMs) to use the Azure DNS Private Resolver.

> Inbound endpoints:
**Azure DNS Private Resolver requires an Azure Virtual Network.**
When you create an Azure DNS Private Resolver inside a virtual network, 
**one or more inbound endpoints are established that can be used as the destination for DNS queries**.

> outbound endpoint:
The resolver's outbound endpoint processes DNS queries based on a DNS forwarding ruleset that you configure. 

> Process:
A client in a virtual network issues a DNS query.
If the DNS servers for this virtual network are specified as custom, then the query is forwarded to the specified IP addresses.
If Default (Azure-provided) DNS servers are configured in the virtual network, and there are Private DNS zones linked to the same virtual network, these zones are consulted.
If the query doesn't match a Private DNS zone linked to the virtual network, then Virtual network links for DNS forwarding rulesets are consulted.
If no ruleset links are present, then Azure DNS is used to resolve the query.
If ruleset links are present, the DNS forwarding rules are evaluated.
If a suffix match is found, the query is forwarded to the specified address.
If multiple matches are present, the longest suffix is used.
If no match is found, no DNS forwarding occurs and Azure DNS is used to resolve the query.

> Benefits:
Fully managed: Built-in high availability, zone redundancy.
Cost reduction: Reduce operating costs and run at a fraction of the price of traditional IaaS solutions.
Private access to your Private DNS zones: Conditionally forward to and from on-premises.
Scalability: High performance per endpoint.
DevOps Friendly: Build your pipelines with Terraform, ARM, or Bicep.

---

4. [Name resolution that uses your own DNS server](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-name-resolution-for-vms-and-role-instances?tabs=redhat#name-resolution-that-uses-your-own-dns-server)      

---

## Q128:

your company's Azure Infrastructure team needs a traffic control solution for their deployment.

The topology for the deployment:

- edge subnet:
a linux NVA that runs an enterprise firewall with IP forwarding enabled

- data1 subnet:
four Windows Server VMs

- data2 subnet:
four Ubuntu VMs

You must recommend a solution to the infrastructure team so that 
all outbound Azure VM traffic must pass through the NVA firewall on the edge subnet.

What two actions should you perform?

- create a route table with the next-hop IP address
- deploy two internal load balancers between the three subnets
- create a NSG with an outbound rule
- bind the resource to each VM's NIC
- bind the resource ti eah subnet


---

### Answer:
- create a route table with the next-hop IP address
- bind the resource to each subnet

A route table with the next-hop IP address will route all traffic to the IP of the 
next-hop from any subnet to which the route table is **bound** to. 

The available next hops are:

- NVA (Network Visrtual Appliance)
- Internet
- another Virtual Network
- Virtual Network Gateway

The remaining options do not apply:
- deploy two internal load balancers between the three subnets
- create a NSG with an outbound rule
- bind the resource to each VM's NIC

---

### References:

[Tutorial: Route network traffic with a route table using the Azure portal](https://learn.microsoft.com/en-us/azure/virtual-network/tutorial-create-route-table-portal)   

[Use network virtual appliances on a virtual network](https://learn.microsoft.com/en-us/windows-server/networking/sdn/manage/use-network-virtual-appliances-on-a-vn)  

```
$routetableproperties = new-object Microsoft.Windows.NetworkController.RouteTableProperties

$route = new-object Microsoft.Windows.NetworkController.Route
$route.ResourceID = "0_0_0_0_0"
$route.properties = new-object Microsoft.Windows.NetworkController.RouteProperties
$route.properties.AddressPrefix = "0.0.0.0/0"
$route.properties.nextHopType = "VirtualAppliance"
$route.properties.nextHopIpAddress = "192.168.1.10"

$routetableproperties.routes += $route

$routetable = New-NetworkControllerRouteTable -ConnectionUri $uri -ResourceId "Route1" -Properties $routetableproperties

$vnet = Get-NetworkControllerVirtualNetwork -ConnectionUri $uri -ResourceId "Tenant1_VNet1"
$vnet.properties.subnets[0].properties.RouteTable = $routetable
new-networkcontrollervirtualnetwork -connectionuri $uri -properties $vnet.properties -resourceId $vnet.resourceid

```

As soon as you apply the routing table to the virtual network, traffic gets forwarded to the virtual appliance. 
**You must configure the routing table in the virtual appliance to forward the traffic**, in a manner that is 
appropriate for your environment.

--- 

[Virtual network traffic routing](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-udr-overview)    

---

## Q127:

You have a VNet `corp-net` that has been recently deployed with the following properties:

- address range:    172.16.0.0/16
- front-end subnet: 172.16.2.0/24
- mid-tier subnet: 172.16.3.0/24
- back-end subnet:  172.16.4.0/24

You must change the `corp-net` address space beacause it conflicts with your 
on-prem IPv4 space. 
The new address psace should be `192.168.0.0/16` and you must also redifine the subnets IDs 
before your collegues attempt to migrate VMs to the new VNet.

What should you do?

- delete the three subnets from `corp-vnet`
- add the `192.168.0.0/16` address space to `corp-vnet`
- remove and redeploy `corp-vnet`
- edit and change the `corp-vnet`address range to `192.168.0.0/16`

---

### Answer:
- remove and redeploy `corp-vnet`
**The definition of a VNet and its subnets is immutable**.
The deletion of a VNet **requires** the deletion of its subnets firts!
In this scenario a complete redeploy is the simplest solution available.

---

### References:

[Create, change, or delete a virtual network](https://learn.microsoft.com/en-us/azure/virtual-network/manage-virtual-network)   

```
## Create myVNet virtual network. ##
New-AzVirtualNetwork -ResourceGroupName myResourceGroup -Name myVNet -Location eastus -AddressPrefix 10.0.0.0/16

# Azure CLI
## Create myVNet virtual network with the default address space: 10.0.0.0/16. ##
az network vnet create --resource-group myResourceGroup --name myVNet
```

> Delete a virtual network:

**You can delete a virtual network only if there are no resources connected to it**. 
If there are resources connected to any subnet within the virtual network, 
**you must first delete the resources that are connected to all subnets within the virtual network**. 

The steps you take to delete a resource vary depending on the resource. 
To learn how to delete resources that are connected to subnets, read the documentation for each resource type you want to delete. 
To delete a virtual network:

`az network vnet delete --resource-group myResourceGroup --name myVNet`
`Remove-AzVirtualNetwork -ResourceGroupName myResourceGroup -Name myVNet`


---

[Add, change, or delete a virtual network subnet](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-manage-subnet?tabs=azure-portal)  

---

## Q126:

You plan to deploy a new app to your Azure sub.
You must configure the required layered infrastructure.

- front-end servers on VMs
- back-end servers on VMs
- database on Azure SQL Server

You must ensure that you can apply **security filtering on each layer independently**.
The solution must be with minimal effort.

Which five actions in a sequence should you perform?

- create a VNet for each layer
- create three subnets
- enable service endpoints for the subnets
- create a single VNet
- enable service endpoints for the VNet
- create two subnets
- create a resource group
- configure peering on each VNet

---

### Answer:

- create a resource group
- create a single VNet
- create two subnets
- enable service endpoints for the VNet
- enable service endpoints for the subnets

This sequence is self-explanatory the only step that might need a clarifycation
is the last: **enable service endpoints for the subnets**.
It is not sufficient to enable SEP on the VNet, it must ALSO be done at the 
subnets level.

The remaining options do not apply:
- create three subnets
- create a VNet for each layer
- configure peering on each VNet

---

### References:

[Virtual Network service endpoints](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-service-endpoints-overview)  

Virtual Network (VNet) service endpoint provides secure and direct connectivity to Azure services over an optimized route over the Azure backbone network.

Endpoints allow you to secure your critical Azure service resources to only your virtual networks.

**Service Endpoints enables private IP addresses in the VNet to reach the endpoint** 
**of an Azure service without needing a public IP address on the VNet**.

---

[Virtual network peering](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview)    

Virtual network peering enables you to seamlessly connect two or more Virtual Networks in Azure. The virtual networks appear as one for connectivity purposes. The traffic between virtual machines in peered virtual networks uses the Microsoft backbone infrastructure. Like traffic between virtual machines in the same network, traffic is routed through Microsoft's private network only.

Azure supports the following types of peering:

- Virtual network peering: Connecting virtual networks within the same Azure region.
- Global virtual network peering: Connecting virtual networks across Azure regions.

> benefits :


- A low-latency, high-bandwidth connection 
between resources in different virtual networks.

The ability for resources in one virtual network to communicate with resources in a different virtual network.

The ability to transfer data between virtual networks across Azure subscriptions, Microsoft Entra tenants, deployment models, and Azure regions.

The ability to peer virtual networks created through the Azure Resource Manager.

The ability to peer a virtual network created through Resource Manager to one created through the classic deployment model. To learn more about Azure deployment models, see Understand Azure deployment models.

No downtime to resources in either virtual network when creating the peering, or after the peering is created.

---

[Quickstart: Use Azure PowerShell to create a virtual network](https://learn.microsoft.com/en-us/azure/virtual-network/quick-create-powershell)    

```
$vnet = @{
    Name = 'vnet-1'
    ResourceGroupName = 'test-rg'
    Location = 'eastus2'
    AddressPrefix = '10.0.0.0/16'
}
$virtualNetwork = New-AzVirtualNetwork @vnet


$subnet = @{
    Name = 'subnet-1'
    VirtualNetwork = $virtualNetwork
    AddressPrefix = '10.0.0.0/24'
}
$subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet


$virtualNetwork | Set-AzVirtualNetwork

```

> Deploy Azure Bastion:

```
$subnet = @{
    Name = 'AzureBastionSubnet'
    VirtualNetwork = $virtualNetwork
    AddressPrefix = '10.0.1.0/26'
}
$subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet

$virtualNetwork | Set-AzVirtualNetwork

# Create a public IP address for Bastion. 
# The Bastion host uses the public IP to access SSH and RDP over port 443.
$ip = @{
        ResourceGroupName = 'test-rg'
        Name = 'public-ip'
        Location = 'eastus2'
        AllocationMethod = 'Static'
        Sku = 'Standard'
        Zone = 1,2,3
}
New-AzPublicIpAddress @ip

$bastion = @{
    Name = 'bastion'
    ResourceGroupName = 'test-rg'
    PublicIpAddressRgName = 'test-rg'
    PublicIpAddressName = 'public-ip'
    VirtualNetworkRgName = 'test-rg'
    VirtualNetworkName = 'vnet-1'
    Sku = 'Basic'
}

New-AzBastion @bastion

```

---

[Tutorial: Create a secure n-tier app in Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/tutorial-secure-ntier-app)   

 It's important that N-tier applications are architected to protect back-end 
 resources to the greatest extent possible.

In this tutorial, you learn how to deploy a secure N-tier application, 
with a front-end web app that connects to another network-isolated web app. 
All traffic is isolated within your Azure Virtual Network using 
**Virtual Network integration and private endpoints**. 

<img src="./Q126-1.png">

- Virtual network:
Contains two subnets, one is integrated with the front-end web app, and the other 
has a private endpoint for the back-end web app. The virtual network blocks all 
inbound network traffic, except for the front-end app that's integrated with it.

- Front-end web app
Integrated into the virtual network and accessible from the public internet.

- Back-end web app 
Accessible only through the private endpoint in the virtual network.

- Private endpoint 
Integrates with the back-end web app and makes the web app accessible with a private IP address.

- Private DNS zone 
Lets you resolve a DNS name to the private endpoint's IP address.

> Notes:

- Public traffic to the back-end app is blocked.
- Outbound traffic from App Service is routed to the virtual network and can reach the back-end app.
- App Service is able to perform DNS resolution to the back-end app.

You'll create the following network resources:

You need **two instances of a web app**
- one for the frontend 
- and one for the backend. 
You need to use at least the Basic tier in order to use virtual network integration and private endpoints.
You'll configure the virtual network integration and other configurations later on.

A virtual network.
A subnet for the App Service virtual network integration.
A subnet for the private endpoint.
A private DNS zone.
A private endpoint.

> 4. Enable deployment to back-end web app from internet

Since your backend web app isn't publicly accessible, you must let your continuous deployment 
tool reach your app by making the SCM site publicly accessible. 
The main web app itself can continue to deny all traffic.

1. 

Enable public access for the back-end web app.:
`az webapp update --resource-group $groupName --name <backend-app-name> --set publicNetworkAccess=Enabled`  

2. 
Set the unmatched rule action for the main web app to deny all traffic. 
This setting denies public access to the main web app even though the general app access 
setting is set to allow public access.
`az resource update --resource-group $groupName --name <backend-app-name> --namespace Microsoft.Web --resource-type sites --set properties.siteConfig.ipSecurityRestrictionsDefaultAction=Deny`

3. Set the unmatched rule action for the SCM site to allow all traffic.
`az resource update --resource-group $groupName --name <backend-app-name> --namespace Microsoft.Web --resource-type sites --set properties.siteConfig.scmIpSecurityRestrictionsDefaultAction=Allow`

> 5. Lock down FTP and SCM access:

Disable FTP access for both the front-end and back-end web apps. 
Replace <frontend-app-name> and <backend-app-name> with your app names.

```
az resource update --resource-group $groupName --name ftp --namespace Microsoft.Web --resource-type basicPublishingCredentialsPolicies --parent sites/<frontend-app-name> --set properties.allow=false

az resource update --resource-group $groupName --name ftp --namespace Microsoft.Web --resource-type basicPublishingCredentialsPolicies --parent sites/<backend-app-name> --set properties.allow=false
```

Disable basic auth access to the WebDeploy ports and SCM/advanced tool sites
for both web apps. Replace <frontend-app-name> and <backend-app-name> with your app names

```
az resource update --resource-group $groupName --name scm --namespace Microsoft.Web --resource-type basicPublishingCredentialsPolicies --parent sites/<frontend-app-name> --set properties.allow=false

az resource update --resource-group $groupName --name scm --namespace Microsoft.Web --resource-type basicPublishingCredentialsPolicies --parent sites/<backend-app-name> --set properties.allow=false
```

THERE ARE MORE STEPS...

---

## Q125:

You are an Azure admin and you need to swap deployment slots for a web app.
You must swat the slots staging with production.

```
OPTIONS-1 -SourceSlotName 'source' -DestinationSlotName 'production' `
-ResourceGroupName 'rg1' -Name 'wapp1' -SwapWithPreviewAction OPTIONS-2

OPTIONS-3 - -SourceSlotName 'source' -DestinationSlotName 'production' `
-ResourceGroupName 'rg1' -Name 'wapp1' -SwapWithPreviewAction OPTIONS-4
```

OPTIONS-1/-3
New-AzWebAppSlot
Switch-AzWebAppSlot
Set-AzWebAppSlot

OPTIONS-2/4
ApplySlotConfig
ResetSlotSwap
CompleteSlotSwap

---

### Answer:

```
# preview the swap
Switch-AzWebAppSlot -SourceSlotName 'source' -DestinationSlotName 'production' `
-ResourceGroupName 'rg1' -Name 'wapp1' -SwapWithPreviewAction ApplySlotConfig

# verify

# complet the swap
Switch-AzWebAppSlot- -SourceSlotName 'source' -DestinationSlotName 'production' `
-ResourceGroupName 'rg1' -Name 'wapp1' -SwapWithPreviewAction CompleteSlotSwap
```

This is a swap done with a preview action set by the switch `SwapWithPreviewAction`
and it is referred to as **multi-stage swap**. It allows to perform the swap with a 
preview so that the result can be verified and later the swap can be completed.

---

### References:

[Switch-AzWebAppSlot](https://learn.microsoft.com/en-us/powershell/module/az.websites/switch-azwebappslot?view=azps-11.5.0&viewFallbackFrom=azps-10.1.0)  

[Set up staging environments in Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-staging-slots?tabs=cli)    

> Swap with preview (multi-phase swap):

Before you swap into production as the target slot, validate that the app runs with the swapped settings. 
The source slot is also warmed up before the swap completion, which is desirable for mission-critical applications.

When you perform a swap with preview, App Service performs the same swap operation but pauses after the first step.
You can then verify the result on the staging slot before completing the swap.

If you cancel the swap, App Service reapplies configuration elements to the source slot.

- To swap a slot into production with preview:
`az webapp deployment slot swap --resource-group <group-name> --name <app-name> --slot <source-slot-name> --target-slot production --action preview`  

`Switch-AzWebAppSlot -SourceSlotName "<source-slot-name>" -DestinationSlotName "production" -ResourceGroupName "<group-name>" -Name "<app-name>" -SwapWithPreviewAction ApplySlotConfig`

- To complete the swap:

`az webapp deployment slot swap --resource-group <group-name> --name <app-name> --slot <source-slot-name> --target-slot production --action swap`

`Switch-AzWebAppSlot -SourceSlotName "<source-slot-name>" -DestinationSlotName "production" -ResourceGroupName "<group-name>" -Name "<app-name>" -SwapWithPreviewAction CompleteSlotSwap`

- To cancel the swap:

`az webapp deployment slot swap --resource-group <group-name> --name <app-name> --slot <source-slot-name> --target-slot production --action reset`

`Switch-AzWebAppSlot -SourceSlotName "<source-slot-name>" -DestinationSlotName "production" -ResourceGroupName "<group-name>" -Name "<app-name>" -SwapWithPreviewAction ResetSlotSwap`

> Roll back a swap:

If any errors occur in the target slot (for example, the production slot) after a slot swap, 
restore the slots to their pre-swap states by swapping the same two slots immediately.

> Configure auto swap:

Auto swap streamlines Azure DevOps scenarios where you want to deploy your app continuously with zero cold starts and zero downtime for customers of the app. When auto swap is enabled from a slot into production, every time you push your code changes to that slot, App Service automatically swaps the app into production after it's warmed up in the source slot.

**Auto swap isn't supported in web apps on Linux and Web App for Containers.**

`az webapp deployment slot auto-swap --name <app-name> --resource-group <group-name> --slot <source-slot-name>`
`Set-AzWebAppSlot -ResourceGroupName "<group-name>" -Name "<app-name>" -Slot "<source-slot-name>" -AutoSwapSlotName "production"`  

--

## Q124:

You are an Azure admin for a company.

You have been tasked with configuring TLS mutual authentication for 
Azure App Service. 
You set up your app with **required client certificates**.

You need to enable client certificates using ARM templates.

```
{
    "type": "Microsoft.Web/sites",
    "apiVersion": "2020-06-01",
    "name": "[parameters('webAppName')]",
    "location": "[parameters('location')]",
    "dependsOn": [
        "[resourceId('Microsoft.Web/serverfarms', variables('appServicePlanPortalName'))]"
    ],
    "properties": {
        "serverFarmId": "[resourceId('Microsoft.Web/serverfarms', variables('appServicePlanPortalName'))]",
        "siteConfig": {
            "linuxFxVersion": "[parameters('linuxFxVersion')]"
        },
        "OPTIONS": true,
        "OPTIONS": "Required",
        "OPTIONS": "/sample1;/sample2"
    }
}
```

OPTIONS:
clientCertExclusionPaths
clientAffinityEnabled
clientCertEnabled
clientCertMode


---

### Answer:

```
{
    "type": "Microsoft.Web/sites",
    "apiVersion": "2020-06-01",
    "name": "[parameters('webAppName')]",
    "location": "[parameters('location')]",
    "dependsOn": [
        "[resourceId('Microsoft.Web/serverfarms', variables('appServicePlanPortalName'))]"
    ],
    "properties": {
        "serverFarmId": "[resourceId('Microsoft.Web/serverfarms', variables('appServicePlanPortalName'))]",
        "siteConfig": {
            "linuxFxVersion": "[parameters('linuxFxVersion')]"
        },
        "clientCertEnabled": true,
        "clientCertMode": "Required",
        "clientCertExclusionPaths": "/sample1;/sample2"
    }
}
```

---

### References:

[Configure TLS mutual authentication for Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/app-service-web-configure-tls-mutual-auth?tabs=azurecli)  

> Enable client certificates: ARM + Bicep + Azure CLI

`az webapp update --set clientCertEnabled=true --name <app-name> --resource-group <group-name>`

> Bicep:

```
resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webSiteName
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
    clientCertEnabled: true
    clientCertMode: 'Required'
    clientCertExclusionPaths: '/sample1;/sample2'
  }
}
```

```
{
    "type": "Microsoft.Web/sites",
    "apiVersion": "2020-06-01",
    "name": "[parameters('webAppName')]",
    "location": "[parameters('location')]",
    "dependsOn": [
        "[resourceId('Microsoft.Web/serverfarms', variables('appServicePlanPortalName'))]"
    ],
    "properties": {
        "serverFarmId": "[resourceId('Microsoft.Web/serverfarms', variables('appServicePlanPortalName'))]",
        "siteConfig": {
            "linuxFxVersion": "[parameters('linuxFxVersion')]"
        },
        "clientCertEnabled": true,
        "clientCertMode": "Required",
        "clientCertExclusionPaths": "/sample1;/sample2"
    }
}
```

You can restrict access to your Azure App Service app by enabling different types of authentication for it. 
**One way to do it is to request a client certificate when the client request is over TLS/SSL and validate the certificate**. 
**This mechanism is called TLS mutual authentication or client certificate authentication**. 
This article shows how to set up your app to use client certificate authentication.

If you access your site over HTTP and not HTTPS, you will not receive any client certificate.
So if your application requires client certificates, you should not allow requests to your application over HTTP.

> Requirements:

To **create custom TLS/SSL bindings or enable client certificates** for your App Service app, 
your **App Service plan** must be in the: 
**Basic, Standard, Premium, or Isolated tier**.

**Make sure that your web app isn't in the F1 or D1 tier, which doesn't support custom TLS/SSL**.

> Exclude paths from requiring authentication:

When you enable mutual auth for your application, all paths under the root of your app 
require a client certificate for access.
To remove this requirement for certain paths, define exclusion paths as part of your 
application configuration.

> Access client certificate:

In App Service, **TLS termination of the request happens at the frontend load balancer**. 

**When forwarding the request to your app code with client certificates enabled**, 
App Service injects an `X-ARR-ClientCert` request header with the client certificate. 
App Service does not do anything with this client certificate other than forwarding it to your app. 
**Your app code is responsible for validating the client certificate**.

For ASP.NET, the client certificate is available through the `HttpRequest.ClientCertificate` 
property. For other application stacks (Node.js, PHP, etc.), the client cert is available in 
your app through a base64 encoded value in the `X-ARR-ClientCert` request header.

---

[Use a TLS/SSL certificate in your code in Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/configure-ssl-certificate-in-code)    

 Your app code may act as a client and access an external service that requires 
 certificate authentication, or it may need to perform cryptographic tasks. 
 This how-to guide shows how to use public or private certificates in your application code.

 This approach to using certificates in your code makes use of the TLS functionality in 
 App Service, which requires your app to be in Basic tier or higher.

---

## Q123:

You recently joined a company to take over the management of their Azure tenant.
You find that  their Azure App Service are not backed up and that they are ta risk.

The App Service features:

Data usage: 6 GB
linked database: MySQL
linked database size: 3 GB

You decide to use **Premium** storage for the backups and to perform it once 
a day. You also want indefinite retention points for the backups.

Select yes/no:

- automatic App Service backups include linked databases
- custom app service backups support indefinite retention
- custom app service backups are available on the Premium storage tier
---

### Answer:

- automatic App Service backups include linked databases
No, only manual custom backup includes the also the database as follows:
Backup size	10 GB, 4 GB of which cab be the linked to a database.

Automatic backups do not include the linked DB and are up to 30 GB.

- custom app service backups support indefinite retention
Yes

- custom app service backups are available on the Premium storage tier
Yes.

Custom backups are available on Basic, Standard, Premium and isolated tier 
of App Services and in all cases Premium storage can be used.

Automatic backups do not require a storage account.

---

### References:

The references have been examined in detailed in a previous question.

---

## Q122:

You develop a new Web app whose source code is in an Azure DevOps Git Repo.
Before moving to production the app must be reviewed by test users.

You must prepare the target environment to be ready to publish the app.

Which four commands should you run in sequence?

`New-AzWebApp`
`Publish-AzWebApp`
`Start-AzWebAppSlot`
`New-AzWebAppSlot`
`New-AzAppServicePlan`
`New-AzResourceGroup`

---

### Answer:

`New-AzResourceGroup`
`New-AzAppServicePlan`
`New-AzWebApp`
`New-AzWebAppSlot`

This sequnece is self-explanatory.
Thecommand `New-AzWebAppSlot` create a slot dor the app to be published into
so that testers can test the app on this test slot before rolling it out to 
production with a swap.

The remaining options:

`Publish-AzWebApp`:
this cmdlet performs the upload of the zip with the binary files to an existing App Service Slot.

`Start-AzWebAppSlot`:
This cmdlet can be used to control the state of a web app lot to initiate the start process.

---

### References:

[New-AzWebAppSlot](https://learn.microsoft.com/en-us/powershell/module/az.websites/new-azwebappslot?view=azps-11.4.0)  
creates an Azure Web App Slot in a given a resource group that uses the specified App Service plan and data center

[Publish-AzWebApp](https://learn.microsoft.com/en-us/powershell/module/az.websites/publish-azwebapp?view=azps-11.4.0)   
Deploys an Azure Web App from a ZIP, JAR, or WAR file using zipdeploy.

[Start-AzWebAppSlot](https://learn.microsoft.com/en-us/powershell/module/az.websites/start-azwebappslot?view=azps-11.4.0)   

---

## Q121:

You administer an Azure Web App called `wapp1`.
The app hosts a public website for your company.
The Marketing department publishes over 35 GB of images, audio and video files.
You notice that following this publish event the backup of the app has stopped working.

You must resolve the issue and minimize the effort.

Which two actions should you perform?

- perform a backup to an on-premise backup solution
- configure an operational backup for Azure Blobs
- perform a backup using a snapshot
- move images, audio and video files to Azure Storage

---

### Answer:

- move images, audio and video files to Azure Storage
- configure an operational backup for Azure Blobs

App Service in Basic, Standard, Premium, and Isolated tiers provides: 

- custom on-demand manual backup
- or on a schedule basis backup

You can restore a backup: 

- by overwriting an existing app 
- by restoring to a new app or slot

The remaining options do not apply:

- perform a backup using a snapshot:
this does not minimize cost and effort

- perform a backup to an on-premise backup solution:
this does not minimize cost and effort

---

For App Service Environments:

- Automatic backups can be restored to a target app within the App Service environment itself, not in another App Service environment.

- Custom backups can be restored to a target app in another App Service environment, such as from App Service Environment v2 to App Service Environment v3.

- Backups can be restored to target app of the same OS platform as the source app.

---

> Back up & restore vs. disaster recovery:

- Disaster recovery guidance:
Bring App Service resources back online in a different Azure region during a regional disaster.

> Automatic vs. custom backups:

There are two types of backups in App Service. 
[ Premium, Isolated.	Basic, Standard, Premium, Isolated.]

- Automatic backups 
made for your app regularly as long as it's in a supported pricing tier. 
Backup size	30 GB
Linked database	Not backed up.
Storage account required:	No.	
Backup frequency:	Hourly, not configurable
Downloadable:	No.	
Backups over VNet: Not supported.

- Custom backups 
require initial configuration, and can be made on-demand or on a schedule. 
Backup size	10 GB, 4 GB of which cab be the linked to a database.

Linked database > The following linked databases can be backed up:
 - SQL Database
 - Azure Database for MySQL
 - Azure Database for PostgreSQL
 - MySQL in-app

Storage account required: Yes.
Backup frequency:	Configurable.
Downloadable:	Yes, as Azure Storage blobs.
Backups over VNet:	Supported.

---

### References:

[Back up and restore your app in Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/manage-backup?tabs=portal)    

Azure Backup allows you to configure operational and vaulted backups to protect **block blobs** in your storage accounts. 

---

[Configure and manage backup for Azure Blobs using Azure Backup](https://learn.microsoft.com/en-us/azure/backup/blob-backup-configure-manage?tabs=operational-backup)   

> Operational backup:

Operational backup of blobs is a local backup solution that maintains data for a specified duration in the source storage account itself. This solution doesn't maintain an additional copy of data in the vault. This solution allows you to retain your data for restore for up to 360 days. Long retention durations may, however, lead to longer time taken during the restore operation.

The solution can be used to perform restores to the source storage account only and may result in data being overwritten.

If you delete a container from the storage account by calling the Delete Container operation, that container can't be restored with a restore operation. Rather than deleting an entire container, delete individual blobs if you may want to restore them later. 
**Microsoft recommends enabling soft delete for containers**, in addition to operational backup, to protect against accidental deletion of containers.

Ensure that the `Microsoft.DataProtection` provider is registered for your subscription.

> Vaulted backup:

Vaulted backup of blobs is a **managed offsite backup solution** that transfers data to the backup vault and retains as per the retention configured in the backup policy. You can retain data **for a maximum of 10 years**.

Currently, you can use the vaulted backup solution to 
**restore data to a different storage account only**. 

While performing restores, ensure that the target storage account doesn't contain any containers with the same name as those backed up in a recovery point. If any conflicts arise due to the same name of containers, the restore operation fails.

**Ensure the storage accounts that need to be backed up have cross-tenant** **replication enabled**. You can check this by navigating to:
`the storage account > Object replication > Advanced settings`. 
Once here, ensure that the check-box is enabled.

> Grant permissions to the Backup vault on storage accounts:

It requires the **Backup vault to have certain permissions on the SAs** 
that need to be protectedn the minimum permissions have been consolidated under the `Storage Account Backup Contributor` role.

We recommend you to assign this role to the Backup vault before you configure backup.

> Create a backup policy:

A backup policy defines the schedule and frequency of the recovery points creation, and its retention duration in the Backup vault. 

---

## Q120:

You manage Azure Workloads for company1.
You have recently migrated your public website to Azure Web Apps.
You are told that the public site is not available at the company URL:
`https://wwww.company1.com`

You must configure the **Domain Name System (DNS)** record to resolve the issue.

What are two possible options?

- create a Name Server NS record and map it to the IP address og the WebApp1
- create a CNAME Canonical Name and map it to `https://wwww.company1.com`
- create a PTR (pointer record) and map it to `webapp1.azurewebsites.net`
- create an A record (Address) and map it to the IP address of WbApp1

---

### Answer:

- create a CNAME Canonical Name and map it to `https://wwww.company1.com`
- create an A record (Address) and map it to the IP address of WbApp1

The remaining options do not apply:

- create a Name Server NS record and map it to the IP address og the WebApp1
NS records are used to reference an IP address of a name server that is responsible for hosting the records related to your app. In this scenario, for example, you would query the name server to resolve the IP address of 
`www.company1.com`.
**Web Apps do not support NS record types**!

- create a PTR (pointer record) and map it to `webapp1.azurewebsites.net`
PTR records are used to resolve the IP address to a hostname: IP > HOSTNAME.
This is **the inverse procedure** with respect what you need to do in this 
case. Here you want to resolve a HOSTNAME such as `www.company1.com` to the
IP address that has been assigned to your Azure Web App.

---

### References:

[Map an existing custom DNS name to Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/app-service-web-tutorial-custom-domain?tabs=root%2Cazurecli)  

The DNS record type you need to add with your domain provider depends on the domain you want to add to App Service.

1. Root domain: contoso.com
You must use a **A record**. 
Don't use the CNAME record for the root record (for information, see RFC 1912 Section 2.4).

2. Wildcard	*.contoso.com
You must use a **CNAME record.**. 

> Prerequisites:
Your custom domains i.e. `contoso.com`must be in a public DNS zone; 
private DNS zones are not supported.

> Configure a custom domain:

1. Azure Portal > App Service > Custom Domain > Add CD

2. **TLS/SSL certificate**:
For TLS/SSL certificate, select App Service Managed Certificate if your app is in Basic tier or higher. 
If you want to remain in Shared tier, or if you want to use your own certificate, select Add certificate later.

3. TLS/SSL type, select the binding type you want:
> type IP SSL: 
Only one IP SSL binding may be added. This option allows only one TLS/SSL certificate to secure a dedicated public IP address. 

> type SNI (Server Name Indication) SSL: 
Multiple SNI SSL bindings may be added. This option allows multiple TLS/SSL certificates to secure multiple domains on the same IP address. Most modern browsers (including Internet Explorer, Chrome, Firefox, and Opera) support SNI

4. Domain:
specify a fully qualified domain name you want based on the domain you own. 
The Hostname record type box defaults to the recommended DNS record to use, depending on whether the domain is:
> a root domain (like contoso.com), > use a A record
> a subdomain (like www.contoso.com, or a wildcard domain *.contoso.com). > use a CNAME record

5. Don't select Validate yet.

6. For each custom domain in App Service, you need two DNS records with your domain provider. 

7. TXT Record:
[Prevent dangling DNS entries and avoid subdomain takeover](https://learn.microsoft.com/en-us/azure/security/fundamentals/subdomain-takeover)  

While it's not absolutely required to add the TXT record, 
**it's highly recommended for security**. 
The TXT record is a domain verification ID that helps avoid subdomain takeovers from other App Service apps. 
For custom domains you previously configured without this verification ID, you should protect them from the same risk by adding the verification ID (the TXT record) to your DNS configuration.

> Create the DNS records on your DNS Provider:
Select the type of record to create and follow the instructions. 
You can use either a CNAME record or an A record to map a custom DNS name to App Service as explained above. 
**When your function app is hosted in a Consumption plan, only the CNAME option is supported. This implies that with the Consumption Paln only root domain are supported.**

> Validate and complete:
Azure Portal > App Service > Custom Domain > Back in the Add custom domain dialog in the Azure portal, select Validate.

---

[AZ-104: Deploy and manage Azure compute resources  Configure Azure App Service / Create custom domain names](https://learn.microsoft.com/en-us/training/modules/configure-azure-app-services/8-create-custom-domain-names)

---

[Overview of DNS zones and records](https://learn.microsoft.com/en-us/azure/dns/dns-zones-records)  

---

## Q119:

You build a new Azure Web App for ASP.

<img src="./Q119-exhibit.png">

You must publish each Web App in an ASP that supports its runtime.

app1: Plan 1 only | Plan2 only | Plan1 & Plan2
app2: Plan 1 only | Plan2 only | Plan1 & Plan2
app3: Plan 1 only | Plan2 only | Plan1 & Plan2
app4: Plan 1 only | Plan2 only | Plan1 & Plan2

---

### Answer:

app1: Plan1 & Plan2
app2: Plan 1 only 
app3: Plan1 & Plan2
app4: Plan2* 

*Python runtime is not supported on Windows ASP. 
It was an offer in the past but the option of Python on Windows ahs been retired.

---

### References:

---

## Q118:


You deploy an Azure Web App named `wapp1` to the West US region.
The app streams videos to user located globally.
Users in North US can stram video content without interruption.
User in Europe, Africa and Asia complain of buffering problems and inconsistent playback quality.

you must recommend a solution to correct these problems.

What should you do?

- deploy Azure Application Gateway
- configure Azure File Sync
- scale out the ASP
- configure a Azure Content Delivery Network (CDN) with endpoints

---

### Answer:
- configure a Azure Content Delivery Network (CDN) with endpoints

---

### References:

[What is a content delivery network on Azure?](https://learn.microsoft.com/en-us/azure/cdn/cdn-overview)   

- is a distributed network of servers that can efficiently deliver web content to users. 
- store cached content on edge servers in **point of presence (POP)** locations that are close to end users, to minimize latency.
- offers developers a global solution for rapidly delivering high-bandwidth content to users
- **can also accelerate dynamic content**, which can't get cached, by using various network optimizations using content delivery network POPs

The remaing options do not apply in this case.

---

## Q117:

You plan to use a deployment template to deploy 5 instances of an Azure Web App
to the West US region.

You must ensure that you have met the minimal requirements for deployment.
You must minimize costs.

What should you do?

- deploy one App Service Plan (ASP)
- deploy Azure Application Gateway
- deploy five ASPs
- deploy AFD: Azure Front Door

---

### Answer:
- deploy one App Service Plan (ASP)

This is the option that minimizes costs and the APS should be on the Standard S1 tier to support 5 instances as the basic tier supports up to three with no autoscaling while Standard S1 up to 10 with autoscaling.

---

### References:

---

## Q116:

Your company has the following App Service Plans:

ASP1  | Windows | East US
ASP2  | Linux   | East US
ASP3  | Windows | West US
ASP4  | Linux   | West US

Yiu paln to deply the following apps:

Web14 | .Net Core 3.0 | East US
Web15 | asp.nET 4.8   | West US

You must identify which App Service plans can host these apps.

Web14 : OPTIONS
Web15 : OPTIONS

OPTIONS:

APS1 only
APS2 only
APS3 only
APS1 & ASP2 only
APS3 & ASP4 only
APS1 & ASP3 only
APS1 APS2 ASP3 APS4 

---

### Answer:

Web14 : ASP1 & ASP2

Web14 | .Net Core 3.0 | East US
East US: removes all West US APSs -> remaining: ASP1 & ASP2
.Net Core 3.0: can run on windows and linux -> ASP1 & ASP2

Web15 : APS3

Web15 | asp.net 4.8 | West US
West US: removes all East US APSs -> remaining: ASP3 & ASP4
asp.net 4.8: can run only on Windows -> APS3 


---

### References:

---

## Q115:


Am Azure web app named `wapp1` runs as 2 instances on a ASP Basic tier named `asp1`.
Users complain about performance during peak periods.
You determine that the instances do not have sufficient CPU during peak times.

You must ensure that the problemn is solved by providing the required CPU resources when required.

What should you di first?

- create a scale rule
- stop the app
- scale up the pricing tier
- enable aoutoscale


---

### Answer:
- scale up the pricing tier

The basic tier offfers: max 3 instances, no autoscale.
You must upgrade to Standard S1 in order to access a max of 10 instances and the autoscale feature.

This was discussed in detail in few of the previous questions.

---

### References:

---

## Q114:

You plan to deploy a new Azure web app and the deployment must support autoscaling to 20 instances of the web app.

You need to create a App Service plan that support this deployment.
You must minimize cost.

Which ASP tier should you choose?

- basic
- shared 
- standard
- premium

---

### Answer:
- premium
The reuirement to run up to 20 instances exceeds the maximum that can be obtain with the ASP Standard Tier that is 10 instances.
The ASP Premium tier can run up to 30 instances.

This was discussed in detail in a previous question.

The remaining options do not meet the requrements:

- basic: max 3 instances
- shared: no scaling out available

---

### References:


---

## Q113:

You develop an Azure web app named `app1`.
The app runs on a **Basic App Service Plan** named `asp1`.
You want to deploy two scripts to run **WebJobs** in the context of `app1`.

You must ensure that you can support the WebJobs on the `app1` instances.

Select yes/no:

- you must deploy the scripts as continuos WebJobs
- you must scale up the plan to the Satandard S1 tier
- you must create the WebJobs as linked to a web project

---

### Answer:

- you must deploy the scripts as continuos WebJobs
Yes

- you must scale up the plan to the Satandard S1 tier
No

- you must create the WebJobs as linked to a web project
Yes

---

### References:

[Run background tasks with WebJobs in Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/webjobs-create)  

It is a feature of Azure Web Apps and there's no extra cost to use WebJobs.
You can use the **Azure WebJobs SDK** with WebJobs to simplify many programming tasks.
**WebJobs aren't supported for App Service on Linux yet**. 

WebJobs is a feature of Azure App Service that enables you to run:
- a program or script in the same instance as a web app, API app, or mobile app. 

> supported script types:
`.cmd / .ps1 / .sh / .php /.py /. js / .jar`

> WEBJOBS_STOPPED / WEBJOBS_DISABLE_SCHEDULE:

You can also add an application setting named `WEBJOBS_STOPPED` with a value of 1 to stop all WebJobs running on your site. You can use this method to prevent conflicting WebJobs from running both in staging and production slots. You can similarly use a value of 1 for the `WEBJOBS_DISABLE_SCHEDULE` setting to disable triggered WebJobs in the site or a staging slot. 

For slots, remember to enable the Deployment slot setting option so that the setting itself doesn't get swapped.

> WebJob statuses:

- Initializing 
The app has just started and the WebJob is going through its initialization process.

- Starting 
The WebJob is starting up.

- Running 
The WebJob is running.

- PendingRestart 
A continuous WebJob exits in less than two minutes since it started for any reason, and App Service waits 60 seconds before restarting the WebJob. If the continuous WebJob exits after the two-minute mark, App Service doesn't wait the 60 seconds and restarts the WebJob immediately.

- Stopped 
The WebJob was stopped (usually from the Azure portal) and is currently not running and won't run until you start it again manually, even for a continuous or scheduled WebJob.

- Aborted 
This can occur for a number of reasons, such as when a long-running WebJob reaches the timeout marker.

---

[Develop and deploy WebJobs using Visual Studio](https://learn.microsoft.com/en-us/azure/app-service/webjobs-dotnet-deploy-vs)  

> deploy a console app project to a web app in Azure App Service as an Azure WebJob.

You can choose to develop a WebJob that runs as either:
- a .NET Core app 
- a .NET Framework app. 

---

[Azure WebJobs SDK](https://github.com/Azure/azure-webjobs-sdk/wiki)  

a framework that simplifies the task of writing background processing code that runs in Azure WebJobs.
It includes a declarative binding and trigger system that works with:

- Azure Storage Blobs
- Azure Storage Queues 
- Azure Storage Tables 
- Azure Service Bus

The binding system makes it incredibly easy to write code that reads or writes Azure Storage objects. 
he trigger system automatically invokes a function in your code whenever any new data is received in a queue or blob. 

> WebJob types: continuos vs. triggered

- Continuous:

> Continuous start:
**Starts immediately when the WebJob is created**. 
The program or script typically does its work inside an endless loop.
If the job does end, you can restart it.
Typically used with WebJobs SDK.

> Continuous Instances:
Runs on all instances that the web app runs on. 
You can optionally restrict the WebJob to a single instance.

> Continuos Remote Debugging:
supported

> Continuos deployment EP:
`\site\wwwroot\app_data\Jobs\Continuous`

- Triggered:

> Triggered start:
**Starts only when triggered manually or on a schedule**.

> Triggered Instance:
Runs on a single instance that Azure selects for load balancing.

> Triggered Remote Debugging:
not supported

> Triggered deployment EP:
` \site\wwwroot\app_data\Jobs\Triggered`

> Set Always on:
If you set the web app that hosts your job to run continuously, run on a schedule, or use event-driven triggers, enable the Always on setting on your web app's Azure Configuration page. The Always on setting helps to make sure that these kinds of WebJobs run reliably.

---

[Introducing Windows Azure WebJobs](https://www.hanselman.com/blog/introducing-windows-azure-webjobs)    
---

[Choose the right integration and automation services in Azure](https://learn.microsoft.com/en-us/azure/azure-functions/functions-compare-logic-apps-ms-flow-webjobs)    

All of these services can solve integration problems and automate business processes.

- Microsoft Power Automate (was Microsoft Flow)
- Azure Logic Apps
- Azure Functions
- Azure App Service WebJobs

---

## Q112:

Your company has a **Microsoft 365 business standard licence**.
You configure **SSPR**.
You want to configure a **hybrid environment** with your **on-prem AD DS**.
You **enable writeback to your on-prem network**.

You must make sure that prerequisites are met to support writeback.

Select yes/no :

- you should upgrade to Microsoft Entra ID P1
- you should install and configure Microsoft Entra Connect
- you should enable & configure MFA

---

### Answer:

The following are absolute requirements:

- you should upgrade to Microsoft Entra ID P1
Yes

- you should installl and configure Microsoft Entra Connect
Yes

The following is not a requirement for SSPR:
- you should enable & configure MFA

enabling MFA is recommended but not required and it is not a requirement to support writebacks to the on-prem AD DS.

---

### References:

[How does self-service password reset writeback work in Microsoft Entra ID?](https://learn.microsoft.com/en-us/entra/identity/authentication/concept-sspr-writeback)  

Microsoft Entra self-service password reset (SSPR) lets users reset their passwords in the cloud, but most companies also have an on-premises Active Directory Domain Services (AD DS) environment for users.

Password writeback allows password changes in the cloud to be written back to an on-premises directory in real time by using either:

- Microsoft Entra Connect 
- Microsoft Entra Connect cloud sync (RECOMMENDED)

This was described in detail in a previous question.

---

[Tutorial: Enable Microsoft Entra self-service password reset writeback to an on-premises environment](https://learn.microsoft.com/en-us/entra/identity/authentication/tutorial-enable-sspr-writeback)  

Password writeback can be used to synchronize password changes in Microsoft Entra back to your on-premises AD DS environment. 

> [Licensing requirements for Microsoft Entra self-service password reset](https://learn.microsoft.com/en-us/entra/identity/authentication/concept-sspr-licensing)

> for hybrid environments you need either:
- Microsoft Entra ID P1 or P2
- Microsoft 365 Business Premium

Other requirements:

- a MEID account with Hybrid Identity Administrator.
- Microsoft Entra ID configured for self-service password reset.
- existing on-premises AD DS environment configured with a current version of Microsoft Entra Connect.
- To use password writeback, domain controllers can run any supported version of Windows Server

- To correctly work with SSPR writeback, the account specified in Microsoft Entra Connect must have the appropriate permissions and options set.

the following permissions and options must be set on the account:

- Reset password
- Change password
- Write permissions on lockoutTime
- Write permissions on pwdLastSet
- Extended rights for "Unexpire Password" on the root object of each domain in that forest, if not already set.

---

[Microsoft Entra Connect: Enabling device writeback](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-device-writeback)  

---

## Q111:

You have an app hotsed in an Azure Service Plan (ASP) Premium V2.
You configure the scale out setting for the app as follows:

- R1: AVG(cpu%) >= 70%  for t > 10 mins -> increase by 2 & cool down 5 mins
- R2: AVG(cpu%) <=> 35% for t > 10 mins -> decrese  by 1 & cool down 5 mins

the initial instance count is set at 3.
the min instance count is set at 2.
the max instance count is set at 10.

The app goes throughthe following state:
- AVG(cpu%) = 80%  for 15 mins 
- after for 20 mins AVG(cpu%) = 30%

What would be the instance count after 35 mins?
2 | 3 | 4 | 5

---

### Answer: 4

The state: 
- AVG(copu%) = 80%  for 15 mins 

causes the rule R1 to kick in because it exceeds the 10 mims time span for it and the cool down buffer of 5 min. 
This causes the number of instances to be bumped up by 2 from the starting count of 3.

The resulting number of instance is now 5.

The state: 
- after for 20 mins AVG(copu%) = 30%

causes the rule R2 to kick in because it exceeds the 10 mims time span for it and the cool down buffer of 5 min. 
This causes the number of instances to be bumped down by 1 from the present count of 5.

The resulting number of instance is now 4.

---

### References:

[Get started with autoscale in Azure](https://learn.microsoft.com/en-us/azure/azure-monitor/autoscale/autoscale-get-started)  

---

## Q110:

You have to provide a website hosting env that meets the following 
scalability and security requirements:

- at peak load the web app should be able to scale to 10 instances
- the web app storage requirement are minimal and will not excede 5 GB
- the web app perform complex calculations and requires enhanced compute capability
- the VM where the web app is hosted should be dedicated to your company
- you must keep costs to a minimum

You need to propose **Azure App Services** as a host for this web app.

Which Azure App Service plan should you choose?

- shared
- isolated
- standard 
- premium V2


---

### Answer:
- premium V2

Azure App Service plan **premium V2 includes enhanced compute capabilities**.
It uses **Dv2 series VMs which have (compared to the Standard Tier)**: 

- a faster processor
- SSD storage
- **double** memory-to-core ratio

With the **Premium V2 the app can scale up to 30 instances**.

> Premium V3: another possible options

- faster CPU: min 195 ACU per vCPU
- SSD storage
- momory-optimized options
- **quadruple**  memory-to-core ratio compared to Standard Tier

The remaining options are not suitable as these cannot meet the reuirements:

- Stadard Tier:
This satisfies almost all requirements, in particular the following:

- at peak load the web app should be able to scale to 10 instances
- the web app storage requirement are minimal and will not excede 5 GB
- the VM where the web app is hosted should be dedicated to your company

However the following would not be satisfied by the Standard Tier:
- the web app perform complex calculations and requires enhanced compute capability

> The isolated Tier:
This is the most expensive options.

It would be possible to satify all the requirements except the cost requirement.
- you must keep costs to a minimum

In particular, with this plan the app may scale to up to 100 instances.

---

### References:

[Azure App Service plan overview](https://learn.microsoft.com/en-us/azure/app-service/overview-hosting-plans)  

---

## Q109:

you are Azure admin and want to use **Azure Container Apps** for your app.
You must configure the scaling rules.

You use a **custom Container App scaling rule** based on 
any `ScaledObject-based Kubernetes-based` **Event Driven Autoscaler (KEDA)**.

The deafult scale rule is applied to your container app.

You have created the following scale rule JSON:

```
...
"scale": {
          "minReplicas": 0,
          "maxReplicas": 32,
  "rules": [
    {
      "name": "azure-servicebus-queue-rule",
      "custom": {
        "type": "azure-servicebus",
        "metadata": {
          "queueName": "my-queue",
          "namespace": "service-bus-namespace",
          "messageCount": "15"
        }
      }
    }
  ]
}
...

```

Select yes/no:

- KEDA checks `my-queue` once every 30 seconds

- if the queue length > 15 KEDA scales the app by adding one new istance aka replica

- the code snippet uses the `TriggerAuthentication` type for the authentication object

---

### Answer:

- KEDA checks `my-queue` once every 30 seconds
Yes, KEDA checks scaling rules every 30 secs by default.

- if the queue length > 15 KEDA scales the app by adding one new istance aka replica
Yes, the KEDA scale-up step is by 1 by default.
The other options are: 1, 4, 8, 16, 32... up to the configured max replica count.

- the code snippet uses the `TriggerAuthentication` type for the authentication object
No. 
This snippet **does not use** the KEDA `TriggerAuthentication` for authentication of objets. 
This would be the case if you specified secrets referenced by the `autheticationRef` property.

1. Find the TriggerAuthentication object referenced by the KEDA ScaledObject specification.

2. From the KEDA specification, find each `secretTargetRef` of the TriggerAuthentication object and its associated secret.

```
spec:
  secretTargetRef:
  - parameter: connection
    name: my-secrets
    key: connection-string-secret
```

3. In the ARM template, add all entries to the auth array of the scale rule.

```
{
  ...
  "resources": {
    ...
    "properties": {
      ...
      "configuration": {
        ...
        "secrets": [
          {
            "name": "connection-string-secret",
            "value": "<SERVICE_BUS_CONNECTION_STRING>"
          }
        ]
      },
      ...
      ...
      "scale": {
          "minReplicas": 0,
          "maxReplicas": 5,
          "rules": [
            {
              "name": "azure-servicebus-queue-rule",
              "custom": {
                "type": "azure-servicebus",
                "metadata": {
                  "queueName": "my-queue",
                  "namespace": "service-bus-namespace",
                  "messageCount": "5"
                },
                "auth": [
                  {
                    "secretRef": "connection-string-secret",
                    "triggerParameter": "connection"
                  }
                ]
}
```

---

### References:

[Set scaling rules in Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/scale-app?pivots=azure-cli)  

> ARM:

> The http section defines an HTTP scale rule:
```
{
  ...
  "resources": {
    ...
    "properties": {
      ...
      "template": {
        ...
        "scale": {
          "minReplicas": 0,
          "maxReplicas": 5,
          "rules": [{
            "name": "http-rule",
            "http": {
              "metadata": {
                "concurrentRequests": "100"
              }
            }
          }]
        }
      }
    }
  }
}
```

> convert a KEDA scaler to a Container App scale rule:

This example shows how to convert an Azure Service Bus scaler to a Container Apps scale rule, but you use the same process for any other ScaledObject-based KEDA scaler specification.

For authentication, KEDA scaler authentication parameters convert into Container Apps secrets.

```
{
  ...
  "resources": {
    ...
    "properties": {
      ...
      "configuration": {
        ...
        "secrets": [
          {
            "name": "<NAME>",
            "value": "<VALUE>"
          }
        ]
      },
      "template": {
        ...
        "scale": {
          "minReplicas": 0,
          "maxReplicas": 5,
          "rules": [
            {
              "name": "<RULE_NAME>",
              "custom": {
                "metadata": {
                  ...
                },
                "auth": [
                  {
                    "secretRef": "<NAME>",
                    "triggerParameter": "<PARAMETER>"
                  }
                ]
              }
            }
          ]
        }
      }
    }
  }
}
```

1. From the KEDA scaler specification, find the type value.

```
triggers:
- type: azure-servicebus
  metadata:
    queueName: my-queue
    namespace: service-bus-namespace
    messageCount: "5"
```

2. In the ARM template, enter the scaler type value into the custom.type property of the scale rule.

3. In the ARM template, add all metadata values to the custom.metadata section of the scale rule.

```
...
"rules": [
  {
    "name": "azure-servicebus-queue-rule",
    "custom": {
      "type": "azure-servicebus",
      "metadata": {
        "queueName": "my-queue",
        "namespace": "service-bus-namespace",
        "messageCount": "5"
      }
    }
  }
]
...
```

> Authentication:

A KEDA scaler may support using secrets.
You can map the TriggerAuthentication object to the Container Apps scale rule.

- KEDA spec:

```
apiVersion: v1
kind: Secret
metadata:
  name: my-secrets
  namespace: my-project
type: Opaque
data:
  connection-string-secret: <SERVICE_BUS_CONNECTION_STRING>
---
apiVersion: keda.sh/v1alpha1
kind: TriggerAuthentication
metadata:
  name: azure-servicebus-auth
spec:
  secretTargetRef:
  - parameter: connection
    name: my-secrets
    key: connection-string-secret
```

- mapped ARM template for Azure Container Apps scaling rules:

```
{
  ...
  "resources": {
    ...
    "properties": {
      ...
      "configuration": {
        ...
        "secrets": [
          {
            "name": "connection-string-secret",
            "value": "<SERVICE_BUS_CONNECTION_STRING>"
          }
        ]
      },
      "template": {
        ...
        "scale": {
          "minReplicas": 0,
          "maxReplicas": 5,
          "rules": [
            {
              "name": "azure-servicebus-queue-rule",
              "custom": {
                "type": "azure-servicebus",
                "metadata": {
                  "queueName": "my-queue",
                  "namespace": "service-bus-namespace",
                  "messageCount": "5"
                },
                "auth": [
                  {
                    "secretRef": "connection-string-secret",
                    "triggerParameter": "connection"
                  }
                ]
              }
            }
          ]
        }
      }
    }
  }
}
```

---

[Set scaling rules in Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/scale-app?pivots=azure-resource-manager)  

Azure Container Apps manages automatic horizontal scaling through a set of declarative scaling rules. 

[Event-driven jobs](https://learn.microsoft.com/en-us/azure/container-apps/jobs?tabs=azure-cli#event-driven-jobs)  

Container apps and event-driven jobs use KEDA scalers.
They both evaluate scaling rules on a polling interval to measure the volume of events for an event source, but the way they use the results is different.

> Scaling in Azure Container Apps:
In an app, each replica continuously processes events and a scaling rule determines the number of replicas to run to meet demand.

> Scaling in Event Driven Jobs:

In event-driven jobs, each job typically processes a single event, and a scaling rule determines the number of jobs to run.

**Use jobs when each event requires a new instance of the container** with dedicated resources **or needs to run for a long time**. 
Event-driven jobs are conceptually similar to KEDA scaling jobs.

Event-driven jobs are triggered by events from supported custom scalers. 
Examples of event-driven jobs include:

- A job that runs when a new message is added to a queue such as Azure Service Bus, Kafka, or RabbitMQ.

- A self-hosted GitHub Actions runner or Azure DevOps agent that runs when a new job is queued in a workflow or pipeline.

---

[KEDA Scalers](https://keda.sh/docs/2.11/scalers/)  

[KEDA Scaling Deployments, StatefulSets & Custom Resources](https://keda.sh/docs/2.11/concepts/scaling-deployments/)  

[KEDA Authentication](https://keda.sh/docs/2.11/concepts/authentication/)    

---

## Q108:

You organization uses **Azure Container Registry** to store and manage container
images and relevant artifacts for various DevOps projects.

You are an Azure admin and must set up the appropriate authentication methods
to the Azure Container Registry.

You assign a Microsoft Entra Serive Principal to you ACR.

You must identify which ACR roles allow pull of a non-quarantined image from the 
ACR.

Which three roles fullfill this requirement?

- AcrImageSigner
- AcrDelete
- AcrPush
- AcrPull
- Owner

---

### Answer:

- AcrPull
- AcrPush
- Owner

> AcrPull:
- pull non-quarantined image 
- pull another supported artifact i.e. Helm chart
- it requires authentication with the ACR with the authorized identity

> AcrPush:
- push an image to the ACR
- push another supported artifact i.e. Helm chart
- it requires authentication with the ACR with the authorized identity

> Owner:
- assign roles to other users
- change policies
- delete image
- push & pull an image to the ACR
- push another supported artifact i.e. Helm chart
- it **CANNOT sign images** - this is **the only missing permission** for this you need the specific role **AcrImageSigner**.

---

### References:

[Authenticate with an Azure container registry](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-authentication?tabs=azure-cli)   

There are several ways to authenticate with an Azure container registry, 
each of which is applicable to one or more registry usage scenarios.

> Recommended ways:

- Authenticate to a registry directly via individual login:
Interactive push/pull by developers, testers. 
`az acr login` in Azure CLI | `Connect-AzContainerRegistry` in Azure PowerShell. 
AD token must be renewed every 3 hours.

- Applications and container orchestrators can perform unattended, or "headless," authentication by using a Microsoft Entra service principal:
Unattended push from CI/CD pipeline
Unattended pull to Azure or external services 
SP password default expiry is 1 year 
```
docker login
az acr login in Azure CLI
```
`Connect-AzContainerRegistry`  in Azure PowerShell

> There are also other authetication options:
- use Azure managed identities: 

this is practically the same as the option above where MEID SP is used.
The difference is that with a managed identoty only a machine-to-machine
scenario is covered in which a resource in Azure **and not outside of Azure**
can authenticate.

Managed Identtities can be assigned **only to Azure Resources**.
If the authenticating resource lives outside of Azure then the **MEID SP must be used instead**.

- there are then some specific methods for AKS.

---

[Azure Container Registry authentication with service principals](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-auth-service-principal)  

For example, configure your web application to use a service principal that provides it with image pull access only, while your build system uses a service principal that provides it with both push and pull access. If development of your application changes hands, you can rotate its service principal credentials without affecting the build system.

> When to use a service principal:

**You should use a service principal to provide registry access in headless scenarios** i.e. DevOps, scripts, etc. 

---

[Azure Container Registry roles and permissions](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-roles?tabs=azure-powershell)  

- Owner
- Contributor
- Reader
- AcrhPush
- AcrPull
- AcrDelete
- AcrImageSigner

---

[Scenarios to authenticate with Azure Container Registry from Kubernetes](https://learn.microsoft.com/en-us/azure/container-registry/authenticate-kubernetes-options)  


---

## Q107:

You have an Azure sub with VMs and storage.

The Dev team wants to start using **Azure Containers Apps** to allow them to 
run Microservices and containerized apps without deploying serverless VMs.

You decide to set up the Azure Container App environment with **bash**.
You **install the container app extension** for the Azure CLI and register the
`Microsoft.App` namespace.

You try to create a **Azure Monitor Log Analytics** workspace but you receive 
an error message that indicates taht the command is not recognized.

You need to uise the **az provider resgister** command to register the 
**Azure Monitor Log Analytics** workspace.

Which provider name do you need to register?

- Microsoft.PolicyInsights
- Microsoft.Automation
- Microsoft.NotificationHubs
- Microsoft.OperationalInsights

---

### Answer:
- Microsoft.OperationalInsights
this is namespace for **Azure Monitor Log Analytics** workspace.

The remining options:

- Microsoft.NotificationHubs
this is namespace for **Azure Event Hubs** workspace.

- Microsoft.Automation
this is namespace for **Azure Automation** workspace.

- Microsoft.PolicyInsights:
this is namespace for **Azure Policy** workspace.

---

### References:

[Azure Container Apps overview](https://learn.microsoft.com/en-us/azure/container-apps/overview)  

Azure Container Apps is a serverless platform that allows you to maintain less infrastructure and save costs while running containerized applications.

 Instead of worrying about server configuration, container orchestration, and deployment details, Container Apps provides all the up-to-date server resources required to keep your applications stable and secure.

> Common uses of Azure Container Apps include:

- Deploying API endpoints
- Hosting background processing jobs
- Handling event-driven processing
- Running microservices

> applications built on Azure Container Apps can dynamically scale based on the following characteristics:

- HTTP traffic
- Event-driven processing
- CPU or memory load
- Any KEDA-supported scaler

---

[How to Build and Deliver Apps Fast and Scalable with Azure Container Apps - Microsoft Mechanics](https://youtu.be/b3dopSTnSRg)  

---

[Quickstart: Deploy your first container app with containerapp up](https://learn.microsoft.com/en-us/azure/container-apps/get-started?tabs=bash)  

> Azure CLI Bash:

```
az login

# upgrade the azure cli to the latest
az upgrade

# install or update the Azure Container Apps extension for the CLI.
az extension add --name containerapp --upgrade

# Register the Microsoft.App and Microsoft.OperationalInsights namespaces 
# if you haven't already registered them in your Azure subscription.

az provider register --namespace Microsoft.App
az provider register --namespace Microsoft.OperationalInsights

az group create --location centralus --resource-group my-container-apps

# Create and deploy the container app

az containerapp up \
  --name my-container-app \
  --resource-group my-container-apps \
  --location centralus \
  --environment 'my-container-apps' \
  --image mcr.microsoft.com/k8se/quickstart:latest \
  --target-port 80 \
  --ingress external \
  --query properties.configuration.ingress.fqdn

# clean up
az group delete --name my-container-apps
```

---

[Tutorial: Build and deploy your app to Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/tutorial-code-to-cloud?source=recommendations&tabs=bash%2Ccsharp&pivots=acr-remote)    


---

## Q106:

You have a **hybrid network** configuration.
Most user accounts are in Microsof Entra ID and the on-prem domain.
Some users accounts are Microsof Entra only.
You plan to deploy SSPR.

You must ensure that SSPR meets the company's password requirements:

Select yes/no:

- SSPR is supported for all user including cloud-only users

- you can configure SSPR registration for all domain users, by group, or by individual user

- supported authentication methods include mobile phone text messages and voice call


---

### Answer:

- SSPR is supported for all user including cloud-only users
Yes

- you can configure SSPR registration for all domain users, by group, or by individual user
No: it is not possible to set SSPR for individual users, only all domain users or individual security groups can be set up with SSPR.

- supported authentication methods include mobile phone text messages and voice call
Yes.

---

### References:

SSPR was deiscussed in detail in one of the previous questions.

---

## Q105:

You are an Azure admin. 
You are tasked with enabling encryption on a running linux VM.
You have implemented the PS script below. 

```
$kvrg = "rg1"
$kvn = "kv1"

$vmrg = "rg2"
$vmn = "vm1"

$kv = Get-AzKeyVault -VaultName $kvn -ResourceGroupName $kvrg

$diskEncryptionKeyVaultUrl = $kv.VaultUri;
$kvResourceId = $kv.ResourceId;

$sequenceVersion = [Guid]::NewGuid()

Set-AzVMDiskEncryptionExtension -ResourceGroupName $vmrg -VMNname $vmName `
-DiskEncryptionKeyVaulId $kvResourceId `
-DiskEncryptionKeyVaulUrl $diskEncryptionKeyVaultUrl `
-VolumeType '[Data]' `
-SequenceVersion $sequenceVersion `
-skipVmBackup

```

Select yes/no:

- Set-AzVMDiskEncryptionExtension requires the VM to be stopped before initiating encryption to prevent data loss
No.
However, the documentation also says the following:

**When encrypting Linux OS volumes, the VM should be considered unavailable**. 

**In all cases, you should take a snapshot and/or create a backup before disks are encrypted**. 
Backups ensure that a recovery option is possible if an unexpected failure occurs during encryption. 

**VMs with managed disks require a backup before encryption occurs**. 

- only the data volumens of the VM are encrypted:
Yes in the case of the script above.
This depends on the options: `-VolumeType '[All|OS|Data]'`
of the cmdlt: `Set-AzVMDiskEncryptionExtension`

- SequenceVersion is unique per each encryption operation performed on the VM
Yes.
The `-SequenceVersion` of the cmdlet `Set-AzVMDiskEncryptionExtension`
specifies the sequence number of the encryption operation for the VM.
It must be a GUID per each VM.

```
$sequenceVersion = [Guid]::NewGuid()
Set-AzVMDiskEncryptionExtension -ResourceGroupName $vmrg -VMNname $vmName `
... ...
-SequenceVersion $sequenceVersion `
-skipVmBackup
```

---

### Answer:


[Azure Disk Encryption for Linux VMs](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/disk-encryption-overview)   

It uses the DM-Crypt feature of Linux to provide volume encryption for the OS and data disks of Azure virtual machines (VMs), and is integrated with Azure Key Vault to help you control and manage the disk encryption keys and secrets.

>  Microsoft Defender for Cloud: 
**Azure Disk Encryption is zone resilient, the same way as Virtual Machines**.
**If you use Microsoft Defender for Cloud, you're alerted if you have VMs that aren't encrypted**.
The alerts show as **High Severity** and the recommendation is to encrypt these VMs.

> Supported operating systems:

Azure Disk Encryption is supported on a subset of the Azure-endorsed Linux distributions, which is itself a subset of all Linux server possible distributions.

[Endorsed Linux distributions on Azure](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/endorsed-distros)   

> Additional VM requirements:

Azure Disk Encryption requires the **dm-crypt and vfat modules** to be 
present on the system.
Before enabling encryption, the data disks to be encrypted must be properly listed in **/etc/fstab**. 

> Networking requirements:

1. NR1
To get a token to connect to your key vault, the Linux VM must be able to connect to a Microsoft Entra endpoint, [login.microsoftonline.com].

2. NR2
To write the encryption keys to your key vault, the Linux VM must be able to connect to the key vault endpoint.

3. NR3
The Linux VM must be able to connect to an Azure storage endpoint that hosts the Azure extension repository and an Azure storage account that hosts the VHD files.

4. NR14
If your security policy limits access from Azure VMs to the Internet, you can resolve the preceding URI and configure a specific rule to allow outbound connectivity to the IPs. For more information, see Azure Key Vault behind a firewall.

---

[Quickstart: Create and encrypt a Linux VM in Azure with Azure PowerShell](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/disk-encryption-powershell-quickstart)  

```
$KeyVault = Get-AzKeyVault `
-VaultName "<your-unique-keyvault-name>" `
-ResourceGroupName "MyResourceGroup"

Set-AzVMDiskEncryptionExtension -ResourceGroupName MyResourceGroup `
-VMName "MyVM" `
-DiskEncryptionKeyVaultUrl $KeyVault.VaultUri `
-DiskEncryptionKeyVaultId $KeyVault.ResourceId `
-SkipVmBackup `
-VolumeType All

Get-AzVmDiskEncryptionStatus -VMName MyVM -ResourceGroupName MyResourceGroup

```

[Quickstart: Create and encrypt a Linux VM with the Azure CLI](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/disk-encryption-cli-quickstart)  


---

[Azure Disk Encryption scenarios on Linux VMs](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/disk-encryption-linux?tabs=azcliazure%2Cenableadeps%2Cefacli%2Cadedatacli)    

**In all cases, you should take a snapshot and/or create a backup before disks are encrypted**. Backups ensure that a recovery option is possible if an unexpected failure occurs during encryption. 

**VMs with managed disks require a backup before encryption occurs**. 

> Important:

**When encrypting Linux OS volumes, the VM should be considered unavailable**. 
 We strongly recommend to avoid SSH logins while the encryption is in progress to avoid issues blocking any open files that will need to be accessed during the encryption process. 

> Azure Disk Encryption does not work for the following Linux scenarios:

- Encrypting the OS drive for Linux Virtual Machine Scale Sets.
- Encrypting custom images on Linux VMs.
- Disabling encryption on an OS drive or data drive of a Linux VM when the OS drive is encrypted.
- Azure Files (shared file system).
- Network File System (NFS).
- Dynamic volumes.
- Ephemeral OS disks.
- **Moving an encrypted VM to another subscription or region.**
- **Creating an image or snapshot of an encrypted VM and using it to deploy additional VMs**
- etc.


> Enable encryption on an existing or running Linux VM:

In this scenario, you can enable encryption by using:

- the Resource Manager template
- PowerShell cmdlets
- CLI commands.

```
$KVRGname = 'MyKeyVaultResourceGroup';
 $VMRGName = 'MyVirtualMachineResourceGroup';
 $vmName = 'MySecureVM';
 $KeyVaultName = 'MySecureVault';
 $KeyVault = Get-AzKeyVault -VaultName $KeyVaultName -ResourceGroupName $KVRGname;
 $diskEncryptionKeyVaultUrl = $KeyVault.VaultUri;
 $KeyVaultResourceId = $KeyVault.ResourceId;
 $sequenceVersion = [Guid]::NewGuid();

Set-AzVMDiskEncryptionExtension -ResourceGroupName $VMRGName -VMName $vmName -DiskEncryptionKeyVaultUrl $diskEncryptionKeyVaultUrl -DiskEncryptionKeyVaultId $KeyVaultResourceId -VolumeType '[All|OS|Data]' -SequenceVersion $sequenceVersion -skipVmBackup;
```

Modify the -VolumeType parameter to specify which disks you're encrypting:
`-VolumeType '[All|OS|Data]'`

> Encrypt a running VM using KEK (Key Encryption Key):
```
$KVRGname = 'MyKeyVaultResourceGroup';
 $VMRGName = 'MyVirtualMachineResourceGroup';
 $vmName = 'MyExtraSecureVM';
 $KeyVaultName = 'MySecureVault';
 
 $keyEncryptionKeyName = 'MyKeyEncryptionKey';

 $KeyVault = Get-AzKeyVault -VaultName $KeyVaultName -ResourceGroupName $KVRGname;
 $diskEncryptionKeyVaultUrl = $KeyVault.VaultUri;
 $KeyVaultResourceId = $KeyVault.ResourceId;
 
 $keyEncryptionKeyUrl = (Get-AzKeyVaultKey -VaultName $KeyVaultName -Name $keyEncryptionKeyName).Key.kid;
 
 $sequenceVersion = [Guid]::NewGuid();

Set-AzVMDiskEncryptionExtension -ResourceGroupName $VMRGName -VMName $vmName -DiskEncryptionKeyVaultUrl $diskEncryptionKeyVaultUrl -DiskEncryptionKeyVaultId $KeyVaultResourceId -KeyEncryptionKeyUrl $keyEncryptionKeyUrl -KeyEncryptionKeyVaultId $KeyVaultResourceId -VolumeType '[All|OS|Data]' -SequenceVersion $sequenceVersion -skipVmBackup;
```

---

[Set-AzVMDiskEncryptionExtension](https://learn.microsoft.com/en-us/powershell/module/az.compute/set-azvmdiskencryptionextension?view=azps-11.4.0&viewFallbackFrom=azps-10.1.0)  

The Set-AzVMDiskEncryptionExtension cmdlet enables encryption on a running infrastructure as a service (IaaS) virtual machine in Azure. It enables encryption by installing the disk encryption extension on the virtual machine.

**This cmdlet requires confirmation from the users as one of the steps to enable encryption requires a restart of the virtual machine.**

>Windows: 
The VolumeType parameter may be omitted, in which case the operation defaults to All; if the VolumeType parameter is present for a Windows virtual machine, it must be set to either All or OS.

> Example 2: Enable encryption with pipelined input:

```
$params = New-Object PSObject -Property @{
    ResourceGroupName = "[resource-group-name]"
    VMName = "[vm-name]"
    DiskEncryptionKeyVaultId = "/subscriptions/[subscription-id-guid]/resourceGroups/[resource-group-name]/providers/Microsoft.KeyVault/vaults/[keyvault-name]"
    DiskEncryptionKeyVaultUrl = "https://[keyvault-name].vault.azure.net"
    KeyEncryptionKeyVaultId = "/subscriptions/[subscription-id-guid]/resourceGroups/[resource-group-name]/providers/Microsoft.KeyVault/vaults/[keyvault-name]"
    KeyEncryptionKeyUrl = "https://[keyvault-name].vault.azure.net/keys/[kekname]/[kek-unique-id]"
    VolumeType = "All"
}

$params | Set-AzVMDiskEncryptionExtension
```

> Example 3: Enable encryption using Microsoft Entra Client ID and Client Secret:

This is virtually the same as themethods above but it uses secrets for an 
app created in Microsoft Entra ID:

[Azure Disk Encryption with Microsoft Entra ID for Windows VMs (previous release)](https://learn.microsoft.com/en-us/azure/virtual-machines/windows/disk-encryption-windows-aad)  

This is the **old method**.

The new release of Azure Disk Encryption eliminates the requirement for providing a Microsoft Entra application parameter to enable VM disk encryption.
With the new release, you are no longer required to provide Microsoft Entra credentials during the enable encryption step.
All new VMs must be encrypted without the Microsoft Entra application parameters using the new release. 

```
$RGName = "MyResourceGroup"
$VMName = "MyTestVM"

$AADClientID = "<clientID of your Azure AD app>"
$AADClientSecret = "<clientSecret of your Azure AD app>"

$VaultName= "MyKeyVault"
$KeyVault = Get-AzKeyVault -VaultName $VaultName -ResourceGroupName $RGName
$DiskEncryptionKeyVaultUrl = $KeyVault.VaultUri
$KeyVaultResourceId = $KeyVault.ResourceId
$VolumeType = "All"

# the 
Set-AzVMDiskEncryptionExtension -ResourceGroupName $RGName -VMName $VMName ` -AadClientID $AADClientID `
-AadClientSecret $AADClientSecret `
-DiskEncryptionKeyVaultUrl $DiskEncryptionKeyVaultUrl `
-DiskEncryptionKeyVaultId $KeyVaultResourceId `
-VolumeType $VolumeType

```

---

### References:

---

## Q104:

Your company hosts resources on-premise as well on Azure infrastructure (IaaS).
This includes VMs used by the HR department.
HR has recently requested for a new application to be installed on a server
named `hrvm1` with the following details:

RG: ukrg1
Location: UK South
Storage Type: Premium ZRS
disk name: `hrdisk5`

The app requires a new 1TB data disk to be install.
You need to complete the script.

```
$rgn = 'ukrg1'
$vmn = `hrvm1`
$loc = 'UK South'
$stype: 'Premium_ZRS'
$datadiskn= `hrdisk5`

$diskconfig = OPTIONS-1 -SkuName $stype -Location $loc -CreateOption Empty `
-DiskSizeGB 1024

$datadisk = OPTIONS-2 -DiskName $datadiskn -Disk $diskconfig -ResourceGroupName $rgn

$vm = OPTIONS-3 -Name $vmn -ResourceGroupName $rgn
$vm = OPTIONS-4 -VM $vm -Name $datadiskn -CreateOption Attach `
-ManageDiskId $datadisk.Id -Lun 4

OPTIONS-5 -VM $vm -ResourceGroupName $rgn
```

OPTIONS-1 & -2:
New-AzDiskConfig
New-AzVMDataDisk
New-AzDataDisk
Update-AzVM

OPTIONS-3:
New-AzDisk
New-AzVM
Get-AzVM
Update-AzVM

OPTIONS-4:
Get-AzVM
Add-AzVMDataDisk
New-AzDataDisk
New-AzDiskConfig

OPTIONS-5:
Set-AzVM
Set-AzVMDataDisk
Update-AzVM
Update-AzDisk

---

### Answer:

```
$rgn = 'ukrg1'
$vmn = `hrvm01`
$loc = 'UK South'
$stype: 'Premium ZRS'
$datadiskn= `hrdisk5`

$diskconfig = New-AzDiskConfig -SkuName $stype -Location $loc -CreateOption Empty `
-DiskSizeGB 1024

$datadisk = New-AzDataDisk -DiskName $datadiskn -Disk $diskconfig -ResourceGroupName $rgn

$vm = Get-AzVM -Name $vmn -ResourceGroupName $rgn
$vm = Add-AzVMDataDisk -VM $vm -Name $datadiskn -CreateOption Attach `
-ManageDiskId $datadisk.Id -Lun 4

Update-AzVM -VM $vm -ResourceGroupName $rgn
```

1. create a new disk config for the data disk that you want to add to an existing VM

2. create a new data disk based on that config

3. get the VM you want to add the data disk to

4. add the data disk to the VM or in general any changes to the VM

5. update the VM so that the changes are enforced on it (finilize)

---

### References:

[Attach a data disk to a Windows VM with PowerShell](https://learn.microsoft.com/en-us/azure/virtual-machines/windows/attach-disk-ps)    

---

## Q103:

You have a VM in Azure named vm1 with Ubuntu OS.

You must enable disk encryption on vm1 and store the encryption key on a new KV named kv1.
All resources must be privioned in a RG named rg1.

Complete the script.

```
OPTIONS --name 'kv1' --resource-group 'rg1' --location 'eastus' \
OPTIONS 

OPTIONS \
--resource-group 'rg1' --name 'vm1'

OPTIONS: 'kv1'

```

OPTIONS: 
az vm encryption enable
az vm update
az keyvault create
--enable-for-disk-encryption
--disk-encryption-keyvault
--os-disk-encryption-set

---

### Answer:

```
az keyvault create --name 'kv1' --resource-group 'rg1' --location 'eastus' \
--enable-for-disk-encryption 

az vm encryption enable --resource-group 'rg1' --name 'vm1' \
--disk-encryption-keyvault 'kv1'

```

The remainin options do not apply:

`--os-disk-encryption-set`: set a new VM to use a customer-managed encryption key.

---

### References:

[Quickstart: Create and encrypt a Linux VM with the Azure CLI](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/disk-encryption-cli-quickstart)  

`az vm encryption enable -g "MyResourceGroup" --name "myVM" --disk-encryption-keyvault "<your-unique-keyvault-name>"`

> Encrypt and Decrypt OS &/or Data Disks:
[az vm encryption](https://learn.microsoft.com/en-us/cli/azure/vm/encryption?view=azure-cli-latest) 

---

## Q102:

The managed VM named VM1 has the attached disk DataD2.
You must move DataD2 to a VM named VM2 with PS.
keep the time that data on DataD2 is unavailable to a minimum.

Select yes/no:

- you must stop VM1 before you can detach DataD2
- you can access data ion DataD2 while the disk is unattached
- you must run the `Update-AzVM` on both VM1 and VM2 after moving DataD2
---

### Answer:

- you must stop VM1 before you can detach DataD2
No

- you can access data on DataD2 while the disk is unattached
No

- you must run the `Update-AzVM` on both VM1 and VM2 after moving DataD2
Yes

you are not required to stop VM1 before detaching DataD2.
it is sufficient that nothing is actively using the dada disk while it is being detached.
the  data disk cannot be accessed while it is detached, it must be reattached to a VM
in order to access it again.

`Update-AzVM` must be run on VM1 and on VM2 to aupdate their state after detaching and attaching the disk.

`Get-AzDisk` | `New-AzDisk`
`Add-AzVMDataDisk` 
`Update-AzVM`

```
$diskConfig = New-AzDiskConfig -SkuName $storageType -Location $location -CreateOption Empty -DiskSizeGB 128
$dataDisk1 = New-AzDisk -DiskName $dataDiskName -Disk $diskConfig -ResourceGroupName $rgName

```

---

### References:

[How to detach a data disk from a Windows virtual machine](https://learn.microsoft.com/en-us/azure/virtual-machines/windows/detach-disk)  

When you no longer need a data disk that's attached to a virtual machine, you can easily detach it. 

The disk stays in storage but is no longer attached to a virtual machine.

This removes the disk from the virtual machine, but doesn't remove it from storage.
If you want to use the existing data on the disk again, you can reattach it to the same virtual machine, or another one.

> Detach a data disk using PowerShell:

**You can hot remove a data disk** using PowerShell, but make sure nothing is actively using the disk before detaching it from the VM.

```
$VirtualMachine = Get-AzVM -ResourceGroupName "myResourceGroup" -Name "myVM"

Remove-AzVMDataDisk -VM $VirtualMachine -Name "myDisk"

Update-AzVM -ResourceGroupName "myResourceGroup" -VM $VirtualMachine
```

---

[Attach a data disk to a Windows VM with PowerShell](https://learn.microsoft.com/en-us/azure/virtual-machines/windows/attach-disk-ps)   

First, review these tips:

- The size of the virtual machine controls how many data disks you can attach. 
- To use premium SSDs, you'll need a premium storage-enabled VM type, like the DS-series or GS-series virtual machine.

> Add an empty data disk to a virtual machine:

```
$rgName = 'myResourceGroup'
$vmName = 'myVM'
$location = 'East US'
$storageType = 'Premium_LRS'
$dataDiskName = $vmName + '_datadisk1'

$diskConfig = New-AzDiskConfig -SkuName $storageType -Location $location -CreateOption Empty -DiskSizeGB 128
$dataDisk1 = New-AzDisk -DiskName $dataDiskName -Disk $diskConfig -ResourceGroupName $rgName

$vm = Get-AzVM -Name $vmName -ResourceGroupName $rgName
$vm = Add-AzVMDataDisk -VM $vm -Name $dataDiskName -CreateOption Attach -ManagedDiskId $dataDisk1.Id -Lun 1

Update-AzVM -VM $vm -ResourceGroupName $rgName
```

> Initialize the disk:

After you add an empty disk, you'll need to initialize it. 

you  you can use remote PowerShell to initialize the disk if:
 
- enabled `WinRM` 
- and a certificate on the VM when you created it

```
$location = "location-name"
$scriptName = "script-name"
$fileName = "script-file-name"

Set-AzVMCustomScriptExtension -ResourceGroupName $rgName `
-Location $locName `
-VMName $vmName `
-Name $scriptName `
-TypeHandlerVersion "1.4" `
-StorageAccountName "mystore1" `
-StorageAccountKey "primary-key" `
-FileName $fileName -ContainerName "scripts"
```

The script file can contain code to initialize the disks, for example:

```
$disks = Get-Disk | Where partitionstyle -eq 'raw' | sort number

$letters = 70..89 | ForEach-Object { [char]$_ }
    $count = 0
    $labels = "data1","data2"

foreach ($disk in $disks) {
        $driveLetter = $letters[$count].ToString()
        $disk |
        Initialize-Disk -PartitionStyle MBR -PassThru |
        New-Partition -UseMaximumSize -DriveLetter $driveLetter |
        Format-Volume -FileSystem NTFS -NewFileSystemLabel $labels[$count] -Confirm:$false -Force
	$count++
    }
```

> Attach an existing data disk to a VM:

```
$rgName = "myResourceGroup"
$vmName = "myVM"
$dataDiskName = "myDisk"
$disk = Get-AzDisk -ResourceGroupName $rgName -DiskName $dataDiskName

$vm = Get-AzVM -Name $vmName -ResourceGroupName $rgName

$vm = Add-AzVMDataDisk -CreateOption Attach -Lun 0 -VM $vm -ManagedDiskId $disk.Id

Update-AzVM -VM $vm -ResourceGroupName $rgName
```
---

## Q101:

you have an Azure VM named VM1 deployed via a ARM template to RG1.
You must move VM1 to RG2.

which cmdlet should you use?

- Move-AzResource
- Remove-AzVM
- Stop-AzVM
- Update-AzVM

---

### Answer:
- Move-AzResource

This is described in the reference below and can also be accomplished manually from 
the Azure Portal from the Overview blade of the resource. [ChaNge RG]

---

### References:

[Move Azure resources to a new resource group or subscription](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/move-resource-group-and-subscription)  

Both the source group and the target group are locked during the move operation.
The lock can last for a maximum of four hours, but most moves complete in much less time.

It doesn't mean the resources are frozen. For example, if you move an Azure SQL logical server, its databases and other dependent resources to a new resource group or subscription, applications that use the databases experience no downtime.

They can still read and write to the databases. 

```
$sourceName = "sourceRG"
$destinationName = "destinationRG"
$resourcesToMove = @("app1", "app2")

$resources = Get-AzResource -ResourceGroupName $sourceName | Where-Object { $_.Name -in $resourcesToMove }

Move-AzResource -DestinationResourceGroupName $destinationName -ResourceId $resources.ResourceId
```

[Move-AzResource](https://learn.microsoft.com/en-us/powershell/module/az.resources/move-azresource?view=azps-11.4.0)   
moves existing resources to a different resource group. 

---

## Q100:

You develop a VMSS to support a critical app.
The upgrade policy for the VMSS is set to Rolling.

You need to apply a change to the OS of the VMSS and Data Disk Profile images.

Which cmdlet should you use?

- Update-AzVmmssInstance
- Update-AzVmmss
- Set-AzVmssVM
- Start-AzVmssRollingOSUpgrade

---

### Answer:
- Set-AzVmssVM

---

### References:

[Modify a Virtual Machine Scale Set](https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/virtual-machine-scale-sets-upgrade-scale-set)   

Many of the steps listed in this document apply to Virtual Machine Scale Sets using **Uniform Orchestration mode**. 
We recommend using **Flexible Orchestration** for new workloads. 

Throughout the lifecycle of your applications, you may need to modify or update your Virtual Machine Scale Set.

> The scale set model:
captures the desired state of the scale set as a whole. 

`Get-AzVmss -ResourceGroupName "myResourceGroup" -VMScaleSetName "myScaleSet"`
`az vmss show --resource-group myResourceGroup --name myScaleSet`

The exact presentation of the output depends on the options you provide to the command. 

```
az vmss show --resource-group myResourceGroup --name myScaleSet
{
  "location": "westus",
  "overprovision": true,
  "plan": null,
  "singlePlacementGroup": true,
  "sku": {
    "additionalProperties": {},
    "capacity": 1,
    "name": "Standard_D2_v2",
    "tier": "Standard"
  },
}
```

> The scale set instance view:

captures the current runtime state of the scale set as a whole. 

`Get-AzVmss -ResourceGroupName "myResourceGroup" -VMScaleSetName "myScaleSet" -InstanceView`

`az vmss get-instance-view --resource-group myResourceGroup --name myScaleSet`

The exact presentation of the output depends on the options you provide to the command. 

> The scale set VM model view
each VM instance in the scale set has its own model view. 
query the model view for a particular VM instance in a scale set

`Get-AzVmssVm -ResourceGroupName "myResourceGroup" -VMScaleSetName "myScaleSet" -InstanceId instanceId`
`az vmss show --resource-group myResourceGroup --name myScaleSet --instance-id instanceId`

> The scale set VM instance view
each VM instance in the scale set has its own instance view

`Get-AzVmssVm -ResourceGroupName "myResourceGroup" -VMScaleSetName "myScaleSet" -InstanceId instanceId -InstanceView`

`az vmss get-instance-view --resource-group myResourceGroup --name myScaleSet --instance-id instanceId`

[How to update global scale set properties](https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/virtual-machine-scale-sets-upgrade-scale-set#how-to-update-global-scale-set-properties)  

**update a global scale set property, you must update the property in the scale set model.** 

`Update-AzVmss -ResourceGroupName "myResourceGroup" -VMScaleSetName "myScaleSet" -VirtualMachineScaleSet {scaleSetConfigPowershellObject}`

```
# To modify a property:
az vmss update --set {propertyPath}={value}

# To add an object to a list property in a scale set:
az vmss update --add {propertyPath} {JSONObjectToAdd}

# To remove an object from a list property in a scale set:
az vmss update --remove {propertyPath} {indexToRemove}
```

If you previously deployed the scale set with the az vmss create command, 
you can run the az vmss create command again to update the scale set.
Make sure that all properties in the az vmss create command are the same as before, except for the properties that you wish to modify.

Once the scale set model is updated, the new configuration applies to any new VMs created in the scale set. 
However, the models for the existing VMs in the scale set must still be brought up-to-date with the latest overall scale set model. 
In the model for each VM is a boolean property called `latestModelApplied` that indicates whether or not the VM is up-to-date with the latest overall scale set model (true means the VM is up-to-date with the latest model).

> Scenarios:

- OS Updates:
If you use Azure platform images, you can update the image by modifying the 
`imageReference`.

With platform images, it is common to specify "latest" for the image reference version. When you create, scale out, and reimage, VMs are created with the latest available version. However, it does not mean that the OS image is automatically updated over time as new image versions are released. 

> Update the OS image for your scale set:

`Update-AzVmss -ResourceGroupName "myResourceGroup" -VMScaleSetName "myScaleSet" -ImageReferenceVersion 16.04.201801090`

`az vmss update --resource-group myResourceGroup --name myScaleSet --set virtualMachineProfile.storageProfile.imageReference.version=16.04.201801090`

> update or change a custom image used by your scale set:

```
Update-AzVmss -ResourceGroupName "myResourceGroup" -VMScaleSetName "myScaleSet" -ImageReferenceId /subscriptions/{subscriptionID}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/images/myNewImage
```

- Application updates:

If an application is deployed to a scale set through extensions,
an update to the extension configuration causes the application to 
update in accordance with the upgrade policy.

For instance, if you have a new version of a script to run in a Custom Script Extension, you could update the fileUris property to point to the new script. 

It's also common for applications to be deployed through a custom image. 
This scenario is covered in the following section.

- Update the load balancer for your scale set

Let's say you have a scale set with an Azure Load Balancer, and you want 
to replace the Azure Load Balancer with an Azure Application Gateway. 

The load balancer and Application Gateway properties for a scale set are part of a list, so you can use the commands to remove or add list elements instead of modifying the properties directly:

```
# Get the current model of the scale set and store it in a local PowerShell object named $vmss
$vmss=Get-AzVmss -ResourceGroupName "myResourceGroup" -Name "myScaleSet"

# Create a local PowerShell object for the new desired IP configuration, which includes the reference to the application gateway
$ipconf = New-AzVmssIPConfig -ApplicationGatewayBackendAddressPoolsId /subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Network/applicationGateways/{applicationGatewayName}/backendAddressPools/{applicationGatewayBackendAddressPoolName} -SubnetId $vmss.VirtualMachineProfile.NetworkProfile.NetworkInterfaceConfigurations[0].IpConfigurations[0].Subnet.Id -Name $vmss.VirtualMachineProfile.NetworkProfile.NetworkInterfaceConfigurations[0].IpConfigurations[0].Name

# Replace the existing IP configuration in the local PowerShell object (which contains the references to the current Azure Load Balancer) with the new IP configuration
$vmss.VirtualMachineProfile.NetworkProfile.NetworkInterfaceConfigurations[0].IpConfigurations[0] = $ipconf

# Update the model of the scale set with the new configuration in the local PowerShell object
Update-AzVmss -ResourceGroupName "myResourceGroup" -Name "myScaleSet" -virtualMachineScaleSet $vmss
```
---

[Update-AzVmss](https://learn.microsoft.com/en-us/powershell/module/az.compute/update-azvmss?view=azps-11.4.0)  
updates the state of a Virtual Machine Scale Set (VMSS) to the state of a local VMSS object

[Update-AzVmssInstance](https://learn.microsoft.com/en-us/powershell/module/az.compute/update-azvmssinstance?view=azps-11.4.0&viewFallbackFrom=azps-3.6.1)  
starts a manual upgrade of the specified Virtual Machine Scale Set (VMSS) instance.
This is used when the upgrade policy on the VMSS Scale Set is set to manual.

[Set-AzVmssVM](https://learn.microsoft.com/en-us/powershell/module/az.compute/set-azvmssvm?view=azps-11.4.0)  
modifies the state of a Virtual Machine Scale Set (VMSS) instance.



---

## Q99:

Your comopany develops a new app.
The app must be deployed to a VMSS to provide high availability 
and to meet changing resource requirements.

You run the `New-AzResourceGroup` cmdlet to create the RG for the VMSS.
You then want to create the VMSS.
Which cmdlet should you run next?

- New-AzVmss
- New-AzVmssVM
- New-AzVm
- Set-AzVmss

---

### Answer:
- New-AzVmss

---

### References:

[New-AzVmss](https://learn.microsoft.com/en-us/powershell/module/az.compute/new-azvmss?view=azps-11.4.0)   

> Example 1: Create a VMSS using the SimpleParameterSet
```
$vmssName = 'VMSSNAME'
# Create credentials, I am using one way to create credentials, there are others as well.
# Pick one that makes the most sense according to your use case.
$vmPassword = ConvertTo-SecureString "PASSWORD" -AsPlainText -Force
$vmCred = New-Object System.Management.Automation.PSCredential('USERNAME', $vmPassword)
$securityTypeStnd = "Standard"

#Create a VMSS using the default settings
New-AzVmss -Credential $vmCred -VMScaleSetName $vmssName -SecurityType $securityTypeStnd
```

The command above creates the following with the name $vmssName :

A Resource Group
A virtual network
A load balancer
A public IP
the VMSS with 2 instances

The default image chosen for the VMs in the VMSS is:
2016-Datacenter Windows Server and the SKU is Standard_DS1_v2

---

[Quickstart: Create a Virtual Machine Scale Set with Azure PowerShell](https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/quick-create-powershell)   

```
New-AzVmss `
-ResourceGroupName "myResourceGroup" `
-Location "EastUS" `
-VMScaleSetName "myScaleSet" `
-VirtualNetworkName "myVnet" `
-SubnetName "mySubnet" `
-PublicIpAddressName "myPublicIPAddress" `
-LoadBalancerName "myLoadBalancer" `
-OrchestrationMode 'Uniform' `
-UpgradePolicyMode "Automatic"
```

OrchestrationMode
Specifies the orchestration mode for the virtual machine scale set. Possible values: Uniform, Flexible

[Orchestration modes for Virtual Machine Scale Sets in Azure](https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/virtual-machine-scale-sets-orchestration-modes)  
Scale set orchestration modes allow you to have greater control over how virtual machine instances are managed by the scale set.

> Scale sets with Uniform orchestration
Uniform uses identical VM instances.
Individual Uniform VM instances are exposed via the Virtual Machine Scale Set VM API commands. 
**Individual instances aren't compatible with the standard Azure IaaS VM API commands**.
Uniform orchestration provides fault domain high availability guarantees when configured with fewer than 100 instances. 

> Scale sets with Flexible orchestration:

Achieve high availability at scale with identical **or multiple virtual machine types**.

 Flexible orchestration offers high availability guarantees (up to 1000 VMs) by spreading VMs across fault domains in a region or within an Availability Zone.

> Scenarios for Flexible orchestration:

Quorum-based workloads
Open-Source databases
Stateful applications
Services that require High Availability and large scale
**Services that want to mix virtual machine types or Spot and on-demand VMs together**
Existing Availability Set applications

> Main difference between Unifirm & Flexible Orchestration:
**You can use all of the standard VM APIs when managing Flexible orchestration instances**
instead of the Virtual Machine Scale Set VM APIs you use with Uniform orchestration. 
Flexible orchestration mode can be used with all VM sizes.
---

[New-AzVmssConfig](https://learn.microsoft.com/en-us/powershell/module/az.compute/new-azvmssconfig?view=azps-11.4.0)  

creates a configurable local Virtual Manager Scale Set (VMSS) object.

> Example 1: Create a VMSS configuration object
```
$VMSS = New-AzVmssConfig -Location $Loc -SkuCapacity 2 -SkuName "Standard_A0" -UpgradePolicyMode "Automatic" -NetworkInterfaceConfiguration $NetCfg | Add-AzVmssNetworkInterfaceConfiguration -Name "Test" -Primary $True -IPConfiguration $IPCfg | Set-AzVmssOsProfile -ComputerNamePrefix "Test" -AdminUsername $adminUsername -AdminPassword $AdminPassword | Set-AzVmssStorageProfile -Name "Test" -OsDiskCreateOption "FromImage" -OsDiskCaching "None" -ImageReferenceOffer $ImgRef.Offer -ImageReferenceSku $ImgRef.Skus -ImageReferenceVersion $ImgRef.Version -ImageReferencePublisher $ImgRef.PublisherName -VhdContainer $VHDContainer | Add-AzVmssAdditionalUnattendContent -ComponentName  $AUCComponentName -Content  $AUCContent -PassName  $AUCPassName -SettingName  $AUCSetting;

New-AzVmss -ResourceGroupName $RGName -Name $VMSSName -VirtualMachineScaleSet $VMSS;
```

---

## Q98:

You are asked to configure SSPR (self service password reset) for a subset fo users
in your organization.

Requirements:

- you should be able to add and remove users who are allowed to use SSPR
- the user must provide one additional piece of personal info before they are allowed to reset their psw

Which 4 actions should you perform in a sequence?

- register an authentication method for SSPR
- enable SSPR with the selected option
- enable SSPR with all options
- select the ME group for which you want SSPR
- add user to the SSPR list of users
- create a Micorsoft Entra security group and add users to it

---

### Answer:

- create a Micorsoft Entra security group and add users to it
- enable SSPR with the selected option
- select the ME group for which you want SSPR
- register an authentication method for SSPR

The additional personal info that a user can provide during SSPR:

- mobile app notification
- mobile app code
- email
- mobile phone
- office phone
- security questions

It is not possivble to add users directly to the SSPR configuration.
Users are added to Microsoft Entra Security Groups and the the SSPS is activated on these groups.

---

### References:

[Tutorial: Enable users to unlock their account or reset passwords using Microsoft Entra self-service password reset](https://learn.microsoft.com/en-us/entra/identity/authentication/tutorial-enable-sspr)    

---

## Q97:

You want to install SQL Server 2019 on an Azure Windows VM.
You must ensure that the VM has 99.99% SLA.
The solution must minimize costs.

Choose the correct values for each configuration:

Size: 
`Standard_DS4_v2`
`Standard_D4_v2`
`Standard_A8_v2`

OS Disk Type:
Premium SSD
Standard SSD
Standard HDD

Data Storage Type:
Premium SSD
Standard SSD
Standard HDD


---

### Answer:

Size: 
`Standard_DS4_v2`

OS Disk Type:
Premium SSD

Data Storage Type:
Premium SSD

**In order to achive 99.99% SLA on a single instance VM any disk must be Premium SSD**.
`Standard_DS4_v2` is the only option among those available that supports Premium SSD.

`Standard_D4_v2` & `Standard_A8_v2` **do not** support Premium SSD.

---

### References:

Refer to the Referenxces of a prevous question in which the sizes of VMs
are examined.

---

## Q96:

You need to create a Availability Set named AS1.
You plan to deploy 8 VMs to AS1 to run IIS web app.

You must configure AS1, the requirements are:

- during planned maintenance of the VM host there must be at least 6 VM available the VM must be restarted in groups of 2
- the VM must be physically separated from each other as much as possible

How should you configure the AS1?

Name: AS1
Region: US Central US
fault domains: 1 | 2 | 3 | 4 | 10 | 20
update domains: 1 | 2 | 3 | 4 | 10 | 20
use managed disks: Yes

---

### Answer:

fault domains: 3
update domains: 4

update domains: 4
this guarantees that VMs will be restarted in groups of 2

fault domains: 3
This is the max number of Fault Domains available to the region (US) Central US.

**Availability sets** place VMs in different **fault domains**.

**Fault Domains** are groupings of machines that share similar hardware, power, network etc. If you spread machines over fault domains, they will be on different sets of hardware.

**Upgrade domains** are groupings of machines that will have updates 
applied at the same time.
You want to spread machines across updated domains to avoid them being
updated at the same time. 


---

### References:

[Choosing the right number of fault domains for Virtual Machine Scale Set](https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/virtual-machine-scale-sets-manage-fault-domains)  

Virtual Machine Scale Sets are created with five fault domains by default in Azure regions with no zones. 

---

[Availability sets overview](https://learn.microsoft.com/en-us/azure/virtual-machines/availability-set-overview)  

[Azure VMs : Availability Sets and Availability Zones](https://learn.microsoft.com/en-us/archive/technet-wiki/51828.azure-vms-availability-sets-and-availability-zones)   

[Availability options for Azure Virtual Machines](https://learn.microsoft.com/en-us/azure/virtual-machines/availability)  

---

## Q95:

You create a VMSS named vmss1.
The scaling configuration is shown in the exhibit:

<img src="./Q95-exhibit-1.png">
<img src="./Q95-exhibit-2.png">
<img src="./Q95-exhibit-3.png">
<img src="./Q95-exhibit-4.png">
<img src="./Q95-exhibit-5.png">

As shown in the exhibits, there are three scale conditions:

1. a default scale condition with an overview of the scale-out/in details
2. specific scale condition 1
2. specific scale condition 2

You must check the configuration.

What should the observed capacity metric be in the following three scenarios?

- scenario 1:

On Wed 06/10/2020.
scale set instance count: 3 for 2 hours
CPU: 50% to 60%

after this period:
CPU: 80% for 11 minutes

> What will be the observed capacity metric? [2..6]

- scenario 2:

On Mon 04/06/2020.
CPU: 50% to 60% for 2 h

after this period:
CPU: 80% for 11 minutes

> What will be the observed capacity metric? [2..6]

- scenario 3:

On Tue 05/05/2020.
scale set instance count: 3 for 4 hours
CPU: 40% to 60%

after this period:
CPU: 10% for 6 minutes

> What will be the observed capacity metric? [2..6]

---

### Answer:

scale condition 1:
min instance: 2
max instance: 6
default: 3

scale condition 2:
type: on metric 
AVG(CPU%) > 75% over 10 mins
increase instance count by 1

scale condition 3:
type: on metric 
AVG(CPU%) < 25% over 5 mins
reduce instance count by 1

scale condition 4: 
type: specific instance count 
from: 5th April 2020 
to:  12th April 2020       
the instance count will be 6

scale condition 5: 
type: specific instance count 
every Fri from 6 AM to 6 PM 
the instance count will be 4

- scenario 1:

On Wed 06/10/2020.
scale set instance count: 3 for 2 hours
CPU: 50% to 60%

after this period:
CPU: 80% for 11 minutes

> What will be the observed capacity metric? [2..6]
it is not a Fri therefore rule 5 does not apply.
06/10/2020 = 10th Jun 2020 > [5th April 2020, 12th April 2020] -> rule 4 does not apply
CPU: 50% to 60% therefore rules 2 & 3 do not apply 
CPU: 80% -> avg(CPU%) > 75% for over 10 mins -> rule2 kicks in -> increase by 1
-> from the default count of 3 instances add 1
-> 4 instances
-> 4 instances is lower than the maximun number of instances set by rule1: 6
-> 4 instances

- scenario 2:

On Mon 04/06/2020.
CPU: 50% to 60% for 2 h

after this period:
CPU: 80% for 11 minutes

> What will be the observed capacity metric? [2..6]
it is not a Fri therefore rule 5 does not apply.
04/06/2020 = 6th Apr 2020 in [5th April 2020, 12th April 2020] -> rule 4 applies!
-> the default instance ount will be 6 this period

CPU: 80% for 11 minutes ->
CPU: 80% -> avg(CPU%) > 75% for over 10 mins -> rule2 kicks in -> increase by 1 
-> from the default count of 6 for this period add 1
-> 7 instances
-> 7 instances is greater than the maximun number of instances set by rule1: 6
-> 6 instances

- scenario 3:

On Tue 05/05/2020.
scale set instance count: 3 for 4 hours
CPU: 40% to 60%

after this period:
CPU: 10% for 6 minutes

> What will be the observed capacity metric? [2..6]
it is not a Fri therefore rule 5 does not apply.
05/05/2020 = 5th May 2020 > [5th April 2020, 12th April 2020] -> rule 4 does not apply
-> default number of instances is set by rule 1 to 3 instances
CPU: 10% for 6 minutes -> rule3: AVG(CPU%) < 25% over 5 mins 
-> reduce by 1
-> from the default of 3 to 2
-> 2 is >= the min number of instances set by rule1
-> instance count 2

---

### References:

[Automatically scale a Virtual Machine Scale Set in the Azure portal](https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/virtual-machine-scale-sets-autoscale-portal)  

---

## Q94:

you have an Azure sub named suba with the following resources:

- a KV named kv1 in a RG named RG1
- a VM named vm1 in RG2

you need to write a PowerShell script to encrypt the disk of the VM 
using a key stored in the KV.

Complete the script.

```
$kvrg = 'rg1'
$vmrg = 'rg2'
$vmn = 'vm1'
$kvn = 'kv1'

$kv = Get-AzKeyVault OPTIONS-1 $kvn -ResourceGroupName $kvrg
$diskEncryptionUrl = OPTIONS-2
$kvid = OPTIONS-3

Set-AzVMDiskEncryptionExtension  -ResourceGroupName OPTIONS-4 ` 
-DiskEncryptionKeyVaultUrl $diskEncryptionUrl `
-DiskEncryptionKeyVaultId $kvid `
-VMname $vmn 
```

OPTIONS-1: -Name | -KeyVaultName

OPTIONS-2: $kv.Path | $kv.Uri | $kv.VaultUri

OPTIONS-3: $kv.Id | $kv.ResourceId

OPTIONS-4: $kvrg | $vmrg


---

### Answer:

```
$kvrg = 'rg1'
$vmrg = 'rg2'
$vmn = 'vm1'
$kvn = 'kv1'

$kv = Get-AzKeyVault -KeyVaultName $kvn -ResourceGroupName $kvrg
$diskEncryptionUrl = $kv.VaultUri
$kvid = $kv.ResourceId

Set-AzVMDiskEncryptionExtension -ResourceGroupName $vmrg ` 
-DiskEncryptionKeyVaultUrl $diskEncryptionUrl `
-DiskEncryptionKeyVaultId $kvid `
-VMname $vmn 
```

This is tricky as the `Get-AzKeyVault` uses a nomenclature that is different
from other similar `Get-AzXXX` cmdlets i.e. `-KeyVaultName` istead pf simply
`-Name`.

---

### References:

[Azure Disk Encryption scenarios on Windows VMs](https://learn.microsoft.com/en-us/azure/virtual-machines/windows/disk-encryption-windows)  

---

## Q93:

you have a linux VM named VM1 in Azure.

- size: Standard_D4s_v3
- 4 vCPU
- premium storage
- 8 Data Disks
- 1 public IP Standard SKU

You attempt to resize the VM to `Standard_D2s_v3`.
The resize operation fails.

Which is the most likely cause for this failure?

- storage type
- public IP
- number of data disks
- number of vCPUs

---

### Answer:
- number of data disks

`Standard_D4s_v3`: supports up to 8 data disks
`Standard_D2s_v3`: supports up to 4 data disks
Both series support premium storage.

Both series support public IP addresses. Moreover, this apply in general to all
series as the IP adress is attached to a NIC and not directly to a VM.


---

### References:

[General purpose virtual machine sizes](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes-general)   

- provide balanced CPU-to-memory ratio 
- Ideal for testing and development
- small to medium databases
- and low to medium traffic web servers

there are lost of options:

Av2-series
B-series burstable
DC-series
Dpsv5 and Dpdsv5-series and Dplsv5 and Dpldsv5-series
Dv2 and Dsv2-series 
Dv2 and Dsv2-series 
Dv3 and Dsv3-series r
Dav4 and Dasv4-series
Dv4 and Dsv4-series 
...
...

---

[Sizes for virtual machines in Azure](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes)    

---

## Q92:

You have a Azure SUB named sub1.
You deploy a Windows Server 2016 VM named VM1 to sub1.
You must change the Availability Set assignment for VM1.

What should you do?

- redeploy VM1 from a recovery point
- migrate VM1 to another region
- assign VM1 to the new Availability Set
- Move VM1 to a different Availability Zone


---

### Answer:
- redeploy VM1 from a recovery point

**A VM can only be added to an availability set when it is created**.

1. make a backup of thr current VM
2. delete the current VM
3. deploy a new vm based on the most recent restore point and to the new availability set 

The remaining options do not apply:

- migrate VM1 to another region:
this would not work because a region defines the geographical limits of an AS and also AZ.

**An AS is a collection of independent Fault Domains within the same Datacenter**
that is these FD have independent Power and Network.
AS provides 99.95% SLA.
It provides lower latency than achievable with AZ but at the cost of lower resiliency.
However, is still supsceptible to failure at a Datacenter level.
 
An AZ is a set of datacenter within a region. 
There may be 2 or more datacenters per region and an AS is a selection of these
datacenters to deply your assets to in order to provide resilience and redundancy.
AZ provides 99.99% SLA.

- Move VM1 to a different Availability Zone:
the AZ ios a concept **mutually exclusive to AS**.
You either deploy a VM to an AZ or an AS, the former is similar in concept and purpose but it is cross-region and therefore provides higher resilience and it
is better suited to satisfy global redundancy requirements.

- assign VM1 to the new Availability Set:
this cannot be doen without redeplyingthe VM

---

### References:

[Change the availability set for a VM using Azure PowerShell](https://learn.microsoft.com/en-us/azure/virtual-machines/windows/change-availability-set)    

**A VM can only be added to an availability set when it is created**. 

```
# Set variables
    $resourceGroup = "myResourceGroup"
    $vmName = "myVM"
    $newAvailSetName = "myAvailabilitySet"

# Get the details of the VM to be moved to the Availability Set
    $originalVM = Get-AzVM -ResourceGroupName $resourceGroup -Name $vmName

# Create new availability set if it does not exist
    $availSet = Get-AzAvailabilitySet -ResourceGroupName $resourceGroup -Name $newAvailSetName -ErrorAction Ignore
    if (-Not $availSet) {
    $availSet = New-AzAvailabilitySet -Location $originalVM.Location -Name $newAvailSetName -ResourceGroupName $resourceGroup -PlatformFaultDomainCount 2 -PlatformUpdateDomainCount 2 -Sku Aligned
    }

# Remove the original VM
    Remove-AzVM -ResourceGroupName $resourceGroup -Name $vmName

# Create the basic configuration for the replacement VM.
    $newVM = New-AzVMConfig -VMName $originalVM.Name -VMSize $originalVM.HardwareProfile.VmSize -AvailabilitySetId $availSet.Id
 
# For a Linux VM, change the last parameter from -Windows to -Linux
    Set-AzVMOSDisk -VM $newVM -CreateOption Attach -ManagedDiskId $originalVM.StorageProfile.OsDisk.ManagedDisk.Id -Name $originalVM.StorageProfile.OsDisk.Name -Windows

# Add Data Disks
    foreach ($disk in $originalVM.StorageProfile.DataDisks) { 
    Add-AzVMDataDisk -VM $newVM -Name $disk.Name -ManagedDiskId $disk.ManagedDisk.Id -Caching $disk.Caching -Lun $disk.Lun -DiskSizeInGB $disk.DiskSizeGB -CreateOption Attach
    }
    
# Add NIC(s) and keep the same NIC as primary; keep the Private IP too, if it exists.
    foreach ($nic in $originalVM.NetworkProfile.NetworkInterfaces) {	
    if ($nic.Primary -eq "True")
    {
            Add-AzVMNetworkInterface -VM $newVM -Id $nic.Id -Primary
               }
           else
               {
                 Add-AzVMNetworkInterface -VM $newVM -Id $nic.Id 
                }
      }

# Recreate the VM
    New-AzVM -ResourceGroupName $resourceGroup -Location $originalVM.Location -VM $newVM -DisableBginfoExtension
```
---

[Availability sets overview](https://learn.microsoft.com/en-us/azure/virtual-machines/availability-set-overview)  

We recommend that customers choose virtual machine scale sets with flexible orchestration mode for high availability with the widest range of features.

> What is an availability set?
It is a **logical groupings of VMs** that reduce the chance of correlated failures bringing down related VMs at the same time. 
Availability sets **place VMs in different fault domains** for better reliability.
It is **especially beneficial if a region doesn't support availability zones**.

When using availability sets, create two or more VMs within an availability set. Using two or more VMs in an availability set helps highly available applications and **meets the 99.95% Azure SLA**. 

**[With AZ you reach 99.99% SLA]**

**There's no extra cost for using availability sets**, you only pay for each VM instance you create.

- improved VM to VM latencies compared to availability zones
- have fault isolation for many possible failures

> Datacenter Failures:
- datacenter network failures, which can affect multiple fault domains.

---

[What are availability zones?](https://learn.microsoft.com/en-us/azure/reliability/availability-zones-overview?tabs=azure-cli)   

Many Azure regions provide availability zones.
AZ are separated groups of datacenters within a region. 

---

[Availability options for Azure Virtual Machines](https://learn.microsoft.com/en-us/azure/virtual-machines/availability)  

---

## Q91:

Your media production company recently moved all of its infrastructure into Azure.

Every 14 days you run a batch job to render several thousand video clips into various media formats for your customers. 
At the moment the batch job runs on a sigle H-series VM.

You need to design a scalable compute solution.
The requirements are the following:

- it must use VM instance sizes smaller than the H-series
- it must support automatic scale out and scale in based on CPU metrics
- it must minimize deployment time
- it must minimize admin overhead

what should you do?

- configure an auto-scaling rule on the existing VM
- author an ARM template that creates additional VMs
- deploy a VMSS
- create a Azure Data Factory pipeline

---

### Answer:
- deploy a VMSS

VMSS allows automatic horizontal scaling of a VM.
It may be a Windows Server or a Linux VM.
VMSS support up to 1000 instances.

The remaining options clearly do not apply:

- configure an auto-scaling rule on the existing VM
it is not possible to set scaling rule of any kind on an individual VM, it is 
possible only with VMSS.

- author an ARM template that creates additional VMs
- create a Azure Data Factory pipeline:
this is an netirely different PaaS service that has nothing to do with this scenario.

---

### References:

[What are Virtual Machine Scale Sets?](https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/overview)  

[Get started with autoscale in Azure](https://learn.microsoft.com/en-us/azure/azure-monitor/autoscale/autoscale-get-started)    

[Autoscaling](https://learn.microsoft.com/en-us/azure/architecture/best-practices/auto-scaling)    

---

[What is Azure Data Factory?](https://learn.microsoft.com/en-us/azure/data-factory/introduction)   

Azure Data Factory is a managed cloud service that's built for:

- complex hybrid extract-transform-load (ETL)
- extract-load-transform (ELT)
- data integration projects.

 It is the cloud-based ETL and data integration service that allows you to create data-driven workflows for orchestrating data movement and transforming data at scale.

 Using Azure Data Factory, you can create and schedule data-driven workflows (called pipelines) that can ingest data from disparate data stores. 

You can build complex ETL processes that transform data visually with data flows or by using compute services such as:

- Azure HDInsight Hadoop
- Azure Databricks
- Azure SQL Database

you can publish your transformed data to data stores such as:
- Azure Synapse Analytics 
for business intelligence (BI) applications to consume. 



> Features of Azure Data Factory:

- Data Compression: 
During the Data Copy activity, it is possible to compress the data and write the compressed data to the target data source. This feature helps optimize bandwidth usage in data copying.

- Extensive Connectivity Support for Different Data Sources: 
Azure Data Factory provides broad connectivity support for connecting to different data sources. This is useful when you want to pull or write data from different data sources.

- Custom Event Triggers: 
Azure Data Factory allows you to automate data processing using custom event triggers. This feature allows you to automatically execute a certain action when a certain event occurs.

- Data Preview and Validation: 
During the Data Copy activity, tools are provided for previewing and validating data. This feature helps you ensure that data is copied correctly and written to the target data source correctly.

- Customizable Data Flows: 
Azure Data Factory allows you to create customizable data flows. This feature allows you to add custom actions or steps for data processing.

- Integrated Security: 
Azure Data Factory offers integrated security features such as Azure Active Directory integration and role-based access control to control access to dataflows. This feature increases security in data processing and protects your data.

> Usage scenarios:

- imagine a gaming company that collects petabytes of game logs that are produced by games in the cloud. 
The company wants to analyze these logs to gain insights into customer preferences, demographics, and usage behavior. 

-

---

[Azure Data Factory Tutorial | Introduction to ETL in Azure](https://www.youtube.com/watch?v=EpDkxTHAhOs&t=280s)   

---

[High performance computing VM sizes](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes-hpc)    

[HBv4-series](https://learn.microsoft.com/en-us/azure/virtual-machines/hbv4-series)   

VMs are optimized for various HPC workloads such as:

- computational fluid dynamics
- finite element analysis
- frontend and backend EDA
- rendering
- molecular dynamics
- computational geoscience
- weather simulation
- financial risk analysis 

HBv4 VMs will feature:

- up to 176 AMD EPYC™ 9004-series (Genoa) CPU cores
- 688 GB of RAM
- and no simultaneous multithreading. 

HBv4-series VMs also provide:

- 800 GB/s of DDR5 memory bandwidth 
- 768MB L3 cache per VM
- up to 12 GB/s (reads) 
- 7 GB/s (writes) of block device SSD performance
- clock frequencies up to 3.7 GHz.

All HBv4-series VMs feature:

There are also the following series:


---

*** Bicep End ***

## Q90:

You are an Azure admin and deploy Azure resource with Bicep.
You want to use Lamba functions to hadle an array.
You need to convert an array to an object with a custom key function
and optional custom value function to produce the following output.

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

OPTIONS: toObject | sort | reduce | map


---

### Answer: toObject

---

### References:

[Lambda functions for Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/bicep-functions-lambda)  

Bicep are essentially blocks of code that can be passed as an argument. 

`<lambda variable> => <expression>`

> Limitations:

Using lambda variables (the temporary variables used in the lambda expressions) inside resource or module array access isn't currently supported.

Using lambda variables inside the listKeys function isn't currently supported.

Using lambda variables inside the reference function isn't currently supported.

Lambda expression can only be specified directly as function arguments in these functions: 

- filter()
filter(inputArray, lambda expression)
output oldDogs array = filter(dogs, dog => dog.age >=5)

- map()
Applies a custom mapping function to each element of an array.
map(inputArray, lambda expression)

```
output dogNames array = map(dogs, dog => dog.name)
output sayHi array = map(dogs, dog => 'Hello ${dog.name}!')
output mapObject array = map(range(0, length(dogs)), i => {
  i: i
  dog: dogs[i].name
  greeting: 'Ahoy, ${dogs[i].name}!'
})
```

- reduce()
Reduces an array with a custom reduce function.
reduce(inputArray, initialValue, lambda expression)
```
var ages = map(dogs, dog => dog.age)
output totalAge int = reduce(ages, 0, (cur, next) => cur + next)
output totalAgeAdd1 int = reduce(ages, 1, (cur, next) => cur + next)
```

- sort()
sort(inputArray, lambda expression)
output dogsByAge array = sort(dogs, (a, b) => a.age < b.age)

- toObject():
toObject(
  inputArray, 
  lambda expression to provide the key predicate, 
  [lambda expression to provide the value]
  )

`output twocats object = toObject(cats, entry=>entry.name)`
`output dogsObject object = toObject(dogs, entry => entry.name, entry => entry.properties)`
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
- the resource named otherZone is implicitly dependent on PrimaryDnsZome
- Azure Resource Manager deploys the PrimaryDnsZone and otherZone resources in parallel

---

### Answer:

- the resource named otherResource is implicitly dependent on PrimaryDnsZome
yes

- the resource named otherZone is implicitly dependent on PrimaryDnsZome
no

- Azure Resource Manager deploys the PrimaryDnsZone and otherZone resources in parallel
no

There are two kinds of resource dependencies in Bicep:

- implicit:
when a resorce declaration refrences aonethor in the smae deployment

- explicit:
when the `dependOn: [resouceName]` syntx is used.

It is olso possible to use the operator `::` to reach nested dependencies.

---

### References:

[Resource dependencies in Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/resource-dependencies)  

```
resource myParent 'My.Rp/parentType@2023-05-01' = {
  name: 'myParent'
  location: 'West US'

  // implicit dependency on 'myParent'
  resource myChild 'childType' = {
    name: 'myChild'
  }
}
```

```
resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'examplestorage'
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

resource service 'Microsoft.Storage/storageAccounts/fileServices@2022-09-01' = {
  name: 'default'
  parent: storage
}
```

[::operator](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/operators-access#nested-resource-accessor)  

> parentResource::nestedResource

```
resource demoParent 'demo.Rp/parentType@2023-01-01' = {
  name: 'demoParent'
  location: 'West US'

  // Declare a nested resource within 'demoParent'
  resource demoNested 'childType' = {
    name: 'demoNested'
    properties: {
      displayName: 'The nested instance.'
    }
  }

  // Declare another nested resource
  resource demoSibling 'childType' = {
    name: 'demoSibling'
    properties: {
      // Use symbolic name to reference because this line is within demoParent
      displayName: 'Sibling of ${demoNested.properties.displayName}'
    }
  }
}

// Use nested accessor to reference because this line is outside of demoParent
output displayName string = demoParent::demoNested.properties.displayName
```

---

*** Bicep Beginning ***

## Q88 :

Your organization uses Azure Advisor to optimize the Azure deployments.
You want to set up an alert for new recommendation from the Azure Advisor using Bicep.
You need to define the Azure resources in the Bicep file named `main.bicep`

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

An RG was deployed from an ARM template.
Resources have since been added to the RG and some also modified through the Azure Portal.

You need to create a new ARM template based on the current state of the RG.

Which PowerShell cmflet should you use?

- Export-AzResourceGroup
- Save-AzResourceGroupDeploymentTemplate
- New-AzResourceGroupDeployment
- Save-AzDeploymentTemplate

---

### Answer:
- Export-AzResourceGroup

This cmdlet capture the deployment state of the RG as it is and produces a 
ARM template that replicates the resources as they are presently on the RG. 

The remaining options do not apply:

`Save-AzResourceGroupDeploymentTemplate`
This saves the RG deployment and not the current RG.

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
Each VM should be deployed with a unique admin password.

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

You download an ARM template created from an existing VM.
You plan to use this template to deploy 50 new VMs.

You need to modify the template to reference an admin password.
The psw must not be stored in clear text.

What should you do first?

- create and store the psw in the resource template
- create and store the psw in an Axure KV and create an access policy
- create and store the psw in a Recovery Services vault and create a Backup Policy
- create and store the psw in a separate template and create a link from the source template


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

You need to deploy the resources from the RGD.
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


> the meaning of the param: TemplateObject 
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
You must ensure it has a reference to the password.
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
All VM are in the same RG named RG1.
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

After the successful deployment, you find that all resource but the new SA 
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
The modes complete vs. incremental have already been discussed in details in a 
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

You want to reuse this template for other deployments.
You need all the resources in the RG to be in the same location.

What should you do?

- use New-AzResourceGroup with -Location to create the RG in the desirged location. Then use AzResourceGroupDeployment with the new RG.

- use The Azure Portal to create the RG in the desired Location. Then use AzResourceGroupDeployment with the new RG.

- edit the template file and update the location param with the value `[resourceGroup().location]`

- edit the parameters file and ass a new parameter named `location` of type string with the default value `[resourceGroup().location]`

---

### Answer:

- edit the template file and update the location param with the value `[resourceGroup().location]`

The following suggested solution could also work:
- edit the parameters file and add a new parameter named `location` of type string with the default value `[resourceGroup().location]`
However, you would also need to update the ARM template with the new `[parameters('location')]` where required.

The remaining options are obviously not suitable to this case.

---

### References:

---

## Q77:

Your company has a LOB app that uses several Azure resources.
These resources are all in the same RG.
After the first deplyment more resources for are added to the same RG via the deployments.

You need to create a template to redeploy the resources required by the LOB app.

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

company1 has various workloads running on Azure.
In order to acces apps hosted on Azure all users of company1 autheticate to the
`company1.com` tenant with Microsoft Entra. 
**Microsoft Entra Connect Sync** is used with the on-prem AD.

company2 owns the Azure tenant `company2.com`.
company2 signs an agreement with company1.

Five users from company2 need access to a number of apps hosted on `company1.com`.
company2 users should also be able to use SSO to access `company1.com` resources
using their `company2.com` credentials.

You need to implement a solution quickly and at no costs.
What should you do?

- enable B2C authetication to allow the five uses from company2 to use their outlook.com email addresses to access the app on  `company1.com`

- add five company2 users principal names UPNs as guest users on the `company1.com` tenant

- configure ADFS at company1 to federate thet five company2 users to a utheticate with the company2 AD

- create user accounts for the five users from company2 in the company1 on-prem AD
---

### Answer:
- add five company2 users principal names UPNs as guest users on the `company1.com` tenant

adding these 5 UPN to `company1.com` as guest and sending them an invitation provides them 
with SSO and it is the easiest solution.

The remaining options do not apply:

- enable B2C authetication to allow the five uses from company2 to use their outlook.com email addresses to access the app on `company1.com`
This is not a goood solution because if any of these users left company2 they would still be able to access `company1.com`. They are not customers by themselves, the agreement is between
the companies and you want that if any of this fives are removed from `company2.com`
then their identities become invalid also in `company1.com`.

- configure ADFS at company1 to federate their five company2 users to a utheticate with the company2 AD
This is possible but fairly complex and expensive.

- create user accounts for the five users from company2 in the company1 on-prem AD
This would work also, but it breaks the requirement that the five users need to use
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

You need to export the current configuration of the LOB app resources to an ARM template.
The ARM template will be used to the deploy the LOB app infrastructure in a different
testing enviroment.

The ARM template uses the `complete` deployment mode.

Select Yes/No for each statement.

- you need to export the ARM template from the latest deployment
- each deployment contains only the resources that have been added in that deployment
- that parameters file contains the values used during that deployment
- the template contains thet scripts needed to deply the template

---

### Answer:

- you need to export the ARM template from the latest deployment
No
The latest deployment contains only the resources that have been deployed within the latest 
deployment. 
In order to get the ARM template to deploy all the resources you must export 
the ARM template from the RG.

- each deployment contains only the resources that have been added in that deployment
Yes

- that parameters file contains the values used during that deployment
Yes

- the template contains the scripts needed to deplOy the template
No

---

### References:

[Use Azure portal to export a template](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/export-template-portal)   

[Understand the structure and syntax of ARM templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/syntax)  

[Azure Resource Manager deployment modes](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deployment-modes)  

When deploying your resources, you specify that the deployment is either 

- incremental update 
- complete update

**For both modes**, Resource Manager tries to create all resources specified in the template. 
**If the resource already exists** in the resource group and 
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
You enable blob versioning for the SA.
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
writes a blob by specifying the list of block IDs that make up the blob.
It allows to update a blob by uploading only those blocks that have changed
and then committing the new blocks and the old one together as a new version.

- Copy Blob
this copies a whole blob to a target SA

- Set Blob Metadata
metadata as a list of name-value pairs can be attached to a blob and it is 
part of a version of the blob

These ops do not create a new version of the blob:
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
- the PS command disables soft delete on the SA and permanently deletes an AFS that has been soft deleted

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
| server1     | WS2022               | ? |
| server2     | WS2022               | ? |
| server3     | WS2016               | ? |
| server4     | WS2019               | ? |
| server5     | WS2012 R2            | ? |

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


Currently, none of the existing SAs allows you to provision a premium file share,
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
have network profiles.

You create an Azure File Share that stores user profiles and you configure the relevant
file path onto each Windows 10 session host in the AVD pool.

During testing of this solution you find that users log in via `FSLogix` temporary 
profile instead of a network profile. However, admins can successfully mount the file
share on the same session host.

What is the source of this problem?

- Azure File Share netwrork settings are too restrictive
- users do not have the permission to access the Azure File Share
- the session host firewall blocks the user profiles from loading
- local profiles already exist for the users

---

### Answer:
- users do not have the permission to access the Azure File Share

Users that log into the session host need R/W permissions to the Azure File Share.
This is to allow a profile to be created and updated every time they log off.
If a user does not have the R/W permission thne they are logged in with a local profile
on the Windows 10 session host and this does not save any changes made on the session.

This is also why the admin can log on the session host via the File Share.
It also proves that it is not the firewall tha blocks the communication to the Azure File Share
and the loading of the profiles.

- local profiles already exist for the users
this cannot be the case as the users have logged on for the first time and therefore there
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
-File "file1.txt" `
-Blob "file1.txt" `
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

You work at a company that hosts resources in Azure including a File Share.
You are asked to create a new VNet and a Azure File Share to be connected 
to a new Windows Server 2019 VM that must also be provisioned by you.

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
- check that permission is configured correctly
- unblock port 2049
- enable New Technology LAN Manager version 1 (NTLMv1)

---

### Answer:
- unblock TCP 445

The error: `System Error 67 has occured`
is returned on Windows Server when TCP 445 is blocked.
This prevents the Windows Server to communicate over SMB v3.0 to the Azure File Share.

This was discussed well in previous questions.

The other options are not relevant in this case:

`NTLMv1` should be already disabled on WS2019 if you enabled you would get the error:
`System Error 53 has occured`
when trying to mount the Azure File share.
Azure file share only support `NTLMv2`

**TCP 2049** is used on Windows Server for **Network File Share (NFS)** protocol and not SMB.

---

### References:

[Troubleshoot Azure Files](https://learn.microsoft.com/en-us/troubleshoot/azure/azure-storage/files/files-troubleshoot?tabs=powershell)     

[Create an SMB Azure file share](https://learn.microsoft.com/en-us/azure/storage/files/storage-how-to-create-file-share?tabs=azure-portal)   

---

## Q67:

Your company has on-prem infrastructure and plans to move to IaaS in Azure.
You plan to migrate the erchive data to Azure Blob Storage and you have used
Azure Storage Explorer to complete an initial bulk upload.

You need to create a lifecycle management policy using Powershell to move data
that has not been modified for the last 30 days to the hot tier to the cool tier.

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
This data is rarely accessed and the Finance Director has expressed concern about its 
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

This is the obviouos answer to this question.

---

### References:

[Configure a lifecycle management policy](https://learn.microsoft.com/en-us/azure/storage/blobs/lifecycle-management-policy-configure?tabs=azure-portal)   

---

## Q65:

Your company implements block blob storage in a GPv2 SA.
It is seldom necessary to access the data after initial input, 
but it is occasionally required.
Storage costs should be kept to a minimum.

You propose the following rule to move the data directly to the archive immediately after 
being written to the storage:

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

This detail was mentioned in one of the previous answer to a question that 
had archiving to a SA as its topic.

[Blob rehydration from the archive tier](https://learn.microsoft.com/en-us/azure/storage/blobs/archive-rehydrate-overview?tabs=azure-portal)    

---

### References:

---

## Q64:

Your company implements block blob storage in a GPv2 SA.
It also employ the follwoing **rule** to optimize costs.

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
No: the Copy Blob operation creates a separate copy of the blob and does not reset the 
modification counter on the original blob.

- you should transition blobs from cool to hot tier to optimize performance
yes: this ALSO resets the day after modification counter to zero if any changes are made to the blob contents.

---

### References:

[Configure a lifecycle management policy](https://learn.microsoft.com/en-us/azure/storage/blobs/lifecycle-management-policy-configure?tabs=azure-portal)  

[Optimize costs by automatically managing the data lifecycle](https://learn.microsoft.com/en-us/azure/storage/blobs/lifecycle-management-overview)   

---

## Q63:

You create a File Storage Premium Account and a Premium tier Azure File Share.
You plan to mount the file share directly on-prem using `SMB 3.0` protocol.

You must ensure that the network is configured to support mounting an Azure File Share on-prem.
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
`SMB 3.0` protocol uses TCP 445 and this port must be available therefore it must not 
be blocked either from the ISP nor from the company firewall in order to be able to mount 
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
it may take **up to 15 hours to make the data available should the need be**.

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
After the FS is available on Azure any VM on Azure can access it provided it holds the access key and its path.

- execute CMDKEY on the Windows servers
allows to permanently store the credentials and map

---

[New-PSDrive](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-psdrive?view=powershell-7.4)   
Creates temporary and persistent drives that are associated with a location in an item data store.
Creates temporary and persistent drives that are mapped to or associated with a location in a data
store, such as:

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
2. disable the creation of new SA that allows cross-tenant object replication
3. disable the cross-tenant object replication on all existing SAs
4. validate the implementation as per the org's corporate standards and SLA

You review the following Policy Definition:

```
{
  "properties": {
    "displayName": "...",
    "policyType": "BuiltIn",
    "mode": "All,
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
If a storage account does not currently participate in any cross-tenant object replication policies, then setting the AllowCrossTenantReplication property to false prevents future configuration of cross-tenant object replication policies with this storage account as the source or destination. 

> case2: `AllowCrossTenantReplication` = `false`.
if a storage account currently participates in one or more cross-tenant object replication policies, then setting the AllowCrossTenantReplication property to false 
**is not permitted until you delete the existing cross-tenant policies**.

**When cross-tenant object replication is disallowed** for a storage account, then any new object replication policies that you create with that account 
**must include the full Azure Resource Manager IDs for the source and destination account**.
**Azure Storage requires the full resource ID to verify whether the source and destination** **accounts reside within the same tenant**.

> Required roles to set `AllowCrossTenantReplication` = `false`

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

You are a cloud engineer in a global company with offices around the world.
The organization uses Azure to host its infrastructure including file shares.
It uses Premium-ZRS accounts as well as Azure Files workloads.

The company is planning to open new offices in the Azure Europe UK South Region.

You need to decide which option for Azure Storage should be used based on
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

You work for a company that has a Azure subscription and 
a separate SA for each department.

A member of the Marketing team has downloaded Azure Storage Explorer
as they want to upload some old files into Azure Blob Storage.
When they attempt to log in to Storage Explorer they get the 
following error:

`Read: List/Get Storage Account(s) permission issue`

The user has Contributor Access to the SA.
You must provide them the necessary access to the subscription in order 
to resolve this error and apply the principle of least privilege.

What role should you assign to the user at the subscription level?

- Owner
- Reader
- Contributor
- Storage Blob Data Reader


---

### Answer:
- Reader

**The user has Contributor Access to the SA**.
This error is caused because this user lack sufficient permissions at the
subscription level.
The need to be able to **list all the storage accounts in the subscription**.

---

### References:

[Azure Storage Explorer troubleshooting guide](https://learn.microsoft.com/en-us/troubleshoot/azure/azure-storage/storage-explorer-troubleshooting?tabs=Windows)   

---

## Q57:

A company is in the process of migrating its resources from on-prem to Azure.

The Marketing team needs to migrate 15 GB of data 
from a file server to premium file storage.

They need to use a tool with a friendly GUI.

You must deploy a tool that support both: 
- the types of migration
- the requirements from the Marketing team

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

The following are obviously unsuitable:
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

> Scenarios:

- Onetime migration - when a large amount of on-premises data is moved to Azure.
Moving a media library from offline tapes into Azure to create an online media library.
Migrating your VM farm, SQL server, and applications to Azure.
Moving historical data to Azure for in-depth analysis and reporting using HDInsight.

- Initial bulk transfer
when an initial bulk transfer is done using Data Box (seed) followed by incremental transfers over the network.

For example, backup solutions partners such as Commvault and Data Box are used to move initial large historical backup to Azure. Once complete, the incremental data is transferred via network to Microsoft Azure Storage.

- Periodic uploads
when large amount of data is generated periodically and needs to be moved to Azure. 
For example in energy exploration, where video content is generated on oil rigs and windmill farms.

---

## Q56:

Your organization hosts resources as IaaS Azure and on-premise.
You have an existig **Azure File Network File System v4.1 (NFSv4.1)** share.
This uses LRS.

The company wants to inprove redundancy of the file share and has asked
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

An organization is in the process of migrating its reources in Azure from on-premise.
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

In one of the previous questions it is discussed that the following
are the authorization method that are supported with AzCopy to copy
blobs to a Blob Storage:
- Microsoft Entra ID
- SAS

All the remaining options for authorization are not supported with AzCopy:
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

**GPv1** would not be suitable here as it does not support storage tiers.

`-sku Standard_GRS`:
copies your data synchronously three times 
**within a single physical location in the primary region**. 
It then copies your data asynchronously to a single physical location in the secondary region. 
Within the secondary region, your data is copied synchronously three times.

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
You must ensure that Azure SA features are configured to support object replication.
Minimize admin effort.

Change Feed: OPTIONS
Blob versioning: OPTIONS

OPTIONS:
Destination account only
source account only
source & destination account 

---

### Answer:

Change Feed: source account only
Blob versioning: source & destination account

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

> Blob versioning: source & destination account

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
for the region.

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
It then copies your data asynchronously to a single physical location in the secondary region. 
Within the secondary region, your data is copied synchronously three times.

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

Your company uses Microsoft Entra ID and Azure File Shares.
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

The **ME-Connect Cloud** is provided as an agent that can be installed from the **Microsoft Entra Admin Center**.

This set-up allows users from the on-prem environments who do not have line-of-sight to domain
controllers from **Microsoft hybrid joined** and **Micorsoft Entra-joined** VMs to access
Azure File Shares over the internet.

The remaining options do not apply:

- use on-prem Active Domain Services (AD DS) authentication

This option DOES NOT ALLOW:
- authentication for hybrid identities
- users to access Azure File Share over the internet who do not have line-of-sight to domain controllers (Microsoft Entra Hybrid joined & Microsoft Entra-joined VMs)

- use Microsoft Entra Domain Service authentication:
This is not a viable option because it requires line-of-sight to domain controllers 
(Microsoft Entra Hybrid joined & Microsoft Entra-joined VMs) 

- use Active Directory (AD) Kerberos authentication for Linux clients using on-prem AD DS or Micorsoft Entra DS
Linux client can use Kerberos based auth but require line-of-sight to domain controllers 
(Microsoft Entra Hybrid joined & Microsoft Entra-joined VMs) 

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
You are using SAS to configure control over the SA.

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
key=$(az storage account keys list --resource-group rg1 --account-name storage1 OPTIONS-1)
az webapp config appsettings set --resource-group rg1 --name app1 --settings STORAGE_ACCOUNT_KEY=$key

az storage account keys renew --resource-group rg1 - --account-name storage1 OPTIONS-2

key=$(az storage account keys list --resource-group rg1 --account-name storage1 OPTIONS-3)
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
key=$(az storage account keys list --resource-group rg1 --account-name storage1 query[1].value)

# swap the key1 with key2 in the app 
az webapp config appsettings set --resource-group rg1 --name app1 --settings STORAGE_ACCOUNT_KEY=$key

# regenerate key1
az storage account keys renew --resource-group rg1 - --account-name storage1 --key primary

# take the new key1 that you have jusr regenerated
key=$(az storage account keys list --resource-group rg1 --account-name storage1 query[0].value)

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
that contains archival reports from past corporate board meetings.


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
- Generate a SAS token for the report and share the URL with the board member
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
You ask the developers to use SAS when accessing info on the SA.
Yo must make the required configurations on the SA to follow security best 
practices and enable access to the SA with immediate effect.

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
`-Bypass  Logging, Metrics`: is used to allow logging and metrics of the SA to be collected in Azure.

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
this is used to update supported params for the MG.

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

After the migration you find that all the Azure Role Assignments for 
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
is used to perform the migration.

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

You find that the Azure Policies you create do not work with your subscription.

What is the cause of the problem?
 
- you lack the relevant role assignment to manage Azure Policy
- the version of tht Azure CLI: it must be updated
- you do niot have relevant access to the subscription
- you have not resistered the Azure Policy Insights Resource Provider

---

### Answer:
- you have not registered the Azure Policy Insights Resource Provider

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

The owner of the development subscription within the tenant
wants to block anyone from deleting ther `devtest-rg` an any 
of its resources,**without having to add any type of resource lock**
**at subscriotion level**.

You must recommend a solution to facilitate this requirement.
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

Refer to previous questions and answers for the details.

---

### References:

---

## Q35:

a company hosts resources in Azure and Microsoft 365.
A storage account was recently created for the Marketing department
but it was not picked in the monthly usage report.
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
You need to enable **hierarchy protection** so that only admins can create 
managemnent groups.

You need to create a JSON script to set the relevant permission levels
to ensure that standard users are no longer allowed to create MGs.

Which ooperation do you need to set in your JSON file to meet the goal?

- Microsoft.Management/managementGroups/delete
- Microsoft.Management/managementGroups/subscription/write
- Microsoft.Management/managementGroups/read
- Microsoft.Management/managementGroups/write

---

### Answer:
`Microsoft.Management/managementGroups/write` 
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

You need to minimize costs related to the three Azure VMs.

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
In contrast, the **Windows Standard License** allow to run a VM each either on-prem or Azure. (?)

The remanining options do not apply:

- configure Reserved Instances for the VMs
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
All team members that use the subscription have contributor access 
at the subscription level and are allowed to manage resources for all projects.

The `company1-network-rg` contains all the network resources such as
VNets, NSGs, DNS Zones, Route Tables.

As the need arises, network admins add new DNS entries and routes 
and create additional subnets and NSGs.

You must ensure that no security member, including network admins can
delete any resources hosted in `company1-network-rg`.
The solution must provide minimal ongoing admin effort.

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
Obviously, this is not maintanable!

---

### References:


---

## Q31:

You develop a policy that will deny the creation of any resource that 
does not have an environment tag with a value of either dev, qa, prod.

You must ensure that only resources that support tagging are subject 
to this policy.

Complete the JSON policy template.

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
          "OPTIONS-3": "{dev, qa, prod}"
          
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
          "notIn": "{dev, qa, prod}"         
          
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

Tags on a resource are an array of objects with each having a name and a value.

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
They report that they get the error message in the exhibit when they try to browse
the contents of the SA.

You must resolve the issue.
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

The user process for the the **Microsoft Storage Explorer Desktop App** needs to read 
the access keys of the SA before listing the contents of the containers in it. 
The access keys of the SA provide write access to all data in the SA and there is no 
read only access key in the SA and in order to perform the listing of the contents of
the SA the user needs **read-write** permission.

A ReadOnly lock as well as only the Read role assigned to users in the SAs would prevent
the enforcement of the required **read-write** permission.

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
Your manager would like the following points implemented in order to prevent this
type of incident in the future.

- no resources can be deleted by accident
- all resource types should work correctly after implementing the resource lock
- any new resource that is added to the subscription should be protected against deletion
- the solution should require the least admin affort

What should you do?

- configure a read-only lock on TST01-rg and TST02-rg
- configure a delete lock on TST01-rg and TST02-rg
- configure a read-only lock on the subscription
- configure a delete lock on the subscription

---

### Answer:
- configure a delete lock on the subscription

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
Depending on the resource **read-only** locks **may lead to uunpredictable outcomes**.
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

You must ensure that other administrators make no changes to the VM
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

The soltions based on RBAC require more admin effort before and after the capture
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
- define and deploy an Azure Automation Desired State Configuration (DCS)


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

You plan to use **Azure Cloud Shell** to add another tag to RG1
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

 A **ReadOnly lock** on an **SQL Database logical server**, protects it from deletions or modifications. 
 It allows you to create, update, or delete data in the server database. 
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

---

## Q24:

You deploy an application in a RG named App-RG01 in your subscription.

App-RG01 contains the following components:

- two App Services each with a free App Service managed SSL certificate
- a peered VNet
- Redis cache deployed in the VNet
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
the destination RG and a new free certificate can be configured with the App Service.

- you can move the ALB only within the same subscription
No
A **Satndard Load Balancer** cannot be moved einther within or outside the subscription.
The ALB must be recreated and re-configured.

- you need to disable the peer before movinng the VNet
Yes
The peering **must be disabled before the Vnet moving to the destination RG**.
When a VNet is moved to a new RG then all its contanied VMs and other resources
must be moved as well.

- you can move the VNet within the same subscription
Yes
You **can move a VNet within the same subscription**.
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
Your solution must minimize admin effort.

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
therefore the accounting departemnt does not have access to this blade in the Portal! 
This could have been the simplest solution but it is not applicable here.

- instruct the accounting department to use Azure Accounting Center

[How Cost Management and Billing relate](https://learn.microsoft.com/en-us/azure/cost-management-billing/cost-management-billing-overview#how-cost-management-and-billing-relate)  

> **Cost Management**: 
is a set of FinOps tools that enable you to analyze, manage, and optimize your costs. 
Cost Management is available from within the Billing experience.

> **Billing**: 
provides all the tools you need to manage your billing account and pay invoices.

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
$r.Tags.Add("Dept","IT")
Set-AzResource -Tag $r.Tags -ResourceId $r.ResourceId -Force
```

> The `Set-AzResource` override any existing tags on the resource!

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
whether the policy should or should not be evaluated.

The order fo evaluation is:

> Disable Effect > Append Effect > Deny Effect > Audit Effect

[Disabled](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/effects#disabled)
This effect is useful for testing situations or for when the policy definition has parameterized the effect.
This flexibility makes it possible to disable a single assignment instead of disabling all of that policy's assignments.
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

## Q20:

You have been tasked with assigning RBAC roles to users in your company.

You try to interpret access assignments for UserA.
You want to validate the role assignments for UserA scoped to 
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

```
az role assignment list --include-goups \
--assignee UserA@myorg.com \
--output json \
--query `[].{principalName: principalName, roleDefinitionName: roleDefinitionName, scope: scope}` 
```

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

In this case the `-ResourceGroupNane medicine-sales` specifies the RG sope.

- the roles lets you manage VMs, but not manage access to Virtual Network or the Storage Account
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
The cloud engineer needs to manage other engineers' 
access to Azure resources.
You must follow the principle of least privilege.

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
This is a **Microsoft Entra ID Administrator Role** and **does not** control access to any resource on a scope (subscription). 
This roles grants permissions to manage users on the MEID tenant that is associated to the subscription.

---

### Reeferences:

[Azure roles, Microsoft Entra roles, and classic subscription administrator roles](https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles)   

---

## Q16: 

Your organization uses **Micorsoft Entra ID Governance**.
You are the Azure Administrator in the organization.

You use **Microsoft Graph Powershell** to provide and manage 
identity and access lifecycle at a scale for all users and 
groups within the organization.

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
**Since the users and group already exist**, you need to initiate the process by getting the catalog identifier.

An **Access Package** is a collection of resources that is **governed by policies**.

**Access Packages** are defined in a container called **Catalogs**.

> You will require the ID of the (General) Catalog.

```
Get-MgBetaEnitelmentManagementAccessPackageCatalog -Filter "DisplayName eq 'General'" | Format-List
```

- step1:  retrieve the catalog identifier

The remaining options do not apply as these are the following steps in the same workflow:

- step2: add the sales group to the catalog
- step3: retrieve the catalog resources 
- step4: retrieve the resource roles assigned to the catalog

The **AP** assigns users to the roles of resources.
When the type of the resource in the **AP** is a (security) group then the roles that can be assigned are **Administrator Role** or **Member Role**. 
In this example the role to be assigned to the users that request the **AP** is the **Member Role** for the security group Sales. 

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
You may not know who in the other organization needs access to your organization's resources, and they won't know what applications, groups, or sites your organization is using.

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

An access package enables you to do a **one-time setup of resources and policies** that **automatically** administers access for the life of the access package. 

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

For example, you might have a catalog owner who manages all the marketing resources that can be requested. In this case, you could have a marketing catalog.

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

Policies specify:

1. who can request the access package
2. the approval and lifecycle settings
3. OR how access is automatically assigned

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

- change the hidden setting
- add or remove resource roles
- and add additional policies

---

## Q15: 

Your company has a **Microsoft Entra ID Governance** subscription.

You are assigning licenses to individual users using **group-based lisencing** in MEID.

You use **Microsoft Graph Powershell** cmdlets.
Your PowerShell script fails with a **MutuallyExclusiveViolation** error.

You need to troubleshoot the issue.
What is the underlying cause for this issue?

1. There are not enough available licences for one of the products specified in the group.

2. One of the products specified in the group contains a service plan that conflicts with another service plan that is already assigned to the user via a different product.

3. One of the products specified in the group is not available in all locations because of local laws and regulations.

4. One of the products specified in the group contains a service plan that must be enabled for another service plan, in another product, to function.

---

### Answer: 
2. One of the products specified in the group contains a service plan that conflicts with another service plan that is already assigned to the user via a different product.

> using **group-based lisencing** in MEID
> assigning licenses to individual users using **group-based lisencing** in MEID.

The underlying cause for a **MutuallyExclusiveViolation** error is that a product that is specified in a group to be assigned to the user contains a service plan that is in conflict with the sevice plan for the same product already assigned to a user via another product that has alredy been assigned 
to the user.

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

A report from the support team shows that a large number of tickets have been raised concerning users who ask for their passowrds to be changed. 
The organization decides to enable **self-service password reset (SSPR)** in order to reduce the number of support tickets.

You enable **SSPR** via the Azure Portal and assign it to the **All Users security group**. However, tickets are still being raised by users located 
in the London office.

You need to find out what causes SSPR not to work for users located 
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
changes their password it will be updated in their on-prem AD.
**By default Microsoft Connect** syncronizes password in one direction only:
from the on-prem AD to MEID.

You must enable password writeback to allow the update of the password
in MEID from the on-prem AD, as well.

The **All Users group** contains:

- cloud-only members
- directory synchronized members (hybrid users)
- guest users

This group is automaticall created in MEID and it is one of the 
default groups to which users within the tenant are added when they are created.

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

You deploy an Azure Web App named My App.
MyApp runs in a Free Tier Service Plan named MyPlan.

During testing you discover that MyApp stops after 60 mins and
it cannot be restarted until the following day.

You need to ensure that MyApp can run at eight hours each day during testing period.
You want to keep the additional cost to a minimum.


---

### Q4A:

Solution:
You change the Pricing Tier for MyPlan to Shared D1.

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
| subnet2 | 10.0.1.0/24    |  VM5, VM6          |
| subnet3 | 10.0.4.0/24    |  Container group MyCon01  |

The company deploys a **new Azure Container Group** on VNet1.
The Container instances need to communicate with VM5 and VM6.

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

It is not possible to deploy a Azure Container Group to a subnet
that already contains resources!
In this case subnet2 has already VM5 and VM6.

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
Connections to WebApp1 must be spread across all the VMs.
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
This includes the creation of a **zone-redundant standard IP address**.
The **zone-redundant standard IP address** will be replicated across the 
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

Importantly, when the VMs are deployed to the same **availability set** 
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

In this scenario, the traffic must be balanced over the VMs in the same VNet
which can only span a single region, therefore **Azure Front Door** would be 
useless in this scenario.

In order to load balance over the VMs located in the same VNet the following
would be suitable:
- an ALB
- an application Gateway

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
The new VMs should be **based upon** VM1's configuration.


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
You can access the underlying template from the Export Template settings blade of the VM resource
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