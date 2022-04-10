
$Subgroup = "Sreetest"

Write-Host "Policy Creation started................................." -ForegroundColor Red

New-AzPolicyDefinition -Name 'Deploy-Diagnostics-Firewall' -ManagementGroupName $Subgroup -Policy ./policies/Firewall_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for Firewall to Log Analytics workspace"
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-LB' -ManagementGroupName $Subgroup -Policy ./policies/LB_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for Load Balancer to Log Analytics workspace"
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-NIC' -ManagementGroupName $Subgroup -Policy ./policies/NIC_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for Network Interfaces to Log Analytics workspace"
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-NSG' -ManagementGroupName $Subgroup -Policy ./policies/NSG_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for Network Security Groups to Log Analytics workspace"
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-VMScale' -ManagementGroupName $Subgroup -Policy ./policies/VMScaleset_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for Virtual Machine Scale Sets to Log Analytics workspace"
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-VM' -ManagementGroupName $Subgroup -Policy ./policies/VM_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for Virtual Machines to Log Analytics workspace"
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-VNet' -ManagementGroupName $Subgroup -Policy ./policies/VNet_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for Virtual Network to Log Analytics workspace"
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-VPNGW' -ManagementGroupName $Subgroup -Policy ./policies/VPNGW_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for VPN Gateway to Log Analytics workspace"
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-WVDAPP' -ManagementGroupName $Subgroup -Policy ./policies/WVD_App_group_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for WVD Application group to Log Analytics workspace"
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-WVDHost' -ManagementGroupName $Subgroup -Policy ./policies/WVD_Host_Pools_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for WVD Host Pools to Log Analytics workspace"
New-AzPolicyDefinition -Name 'Deploy-Diagnostics-WVDW' -ManagementGroupName $Subgroup -Policy ./policies/WVD_Workspace_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for WVD Workspace to Log Analytics workspace"

Write-Host "Policy Creation Complaint................................." -ForegroundColor Red


