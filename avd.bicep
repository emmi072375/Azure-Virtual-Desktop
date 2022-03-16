@description('Unique HostPool Name')
param hostpoolName string 

@description('A nice & fresh & unique AVD hostpool Name')
param hostpoolFriendlyName string 

@description('Create a Unique App Group Name')
param appgroupName string 

@description('Friendly Name for app group ')
param appgroupNameFriendlyName string 

@description('A Nice and Fresh Workspace')
param workspaceName string 

@description('Friendly workspace Name')
param workspaceNameFriendlyName string 

@description('Create application group type')
param applicationgrouptype string 

@description('Create preferredAppGroup type')
param preferredAppGroupType string 

@description('Location for all resources')
param avdlocation string 

@description('What is the hostpool type, pooled or personal')
@allowed([
  'Pooled'
  'Personal'
])
param hostPoolType string 

@allowed([
  'BreadthFirst'
  'DepthFirst'
])
param loadBalancerType string 

//Create AVD Hostpool

resource hp 'Microsoft.DesktopVirtualization/hostPools@2021-07-12' = {
  name: hostpoolName
  location: avdlocation
  properties: {
    friendlyName: hostpoolFriendlyName
    hostPoolType: hostPoolType
    loadBalancerType: loadBalancerType
    preferredAppGroupType: preferredAppGroupType
  }
}

//Create AVD AppGroup

resource ag 'Microsoft.DesktopVirtualization/applicationGroups@2021-07-12' = {
  name: appgroupName
  location: avdlocation
  properties: {
    friendlyName: appgroupNameFriendlyName
    applicationGroupType: applicationgrouptype
    hostPoolArmPath: hp.id

  }
}

//Create AVD Workspace

resource ws 'Microsoft.DesktopVirtualization/workspaces@2021-07-12' = {
  name: workspaceName
  location: avdlocation
  properties: {
    friendlyName: workspaceNameFriendlyName
    applicationGroupReferences: [
      ag.id
    ]
  }
}

