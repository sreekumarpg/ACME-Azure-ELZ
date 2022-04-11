$HubNetworkSubscriptionId="24808e41-2f86-4c15-b6ff-395a82be930d"
$IdentitySubscriptionId="24808e41-2f86-4c15-b6ff-395a82be930d"
$SharedSubscriptionId="24808e41-2f86-4c15-b6ff-395a82be930d"
$DefenseSubscriptionId="24808e41-2f86-4c15-b6ff-395a82be930d"

$location="uaenorth"
$loc = "uaen"

$HubNetworkResourcegroup="rg-hubnetwork-"+"$loc"+"-01"
$HubNetworkVNet="vnet-hubnetwork-"+"$loc"+"-01"
$HubNetworkAddressPrefix= "10.10.0.0/20"
$HubNetworkRouteTable= "rt-default-hubnetwork-"+"$loc"+"-01"
$HubNetworkSubnet1= "AzureFirewallSubnet"
$HubNetworkSubnet1Prefix= "10.10.1.0/26"
$HubNetworkSubnet2= "snet-hubnetwork-mgmt-01"
$HubNetworkSubnet2Prefix= "10.10.1.64/26"
$HubNetworkSubnet2NSG="nsg-snet-hubnetwork-mgmt-01"
$HubNetworkFirewallIP = "10.10.1.4"

$IdentityResourcegroup= "rg-identity-"+"$loc"+"-01"
$IdentityVNet="vnet-identity-"+"$loc"+"-01"
$IdentityAddressPrefix= "10.10.16.0/20"
$IdentityRouteTable= "rt-default-identity-"+"$loc"+"-01"
$IdentitySubnet1= "snet-identity-Identity-01"
$IdentitySubnet1Prefix= "10.10.16.0/24"
$IdentitySubnet1NSG="nsg-snet-identity-Identity-01"
$IdentitySubnet2= "snet-identity-app-01"
$IdentitySubnet2Prefix= "10.10.17.0/24"
$IdentitySubnet2NSG="nsg-snet-identity-app-01"

$SharedResourcegroup="rg-shared-"+"$loc"+"-01"
$SharedVNet="vnet-shared-"+"$loc"+"-01"
$SharedAddressPrefix= "10.10.32.0/20"
$SharedRouteTable= "rt-default-shared-"+"$loc"+"-01"
$SharedSubnet1= "snet-shared-shared-01"
$SharedSubnet1Prefix= "10.10.32.0/24"
$SharedSubnet1NSG="nsg-snet-shared-shared-01"
$SharedSubnet2= "snet-shared-app-01"
$SharedSubnet2Prefix= "10.10.33.0/24"
$SharedSubnet2NSG="nsg-snet-shared-app-01"

$DefenseResourcegroup="rg-defense-"+"$loc"+"-01"
$DefenseVNet="vnet-defense-"+"$loc"+"-01"
$DefenseAddressPrefix= "10.10.48.0/20"
$DefenseRouteTable= "rt-defense-"+"$loc"+"-01"
$DefenseSubnet1= "snet-defense-log-01"
$DefenseSubnet1Prefix= "10.10.48.0/24"
$DefenseSubnet1NSG="nsg-snet-defense-log-01"
$workspaceName = "law-defense-"+"$loc"+"-01"


Write-Host "Script started................................." -ForegroundColor Red
Set-Item Env:\SuppressAzurePowerShellBreakingChangeWarnings "true"

# Deploy Hub Network Virtual Network
#====================================l

Set-AzureRmContext -SubscriptionId $HubNetworkSubscriptionId | Out-null
#Create Resource Group
New-AzResourceGroup -Name $HubNetworkResourcegroup -Location $location | Out-null

#RouteTable
$Route = New-AzRouteConfig -Name "Route-to-FW" -AddressPrefix 0.0.0.0/0 -NextHopType VirtualAppliance -NextHopIpAddress $HubNetworkFirewallIP
$HubNetworkRoute =New-AzRouteTable -Name $HubNetworkRouteTable -ResourceGroupName $HubNetworkResourcegroup -Location $location -DisableBgpRoutePropagation -Route $Route

