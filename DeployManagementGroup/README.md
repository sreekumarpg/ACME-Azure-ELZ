# **Management Groups**

Management groups are a tool to help you structure your cloud environments for organization and governance at scale.

The following decisions have been made and included in the implementation for the management group structure.

![image](https://user-images.githubusercontent.com/22677711/164944869-e07dd0cb-284e-47ba-af70-b5a01a3fa8ee.png)

## Establish segmentation with management groups


|Management group   |Description   |
| ------------ | ------------ |
|Intermediate Root Management Group   | This management group is located directly under the tenant root group. Created with a prefix provided by the organization, which purposely avoids the usage of the root group so that organizations can move existing Azure subscriptions into the hierarchy. It also enables future scenarios.
| **Platform**  |  This management group contains all the platform child management groups
| Defense  | This management group contains a dedicated subscription for management, monitoring, and security. This subscription will host an Azure Log Analytics workspace, including associated solutions.
|NetworkHub   | This management group contains a dedicated subscription for connectivity. This subscription will host the Azure networking resources required for the platform, like Network Virtual Appliance, Azure Firewall
|  Identity | This management group contains a dedicated subscription for identity. This subscription is a placeholder for Windows Server Active Directory Domain Services (AD DS) virtual machines (VMs) or Azure Active Directory Domain Services
| Shared | This management group contains a dedicated subscription for Infrastructure shared services like Antivirus , Patch Managment etc
| **Landing Zones**	| The parent management group for all the landing zone child management groups. It will have workload agnostic Azure policies assigned to ensure workloads are secure and compliant.
| Production | The dedicated management group for corporate landing zones. This group is for production workloads that require internet inbound/outbound connectivity or hybrid connectivity with the corporate network via the hub in the connectivity subscription.
| Development | The dedicated management group for corporate landing zones. This group is for Development workloads that require internet inbound/outbound connectivity or hybrid connectivity with the corporate network via the hub in the connectivity subscription.

##  **Deploy Management groups in Azure**

> [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsreekumarpg%2FACME-Azure-ELZ%2Fmain%2FDeployManagementGroup%2FARM_Deploy_Mgmt_Group.json) 


------------


![image](https://user-images.githubusercontent.com/22677711/164945844-9fe873ef-fb58-4502-bcd2-985301f49ea3.png)


