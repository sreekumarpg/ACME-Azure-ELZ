# **Landing Zone VNet Deployments**

Network topology is a critical element of the landing zone architecture because it defines how applications can communicate with each other. Azure virtual network enables Azure resources to securely communicate with each other, the internet, and on-premises networks.

## **Azure Landing Zone Network Topology**
<img width="700" alt="image" src="https://user-images.githubusercontent.com/22677711/165087743-9162d142-cace-425b-8e31-7bb5a5bd9335.png">



# **Virtual Network Deployments**

|Virtual Network   |Description   |  ARM |
| ------------ | ------------ | ------------ |
|NetworkHub   | Module deploys the following resources <ul><li>Virtual Network (VNet)</li><li>Subnets</li><li>Network Security Group</li><li>Network Security Group Rules</li><li>Route Table</li></ul>  |  [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsreekumarpg%2FACME-Azure-ELZ%2Fmain%2FDeployment%2FDeployELZ%2FDeploy_Defense_VNet.json) |
|Identity   | Module deploys the following resources <ul><li>Virtual Network (VNet)</li><li>Subnets</li><li>Network Security Group</li><li>Network Security Group Rules</li><li>Route Table</li></ul>  |  [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fgithub.com%2Fsreekumarpg%2FACME-Azure-ELZ%2Fblob%2Fmain%2FDeployment%2FDeployELZ%2FDeploy_Identiity_VNet.json) |
|Shared   | Module deploys the following resources <ul><li>Virtual Network (VNet)</li><li>Subnets</li><li>Network Security Group</li><li>Network Security Group Rules</li><li>Route Table</li></ul>  |  [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fgithub.com%2Fsreekumarpg%2FACME-Azure-ELZ%2Fblob%2Fmain%2FDeployment%2FDeployELZ%2FDeploy_Shared_VNet.json) |
|Defense   | Module deploys the following resources <ul><li>Virtual Network (VNet)</li><li>Subnets</li><li>Network Security Group</li><li>Network Security Group Rules</li><li>Route Table</li></ul>  |  [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fgithub.com%2Fsreekumarpg%2FACME-Azure-ELZ%2Fblob%2Fmain%2FDeployment%2FDeployELZ%2FDeploy_Defense_VNet.json) |

































------------


<img width="25" alt="image" src="https://user-images.githubusercontent.com/22677711/165051860-c4c594fe-719e-4ba8-8987-fc574482d456.png">[Back to Deployment Flow](https://github.com/sreekumarpg/ACME-Azure-ELZ/blob/main/Deployment/Readme.md)