#Security Group
$rule1 = New-AzNetworkSecurityRuleConfig -Name Allow_All_Vnet_IN -Description "Allow Vnet Inbound" -Access Allow -Protocol "*" -Direction Inbound -Priority 100 -SourceAddressPrefix "*" -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange "*"
$rule2 = New-AzNetworkSecurityRuleConfig -Name Allow_All_Vnet_OUT -Description "Allow Vnet Outbound" -Access Allow -Protocol "*" -Direction Outbound -Priority 100 -SourceAddressPrefix "*" -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange "*"
$networkSecurityGroup2 = New-AzNetworkSecurityGroup -ResourceGroupName $HubNetworkResourcegroup -Location $location -Name $HubNetworkSubnet2NSG -SecurityRules $rule1, $rule2

#Create Virtual Network & attach route and NSG
$Subnet1 = New-AzVirtualNetworkSubnetConfig -Name $HubNetworkSubnet1 -AddressPrefix $HubNetworkSubnet1Prefix
$Subnet2 = New-AzVirtualNetworkSubnetConfig -Name $HubNetworkSubnet2 -AddressPrefix $HubNetworkSubnet2Prefix -NetworkSecurityGroup $networkSecurityGroup2 -RouteTable $HubNetworkRoute
New-AzVirtualNetwork -Name $HubNetworkVNet -ResourceGroupName $HubNetworkResourcegroup -Location $location -AddressPrefix $HubNetworkAddressPrefix -Subnet $Subnet1, $Subnet2 | Out-null
Write-Host "Completed the deployment of Hub Network Virtual Network" -ForegroundColor white


# Deploy Identity  Virtual Network
#====================================l
Set-AzureRmContext -SubscriptionId $IdentitySubscriptionId | Out-null
#Create Resource Group
New-AzResourceGroup -Name $IdentityResourcegroup -Location $location | Out-null


#RouteTable
$Route = New-AzRouteConfig -Name "Route-to-FW" -AddressPrefix 0.0.0.0/0 -NextHopType VirtualAppliance -NextHopIpAddress $HubNetworkFirewallIP
$IdentiityRoute =New-AzRouteTable -Name $IdentityRouteTable -ResourceGroupName $IdentityResourcegroup -Location $location -DisableBgpRoutePropagation -Route $Route

#Security Group
$rule1 = New-AzNetworkSecurityRuleConfig -Name Allow_All_Vnet_IN -Description "Allow Vnet Inbound" -Access Allow -Protocol "*" -Direction Inbound -Priority 100 -SourceAddressPrefix "*" -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange "*"
$rule2 = New-AzNetworkSecurityRuleConfig -Name Allow_All_Vnet_OUT -Description "Allow Vnet Outbound" -Access Allow -Protocol "*" -Direction Outbound -Priority 100 -SourceAddressPrefix "*" -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange "*"
$IdentitySecurityGroup1 = New-AzNetworkSecurityGroup -ResourceGroupName $IdentityResourcegroup -Location $location -Name $IdentitySubnet1NSG -SecurityRules $rule1, $rule2

$rule1 = New-AzNetworkSecurityRuleConfig -Name Allow_All_Vnet_IN -Description "Allow Vnet Inbound" -Access Allow -Protocol "*" -Direction Inbound -Priority 100 -SourceAddressPrefix "*" -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange "*"
$rule2 = New-AzNetworkSecurityRuleConfig -Name Allow_All_Vnet_OUT -Description "Allow Vnet Outbound" -Access Allow -Protocol "*" -Direction Outbound -Priority 100 -SourceAddressPrefix "*" -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange "*"
$IdentitySecurityGroup2 = New-AzNetworkSecurityGroup -ResourceGroupName $IdentityResourcegroup -Location $location -Name $IdentitySubnet2NSG -SecurityRules $rule1, $rule2

