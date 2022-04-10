$HubNetworkSubscriptionId="8ab7be51-3eae-4adb-b5a0-9f2973e836e3"
$IdentitySubscriptionId="8ab7be51-3eae-4adb-b5a0-9f2973e836e3"
$SharedSubscriptionId="8ab7be51-3eae-4adb-b5a0-9f2973e836e3"
$DefenseSubscriptionId="8ab7be51-3eae-4adb-b5a0-9f2973e836e3"

$location="uaenorth"

$HubNetworkResourcegroup="rg-hubnetwork-uaen-01"
$HubNetworkVNet="vnet-hubnetwork-uaen-01"
$HubNetworkAddressPrefix= "172.23.0.0/20"
$HubNetworkRouteTable= "rt-default-hubnetwork-uaen-01"
$HubNetworkSubnet1= "AzureFirewallSubnet"
$HubNetworkSubnet1Prefix= "172.23.1.0/26"
$HubNetworkSubnet2= "snet-hubnetwork-mgmt-01"
$HubNetworkSubnet2Prefix= "172.23.0.128/25"
$HubNetworkSubnet2NSG="nsg-snet-hubnetwork-mgmt-01"
$HubNetworkFirewallIP = "172.23.0.4"

$IdentityResourcegroup= "rg-identity-uaen-01"
$IdentityVNet="vnet-identity-uaen-01"
$IdentityAddressPrefix= "172.23.16.0/20"
$IdentityRouteTable= "rt-default-identity-uaen-01"
$IdentitySubnet1= "snet-identity-Identity-01"
$IdentitySubnet1Prefix= "172.23.16.0/24"
$IdentitySubnet1NSG="nsg-snet-identity-Identity-01"
$IdentitySubnet2= "snet-identity-app-01"
$IdentitySubnet2Prefix= "172.23.17.0/24"
$IdentitySubnet2NSG="nsg-snet-identity-app-01"

$SharedResourcegroup="rg-shared-uaen-01"
$SharedVNet="vnet-shared-uaen-01"
$SharedAddressPrefix= "172.23.16.0/20"
$SharedRouteTable= "rt-default-shared-uaen-01"
$SharedSubnet1= "snet-shared-shared-01"
$SharedSubnet1Prefix= "172.23.16.0/24"
$SharedSubnet1NSG="nsg-snet-shared-shared-01"
$SharedSubnet2= "snet-shared-app-01"
$SharedSubnet2Prefix= "172.23.17.0/24"
$SharedSubnet2NSG="nsg-snet-shared-app-01"

$DefenseResourcegroup="rg-defense-uaen-01"
$DefenseVNet="vnet-defense-uaen-01"
$DefenseAddressPrefix= "172.23.16.0/20"
$DefenseRouteTable= "rt-defense-uaen-01"
$DefenseSubnet1= "snet-defense-log-01"
$DefenseSubnet1Prefix= "172.23.16.0/24"
$DefenseSubnet1NSG="nsg-snet-defense-log-01"


Write-Host "Script started................................." -ForegroundColor Red
Set-Item Env:\SuppressAzurePowerShellBreakingChangeWarnings "true"

# Deploy Hub Network Virtual Network
#====================================l

Write-Host "Starting VNet Deployment." -ForegroundColor Red

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
Write-Host "Completed the deployment of Hub Network Virtual Network" -ForegroundColor green


# Deploy Identiity  Virtual Network
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

Write-Host "Completed the deployment of Shared Virtual Network" -ForegroundColor White
