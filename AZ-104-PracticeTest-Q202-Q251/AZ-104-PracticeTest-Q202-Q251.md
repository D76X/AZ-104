# AZ-104 Practice Test 50 Questions

[Practice Assessment for Exam AZ-104: Microsoft Azure Administrator](https://learn.microsoft.com/en-us/credentials/certifications/azure-administrator/practice/assessment?assessment-type=practice&assessmentId=21&practice-assessment-type=certification)  

---

## Q20x:

---

### Answer:

---

### References:

---

## Q204:

---

### Answer:

---

### References:


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