#Create Virtual Network & attach route and NSG
$Subnet1 = New-AzVirtualNetworkSubnetConfig -Name $IdentitySubnet1 -AddressPrefix $IdentitySubnet1Prefix -NetworkSecurityGroup $IdentitySecurityGroup1 -RouteTable $IdentiityRoute
$Subnet2 = New-AzVirtualNetworkSubnetConfig -Name $IdentitySubnet2 -AddressPrefix $IdentitySubnet2Prefix -NetworkSecurityGroup $IdentitySecurityGroup2 -RouteTable $IdentiityRoute
New-AzVirtualNetwork -Name $IdentityVNet -ResourceGroupName $IdentityResourcegroup -Location $location -AddressPrefix $IdentityAddressPrefix -Subnet $Subnet1, $Subnet2 | Out-null

Write-Host "Completed the deployment of Identity Virtual Network" -ForegroundColor yellow


# Deploy Shared Network Virtual Network
#====================================l

Set-AzureRmContext -SubscriptionId $SharedSubscriptionId | Out-null
#Create Resource Group
New-AzResourceGroup -Name $SharedResourcegroup -Location $location | Out-null

#RouteTable
$Route = New-AzRouteConfig -Name "Route-to-FW" -AddressPrefix 0.0.0.0/0 -NextHopType VirtualAppliance -NextHopIpAddress $HubNetworkFirewallIP
$SharedRoute =New-AzRouteTable -Name $SharedRouteTable -ResourceGroupName $SharedResourcegroup -Location $location -DisableBgpRoutePropagation -Route $Route

#Security Group
$rule1 = New-AzNetworkSecurityRuleConfig -Name Allow_All_Vnet_IN -Description "Allow Vnet Inbound" -Access Allow -Protocol "*" -Direction Inbound -Priority 100 -SourceAddressPrefix "*" -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange "*"
$rule2 = New-AzNetworkSecurityRuleConfig -Name Allow_All_Vnet_OUT -Description "Allow Vnet Outbound" -Access Allow -Protocol "*" -Direction Outbound -Priority 100 -SourceAddressPrefix "*" -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange "*"
$SharedSecurityGroup1 = New-AzNetworkSecurityGroup -ResourceGroupName $SharedResourcegroup -Location $location -Name $SharedSubnet1NSG -SecurityRules $rule1, $rule2

$rule1 = New-AzNetworkSecurityRuleConfig -Name Allow_All_Vnet_IN -Description "Allow Vnet Inbound" -Access Allow -Protocol "*" -Direction Inbound -Priority 100 -SourceAddressPrefix "*" -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange "*"
$rule2 = New-AzNetworkSecurityRuleConfig -Name Allow_All_Vnet_OUT -Description "Allow Vnet Outbound" -Access Allow -Protocol "*" -Direction Outbound -Priority 100 -SourceAddressPrefix "*" -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange "*"
$SharedSecurityGroup2 = New-AzNetworkSecurityGroup -ResourceGroupName $SharedResourcegroup -Location $location -Name $SharedSubnet2NSG -SecurityRules $rule1, $rule2

#Create Virtual Network & attach route and NSG
$Subnet1 = New-AzVirtualNetworkSubnetConfig -Name $SharedSubnet1 -AddressPrefix $SharedSubnet1Prefix -NetworkSecurityGroup $SharedSecurityGroup1 -RouteTable $SharedRoute
$Subnet2 = New-AzVirtualNetworkSubnetConfig -Name $SharedSubnet2 -AddressPrefix $SharedSubnet2Prefix -NetworkSecurityGroup $SharedSecurityGroup2 -RouteTable $SharedRoute
New-AzVirtualNetwork -Name $SharedVNet -ResourceGroupName $SharedResourcegroup -Location $location -AddressPrefix $SharedAddressPrefix -Subnet $Subnet1, $Subnet2 | Out-null

Write-Host "Completed the deployment of Shared Virtual Network" -ForegroundColor Magenta


# Deploy Defense Virtual Network
#====================================l

Set-AzureRmContext -SubscriptionId $DefenseSubscriptionId | Out-null
#Create Resource Group
New-AzResourceGroup -Name $DefenseResourcegroup -Location $location | Out-null

