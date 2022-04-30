# **Log Analytics Workspace and Solutions**

Deploys Azure Log Analytics Workspace, Automation Account (linked together) & multiple Solutions deploy to the Log Analytics Workspace to an existing Resource Group.

Automation Account will be linked to Log Analytics Workspace to provide integration for Update Management, Change Tracking and Inventory, and Start/Stop VMs during off-hours for your servers and virtual machines. Only one mapping can exist between Log Analytics Workspace and Automation Account.

The module will deploy the following Log Analytics Workspace solutions by default.
- AgentHealthAssessment
- AntiMalware
- AzureActivity
- ChangeTracking
- Security
- Updates
- VMInsights

![image](https://user-images.githubusercontent.com/22677711/166103611-0dda453b-00be-49d8-9375-9dc50b6e303c.png)

##  **Deploy Log Analytics Workspace**

> [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsreekumarpg%2FACME-Azure-ELZ%2Fmain%2FDeployment%2FDeployLAW%2FARM_logAnalyticsWorkspace.json)

##  **Deploy Log Analytics Workspace Solutions**

> [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsreekumarpg%2FACME-Azure-ELZ%2Fmain%2FDeployment%2FDeployLAW%2FARM_logAnalyticsSolutions.json)
