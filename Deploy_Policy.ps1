$Subgroup = "Organization"
Write-Host "Policy Creation started................................." -ForegroundColor Red

New-AzPolicyDefinition -Name 'Deploy-Diagnostics-ApplicationGateway' -ManagementGroupName $Subgroup -Policy ./policies/ApplicationGateway-to-LA.json | Out-null
New-AzPolicyDefinition -Name 'AppService-latestTLS' -ManagementGroupName $Subgroup -Policy ./policies/AppService-latestTLS.json | Out-null
New-AzPolicyDefinition -Name 'Azure_Storage_enforce_SSL' -ManagementGroupName $Subgroup -Policy ./policies/Azure_Storage_enforce_SSL.json | Out-null
New-AzPolicyDefinition -Name 'AppGW-Without-WAF' -ManagementGroupName $Subgroup -Policy ./policies/Deny-AppGW-Without-WAF.json | Out-null
New-AzPolicyDefinition -Name 'Deny-AppServiceApiApp-http' -ManagementGroupName $Subgroup -Policy ./policies/Deny-AppServiceApiApp-http.json | Out-null
New-AzPolicyDefinition -Name 'Deny-AppServiceWebApp-http' -ManagementGroupName $Subgroup -Policy ./policies/Deny-AppServiceWebApp-http.json | Out-null
New-AzPolicyDefinition -Name 'Deny-PublicIP' -ManagementGroupName $Subgroup -Policy ./policies/Deny-PublicIP.json | Out-null
New-AzPolicyDefinition -Name 'Deny-RDP-From-Internet' -ManagementGroupName $Subgroup -Policy ./policies/Deny-RDP-From-Internet.json | Out-null
New-AzPolicyDefinition -Name 'Deny-Storage-minTLS' -ManagementGroupName $Subgroup -Policy ./policies/Deny-Storage-minTLS.json | Out-null
New-AzPolicyDefinition -Name 'Deny-Subnet-Without-Nsg' -ManagementGroupName $Subgroup -Policy ./policies/Deny-Subnet-Without-Nsg.json | Out-null
New-AzPolicyDefinition -Name 'Deny-Subnet-Without-Udr' -ManagementGroupName $Subgroup -Policy ./policies/Deny-Subnet-Without-Udr.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-Budget' -ManagementGroupName $Subgroup -Policy ./policies/Deploy-Budget.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-FlowLogs' -ManagementGroupName $Subgroup -Policy ./policies/Deploy-Nsg-FlowLogs.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-ExpressRoute' -ManagementGroupName $Subgroup -Policy ./policies/ExpressRoute-to-LA.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-Firewall' -ManagementGroupName $Subgroup -Policy ./policies/Firewall-to-LA.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-Function' -ManagementGroupName $Subgroup -Policy ./policies/Function-to-LA.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-FunctionApp' -ManagementGroupName $Subgroup -Policy ./policies/FunctionApp-http.json | Out-null
New-AzPolicyDefinition -Name 'KV-SoftDelete' -ManagementGroupName $Subgroup -Policy ./policies/KV-SoftDelete.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-LoadBalancer' -ManagementGroupName $Subgroup -Policy ./policies/LoadBalancer-to-LA.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-NetworkSecurityGroups' -ManagementGroupName $Subgroup -Policy ./policies/NetworkSecurityGroups-to-LA.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-NIC' -ManagementGroupName $Subgroup -Policy ./policies/NIC-to-LA.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-Nsg-FlowLogs' -ManagementGroupName $Subgroup -Policy ./policies/Nsg-FlowLogs-to-LA.json | Out-null
New-AzPolicyDefinition -Name 'policyAppService-httpsonly' -ManagementGroupName $Subgroup -Policy ./policies/policyAppService-httpsonly.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-TrafficManager' -ManagementGroupName $Subgroup -Policy ./policies/TrafficManager-to-LA.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-VirtualNetwork' -ManagementGroupName $Subgroup -Policy ./policies/VirtualNetwork-to-LA.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-VM' -ManagementGroupName $Subgroup -Policy ./policies/VM-to-LA.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-VMSS' -ManagementGroupName $Subgroup -Policy ./policies/VMSS-to-LA.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-VNetGW' -ManagementGroupName $Subgroup -Policy ./policies/VNetGW-to-LA.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-WVDAppGroup' -ManagementGroupName $Subgroup -Policy ./policies/WVDAppGroup-to-LA.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-WVDHostPools' -ManagementGroupName $Subgroup -Policy ./policies/WVDHostPools-to-LA.json | Out-null
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-WVDWorkspace' -ManagementGroupName $Subgroup -Policy ./policies/WVDWorkspace-to-LA.json | Out-null

Write-Host "Policy Creation Completed................................." -ForegroundColor Green