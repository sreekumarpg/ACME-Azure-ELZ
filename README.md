# Azure Enterprise Scale Landing Zone


<img width="1024" alt="image" src="https://user-images.githubusercontent.com/22677711/162624801-4a5dcd8a-1c90-43db-b0ec-c4aa44fbb6a8.png">

<img width="1024" alt="image" src="https://user-images.githubusercontent.com/22677711/162624819-e9f36bb7-a0f9-4030-a878-e134de8232b8.png">


<img width="1024" alt="image" src="https://user-images.githubusercontent.com/22677711/162624834-f35c0fd0-3767-4e1d-90ac-4969a0e33c05.png">



# What will be deployed?

- A scalable Management Group hierarchy aligned to core platform capabilities, allowing you to operationalize at scale using centrally managed Azure Policy where platform and workloads have clear separation.
- Azure Policies that will enable autonomy for the platform and the landing zones.
- An Azure subscription dedicated for Management and Monitoring, which enables core platform capabilities at scale using Azure Policy such as:
   - A Log Analytics workspace and an Automation account
   - Diagnostics settings for Activity Logs, VMs, and PaaS resources sent to Log Analytics

- An Azure subscription dedicated for Identity in case your organization requires to have Active Directory Domain Controllers in a dedicated subscription
- Landing zone subscriptions for Production and  connected applications and resources, including a virtual network that will be connected to the hub via VNet peering
- Azure Policies for workload connected landing zones, which include:
   - Diagnostics settings for Activity Logs, VMs, and PaaS resources sent to Log Analytics
   - Enforce VM monitoring (Windows & Linux)
   - Enforce VMSS monitoring (Windows & Linux)
   - Enforce VM backup (Windows & Linux)
   - Enforce secure access (HTTPS) to storage accounts
   - Enforce auditing for Azure SQL
   - Enforce encryption for Azure SQL
   - Prevent IP forwarding
   - Prevent inbound RDP from internet
   - Ensure subnets are associated with NSG
   - Associate private endpoints with Azure Private DNS Zones for Azure PaaS services.


<img width="1024" alt="image" src="https://user-images.githubusercontent.com/22677711/162624850-c9fd513a-1e7b-4c5e-bb36-eefad3c8047b.png">
