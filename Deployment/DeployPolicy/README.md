
# **Azure Policy**

Azure Policy helps to enforce organizational standards and to assess compliance at-scale. It also helps to bring your resources to compliance through bulk remediation for existing resources and automatic remediation for new resources.

Common use cases for Azure Policy include implementing governance for resource consistency, regulatory compliance, security, cost, and management. 

The Azure landing zones reference implementations use DINE Azure policies to help you achieve policy-driven governance within your Azure environment. 

### **Policy-driven governance**
Use Azure Policy to provide guardrails and ensure continued compliance with your organizations platform and the applications deployed onto it. Azure Policy also provides application owners with independence and a secure, unhindered path to the cloud.

Azure Policy and deployIfNotExist enables the autonomy in the platform, and reduces the operational burden as you scale your deployments and subscriptions in the Enterprise-Scale architecture. The primary purpose is to ensure that subscriptions and resources are compliant.

![image](https://user-images.githubusercontent.com/22677711/164946452-1edf010f-81d6-44be-8f60-41bdb29bf2ab.png)


### **Custom Policy Definitions**

This module deploys the custom Azure Policy Definitions & Initiatives supplied by the Azure Landing Zones conceptual architecture and reference implementation defined in Cloud Adoption Framework to the specified Management Group.

Once you have deployed this module to add all of the custom ALZ Azure Policy Definitions & Initiatives you will need to assign the modules to the relevant Management Groups as per your requirements

|Name  | Description  | Effect(s)  | Assignment scope  |
| ------------ | ------------ | ------------ | ------------ |
|AppService append enable https only setting to enforce https setting   | Appends the AppService sites object to ensure that HTTPS only is enabled for server/service authentication and protects data in transit from network layer eavesdropping attacks  | append, disabled  | Landing Zones Management Group  |
| KeyVault SoftDelete should be enabled  | Ensures that Key Vaults are created with soft-delete enabled  | deny, audit, disabled  |Intermediate Root Management Group   |
| Application Gateway should be deployed with WAF enabled  | Denies creation of Application Gateways when WAF is not enabled | deny, audit, disable  |Landing Zones Management Group   |
| API App should only be accessible over HTTPS | Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks  | deny, audit, disabled  | Landing Zone Management Group  |
| Function App should only be accessible over HTTPS  | Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks  | deny, audit, disabled  | Landing Zones Management Group  |
| Web Application should only be accessible over HTTPS  |Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks  | deny, audit, disabled  | Landing Zones Management Group |
|Deny creation of Public IP Addresses   | Denies creation of public IP addresses  |deny, audit, disabled   |Corp Management Group   |
| RDP access from the Internet should be blocked  |  Denies any network security rule that allows RDP access from Internet |deny, audit, disabled   |Landing Zones Management Group, Identity Management Group   |
|Subnets should have a Network Security Group   | Denies the creation of a subnet that is not associated with a Network Security Group  |deny, audit, disabled   |Landing Zones Management Group   |
|Deploy Diagnostics settings for Application Gateway to Log Analytics workspace   |Deploys the diagnostics settings for Application Gateways, and connects to a Log Analytics workspace   | eployIfNotExists, disabled  |Intermediate root Management Group  |
|Deploy Diagnostics settings for ExpressRoute to Log Analytics workspace   | Deploys the diagnostics settings for ExpressRoute, and connects to a Log Analytics workspace  | deployIfNotExists, disabled  | Intermediate root Management Group  |
|Deploy Azure Firewall Manager policy in a subscription   | Deploys the Azure Firewall Manager policy in an Azure subscription  | deployIfNotExists, disabled  |Intermediate root Management Group   |
|Deploy Diagnostics settings for Load Balancer to Log Analytics workspace   | Deploys the diagnostics settings for Load Balancers, and connects to a Log Analytics workspace  | deployIfNotExists, disabled  | Intermediate root Management Group  |
|Deploy Diagnostics settings for Network Security Groups to Log Analytics workspace   |Deploys the diagnostics settings for Network Security Groups, and connects to a Log Analytics workspace   |  deployIfNotExists, disabled | Intermediate root Management Group  |
|Deploy Diagnostics settings for Traffic Manager to Log Analytics workspace   | Deploys the diagnostics settings for Traffic Manager, and connects to a Log Analytics workspace  | deployIfNotExists, disabled  | Intermediate root Management Group  |
|Deploy Diagnostics settings for Virtual Network to Log Analytics workspace   | Deploys the diagnostics settings for Virtual Networks, and connects to a Log Analytics workspace  | deployIfNotExists, disabled  | Intermediate root Management Group  |
|Deploy Diagnostics settings for Virtual Machines to Log Analytics workspace   |Deploys the diagnostics settings for Virtual Machines, and connects to a Log Analytics workspace   |deployIfNotExists, disabled   | Intermediate root Management Group  |
|Deploy Diagnostics settings for Virtual Machine Scale Sets to Log Analytics workspace   |Deploys the diagnostics settings for Virtual Machine Scale sets, and connects to a Log Analytics workspace   |deployIfNotExists, disabled   |Intermediate root Management Group   |
|Deploy Diagnostics settings for VPN Gateway to Log Analytics workspace   | Deploys the diagnostics settings for VPN Gateway, and connects to a Log Analytics workspace   |deployIfNotExists, disabled   |Intermediate root Management Group   |
|Deploy Diagnostics settings for WVD Workspace to Log Analytics workspace  | Deploys the diagnostics settings for Windows Virtual Desktop workspace, and connects to a Log Analytics workspace  | deployIfNotExists, disabled  | Intermediate root Management Group |
|Deploy Diagnostics settings for WVD Host Pools to Log Analytics workspace   |Deploys the diagnostics settings for Windows Virtual Desktop host pools, and connects to a Log Analytics workspace   |deployIfNotExists, disabled   |Intermediate root Management Group  |
| Deploy Diagnostics settings for WVD Application group to Log Analytics workspace  |Deploys the diagnostics settings for Windows Virtual Desktop application group, and connects to a Log Analytics workspace   |deployIfNotExists, disabled   |Intermediate root Management Group   |
| Deploy NSG flow logs and traffic analytics to Log Analytic  |  Deploys Network Security Group flow logs and enables traffic analytics to a Log Analytics workspace | deployIfNotExists, disabled  | Landing Zone Management Group  |
|Deploys NSG flow logs and traffic analytics   | Deploys Network Security Group flow logs and enables traffic analytics to a storage account  | deployIfNotExists, disabled  |Intermediate root Management Group   |
| Azure Storage deploy a specific min TLS version requirement and enforce SSL/HTTPS |Deploy a specific min TLS version requirement and enforce SSL on Azure Storage   |  deployIfNotExists, disabled | Landing Zone Management Group  | |

##  **Deploy Custom Policy Definitions in Azure**

> [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsreekumarpg%2FACME-Azure-ELZ%2Fmain%2FDeployment%2FDeployPolicy%2FARM_Deploy_policies.json)



------------



<img width="878" alt="image" src="https://user-images.githubusercontent.com/22677711/164946649-4296bc86-9b2a-441e-8780-f17b3d57c0fc.png">



------------


<img width="25" alt="image" src="https://user-images.githubusercontent.com/22677711/165051860-c4c594fe-719e-4ba8-8987-fc574482d456.png">[Back to Deployment Flow](https://github.com/sreekumarpg/ACME-Azure-ELZ/blob/main/Deployment/Readme.md)


