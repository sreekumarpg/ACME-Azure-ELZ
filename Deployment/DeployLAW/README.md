# **Log Analytics Workspace and Solutions**

Deploys Azure Log Analytics Workspace, Automation Account (linked together) & multiple Solutions deploy to the Log Analytics Workspace to an existing Resource Group.

Automation Account will be linked to Log Analytics Workspace to provide integration for Update Management, Change Tracking and Inventory, and Start/Stop VMs during off-hours for your servers and virtual machines. Only one mapping can exist between Log Analytics Workspace and Automation Account.

The module will deploy the following Log Analytics Workspace solutions by default.
