
$Subgroup = "Sreetest"

Write-Host "Policy Creation started................................." -ForegroundColor Red

New-AzPolicyDefinition -Name 'PolicyDef1' -ManagementGroupName $Subgroup -Policy ./Policy/Firewall_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for Firewall to Log Analytics workspace"
New-AzPolicyDefinition -Name 'PolicyDef2' -ManagementGroupName $Subgroup -Policy ./Policy/LB_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for Load Balancer to Log Analytics workspace"
New-AzPolicyDefinition -Name 'PolicyDef3' -ManagementGroupName $Subgroup -Policy ./Policy/NIC_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for Network Interfaces to Log Analytics workspace"
New-AzPolicyDefinition -Name 'PolicyDef4' -ManagementGroupName $Subgroup -Policy ./Policy/NSG_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for Network Security Groups to Log Analytics workspace"
New-AzPolicyDefinition -Name 'PolicyDef5' -ManagementGroupName $Subgroup -Policy ./Policy/VMScaleset_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for Virtual Machine Scale Sets to Log Analytics workspace"
New-AzPolicyDefinition -Name 'PolicyDef6' -ManagementGroupName $Subgroup -Policy ./Policy/VM_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for Virtual Machines to Log Analytics workspace"
New-AzPolicyDefinition -Name 'PolicyDef7' -ManagementGroupName $Subgroup -Policy ./Policy/VNet_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for Virtual Network to Log Analytics workspace"
New-AzPolicyDefinition -Name 'PolicyDef8' -ManagementGroupName $Subgroup -Policy ./Policy/VPNGW_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for VPN Gateway to Log Analytics workspace"
New-AzPolicyDefinition -Name 'PolicyDef9' -ManagementGroupName $Subgroup -Policy ./Policy/WVD_App_group_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for WVD Application group to Log Analytics workspace"
New-AzPolicyDefinition -Name 'PolicyDef10' -ManagementGroupName $Subgroup -Policy ./Policy/WVD_Host_Pools_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for WVD Host Pools to Log Analytics workspace"
New-AzPolicyDefinition -Name 'PolicyDef11' -ManagementGroupName $Subgroup -Policy ./Policy/WVD_Workspace_to_LAW.json | Out-null
Write-Host "Deploy Diagnostic Settings for WVD Workspace to Log Analytics workspace"

Write-Host "Policy Creation Complaint................................." -ForegroundColor Red