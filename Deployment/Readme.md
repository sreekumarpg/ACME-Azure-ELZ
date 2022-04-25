# **Azure Landing Zones - Deployment Flow**

This document outlines the prerequisites, dependencies and flow to help orchestrate an end-to-end Azure Landing Zone deployment. The orchestration templates 

## Prerequisites
1. Azure Active Directory Tenant.
2. Minimum 1 subscription. Subscription(s) are required when configuring Log Analytics Workspace & Hub Networking services. Each can be deployed in the same subscription or separate subscriptions based on deployment requirements.
3. Deployment Identity with Owner permission to the / root management group. 

![image](https://user-images.githubusercontent.com/22677711/165026415-e50989a2-3f27-417c-bce4-7bab2a598c95.png)

## Deployment Sequence


| Order  |  Module | Description  | Link |
| ------------ | ------------ | ------------ |------------ |
|1   | Management Groups  | Configures the management group hierarchy to support Azure Landing Zone reference implementation  |<img width="25" alt="image" src="https://user-images.githubusercontent.com/22677711/165051860-c4c594fe-719e-4ba8-8987-fc574482d456.png">[Go to Deployment](https://github.com/sreekumarpg/ACME-Azure-ELZ/tree/main/Deployment/DeployManagementGroup) |
|2   |Custom Policy Definitions   | Configures Custom Policy Definitions at the organization management group. |<img width="25" alt="image" src="https://user-images.githubusercontent.com/22677711/165051860-c4c594fe-719e-4ba8-8987-fc574482d456.png"> [Go to Deployment](https://github.com/sreekumarpg/ACME-Azure-ELZ/tree/main/Deployment/DeployPolicy) |
| 3  |  Logging & Sentinel | Configures a centrally managed Log Analytics Workspace, Automation Account and Sentinel in the Logging subscription.  |<img width="25" alt="image" src="https://user-images.githubusercontent.com/22677711/165051860-c4c594fe-719e-4ba8-8987-fc574482d456.png">[Go to Deployment](https://github.com/sreekumarpg/ACME-Azure-ELZ/tree/main/Deployment/DeployELZ)|
|4   | Landing Zone  |Creates Hub networking infrastructure with Azure Firewall to support Hub & Spoke network topology in the Connectivity subscription.Creates Spoke networking infrastructure with Virtual Network Peering to support Hub & Spoke network topology. Spoke subscriptions are used for deploying construction sets and workloads.  | <img width="25" alt="image" src="https://user-images.githubusercontent.com/22677711/165051860-c4c594fe-719e-4ba8-8987-fc574482d456.png">[Go to Deployment](https://github.com/sreekumarpg/ACME-Azure-ELZ/tree/main/Deployment/DeployELZ) |

