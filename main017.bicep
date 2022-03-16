
targetScope = 'subscription'



@description('Unique HostPool Name')
param hostpoolName string = 'Emran-Hostpool'

@description('A nice & fresh & unique AVD hostpool Name')
param hostpoolFriendlyName string = 'myhostpoolprod'

@description('Create a Unique App Group Name')
param appgroupName string = 'Emran-appgroup'

@description('Friendly Name for app group ')
param appgroupNameFriendlyName string = 'myAppGroupprod'

@description('A Nice and Fresh Workspace')
param workspaceName string = 'Emran-workspace'

@description('Friendly workspace Name')
param workspaceNameFriendlyName string = 'myWorkspaceprod'

@description('Create application group type')
param applicationgrouptype string = 'Desktop'

@description('Create preferredAppGroup type')
param preferredAppGroupType string = 'Desktop'

@description('Location for all resources')
param avdlocation string = 'northeurope'

@description('What is the hostpool type, pooled or personal')
@allowed([
  'Pooled'
  'Personal'
])
param hostPoolType string = 'Pooled'

@allowed([
  'BreadthFirst'
  'DepthFirst'
])
param loadBalancerType string = 'BreadthFirst'

param myResourceGroup string = 'zellytest02-rg'


resource myRG017 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: myResourceGroup
  location: avdlocation
}

module mywvd 'avd.bicep' = {
  name: 'wvddeployment'
  scope: myRG017
  params: {
    
    hostpoolName: hostpoolName
    hostpoolFriendlyName: hostpoolFriendlyName
    hostPoolType: hostPoolType
    appgroupName: appgroupName
    appgroupNameFriendlyName: appgroupNameFriendlyName
    workspaceName: workspaceName
    workspaceNameFriendlyName: workspaceNameFriendlyName
    applicationgrouptype: applicationgrouptype
    preferredAppGroupType: preferredAppGroupType
    loadBalancerType: loadBalancerType
    avdlocation: avdlocation
  }
}


