
$ParentManagementGroup = "Organization"
$SubParentManagementGroup1 = "Platform"
$SubParentManagementGroup2 = "LandingZones"

$PlatformGroup1 = "NetworkHub"
$PlatformGroup2 = "Identity"
$PlatformGroup3 = "Shared"
$PlatformGroup4 = "Defense"

$LandingZonesGroup1 = "Production"
$LandingZonesGroup2 = "Development"

Set-Item Env:\SuppressAzurePowerShellBreakingChangeWarnings "true"
Write-Host "Script started. It will need around 30 minutes to complete................................" -ForegroundColor Red

# Deploying management group structure for Enterprise-Scale
#================================================================

New-AzManagementGroup -GroupName $ParentManagementGroup -DisplayName $ParentManagementGroup  | Out-null

$parentGroup = Get-AzManagementGroup -GroupName $ParentManagementGroup
New-AzManagementGroup -GroupName $SubParentManagementGroup1 -ParentId $parentGroup.id | Out-null
New-AzManagementGroup -GroupName $SubParentManagementGroup2 -ParentId $parentGroup.id | Out-null

$platformparentGroup = Get-AzManagementGroup -GroupName $SubParentManagementGroup1
New-AzManagementGroup -GroupName $PlatformGroup1 -ParentId $platformparentGroup.id  | Out-null
New-AzManagementGroup -GroupName $PlatformGroup2 -ParentId $platformparentGroup.id  | Out-null
New-AzManagementGroup -GroupName $PlatformGroup3 -ParentId $platformparentGroup.id  | Out-null
New-AzManagementGroup -GroupName $PlatformGroup4 -ParentId $platformparentGroup.id  | Out-null

$lzparentGroup = Get-AzManagementGroup -GroupName $SubParentManagementGroup2
New-AzManagementGroup -GroupName $LandingZonesGroup1 -ParentId $lzparentGroup.id  | Out-null
New-AzManagementGroup -GroupName $LandingZonesGroup2 -ParentId $lzparentGroup.id  | Out-null

Write-Host "Deployed management group structure for Enterprise-Scale" -ForegroundColor Green