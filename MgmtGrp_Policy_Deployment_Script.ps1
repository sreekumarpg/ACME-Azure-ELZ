
$ParentManagementGroup = "SreeABC"
Set-Item Env:\SuppressAzurePowerShellBreakingChangeWarnings "true"
Write-Host "Script started. It will need around 30 minutes to complete................................" -ForegroundColor Red

# Deploying management group structure for Enterprise-Scale
#================================================================


New-AzManagementGroup -GroupName $ParentManagementGroup -DisplayName $ParentManagementGroup  | Out-null

$parentGroup = Get-AzManagementGroup -GroupName $ParentManagementGroup
New-AzManagementGroup -GroupName 'Platform' -ParentId $parentGroup.id | Out-null
New-AzManagementGroup -GroupName 'LandingZones' -ParentId $parentGroup.id | Out-null

$platformparentGroup = Get-AzManagementGroup -GroupName Platform
New-AzManagementGroup -GroupName 'Analytics' -ParentId $platformparentGroup.id  | Out-null
New-AzManagementGroup -GroupName 'NetworkHub' -ParentId $platformparentGroup.id  | Out-null
New-AzManagementGroup -GroupName 'Identity' -ParentId $platformparentGroup.id  | Out-null
New-AzManagementGroup -GroupName 'Shared' -ParentId $platformparentGroup.id  | Out-null

$lzparentGroup = Get-AzManagementGroup -GroupName LandingZones
New-AzManagementGroup -GroupName 'Production' -ParentId $lzparentGroup.id  | Out-null
New-AzManagementGroup -GroupName 'Development' -ParentId $lzparentGroup.id  | Out-null

Write-Host "Deployed management group structure for Enterprise-Scale" -ForegroundColor White