#RouteTable
$Route = New-AzRouteConfig -Name "Route-to-FW" -AddressPrefix 0.0.0.0/0 -NextHopType VirtualAppliance -NextHopIpAddress $HubNetworkFirewallIP
$DefenseRoute =New-AzRouteTable -Name $DefenseRouteTable -ResourceGroupName $DefenseResourcegroup -Location $location -DisableBgpRoutePropagation -Route $Route

#Security Group
$rule1 = New-AzNetworkSecurityRuleConfig -Name Allow_All_Vnet_IN -Description "Allow Vnet Inbound" -Access Allow -Protocol "*" -Direction Inbound -Priority 100 -SourceAddressPrefix "*" -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange "*"
$rule2 = New-AzNetworkSecurityRuleConfig -Name Allow_All_Vnet_OUT -Description "Allow Vnet Outbound" -Access Allow -Protocol "*" -Direction Outbound -Priority 100 -SourceAddressPrefix "*" -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange "*"
$DefenseecurityGroup1 = New-AzNetworkSecurityGroup -ResourceGroupName $DefenseResourcegroup -Location $location -Name $DefenseSubnet1NSG -SecurityRules $rule1, $rule2

#Create Virtual Network & attach route and NSG
$Subnet1 = New-AzVirtualNetworkSubnetConfig -Name $DefenseSubnet1 -AddressPrefix $DefenseSubnet1Prefix -NetworkSecurityGroup $DefenseecurityGroup1 -RouteTable $DefenseRoute
New-AzVirtualNetwork -Name $DefenseVNet -ResourceGroupName $DefenseResourcegroup -Location $location -AddressPrefix $DefenseAddressPrefix -Subnet $Subnet1 | Out-null

Write-Host "Completed the deployment of Shared Virtual Network" -ForegroundColor Cyan

# Deploy Log Analytic Workspace
#====================================l

New-AzOperationalInsightsWorkspace -Location $location -Name $workspaceName -Sku pergb2018 -ResourceGroupName $DefenseResourcegroup
Write-Host "Completed the deployment of Log Analytic Workspace" -ForegroundColor White


$workspace = Get-AzOperationalInsightsWorkspace -ResourceGroupName $DefenseResourcegroup -Name $workspaceName
Set-AzOperationalInsightsIntelligencePack -ResourceGroupName $DefenseResourcegroup -WorkspaceName $workspaceName -IntelligencePackName Updates -Enabled $true | Out-null
Write-Host "Added Update Management Solution to Log Analytic Workspace" -ForegroundColor White
Set-AzOperationalInsightsIntelligencePack -ResourceGroupName $DefenseResourcegroup -WorkspaceName $workspaceName -IntelligencePackName AzureActivity -Enabled $true | Out-null
Write-Host "Added Activity log analytics Solution to Log Analytic Workspace" -ForegroundColor White
Set-AzOperationalInsightsIntelligencePack -ResourceGroupName $DefenseResourcegroup -WorkspaceName $workspaceName -IntelligencePackName ChangeTracking -Enabled $true | Out-null
Write-Host "Added Change tracking and inventory Solution to Log Analytic Workspace" -ForegroundColor White
Set-AzOperationalInsightsIntelligencePack -ResourceGroupName $DefenseResourcegroup -WorkspaceName $workspaceName -IntelligencePackName VMInsights -Enabled $true | Out-null
Write-Host "Added Azure Monitor for VMs Solution to Log Analytic Workspace" -ForegroundColor White
Set-AzOperationalInsightsIntelligencePack -ResourceGroupName $DefenseResourcegroup -WorkspaceName $workspaceName -IntelligencePackName AntiMalware -Enabled $true | Out-null
Write-Host "Added Antimalware Assessment Solution to Log Analytic Workspace" -ForegroundColor White

Write-Host "Completed the deployment of Solution to Log Analytic Workspace" -ForegroundColor Green

Write-Host "Completed the deployment of following items
- Deploy Hub Network Virtual Network
- Deploy Identity  Virtual Network
- Deploy Shared Network Virtual Network
- Deploy Defense Virtual Network
- Deploy Log Analytic Workspace
- Deploy Solution to Log Analytic Workspace" -ForegroundColor Green


