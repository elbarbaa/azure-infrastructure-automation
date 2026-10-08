targetScope = 'subscription'

@description('Name of the resource group.')
param resourceGroupName string

@description('Azure region for the resource group and storage account.')
param location string = 'Canada Central'

@description('Globally unique Azure Storage Account name.')
param storageAccountName string

@description('Name of the private Blob Storage container.')
param containerName string = 'data'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: resourceGroupName
  location: location

  tags: {
    project: 'azure-infrastructure-automation'
    environment: 'dev'
    managed_by: 'bicep'
  }
}

module storage './storage.bicep' = {
  name: 'storageDeployment'
  scope: resourceGroup
  params: {
    storageAccountName: storageAccountName
    location: location
    containerName: containerName
  }
}

output resourceGroupName string = resourceGroup.name
output storageAccountName string = storage.outputs.storageAccountName
output blobContainerName string = storage.outputs.containerName
output blobEndpoint string = storage.outputs.blobEndpoint