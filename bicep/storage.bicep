param storageAccountName string
param location string
param containerName string

resource storageAccount 'Microsoft.Storage/storageAccounts@2025-06-01' = {
  name: storageAccountName
  location: location

  sku: {
    name: 'Standard_LRS'
  }

  kind: 'StorageV2'

  properties: {
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
  }

  tags: {
    project: 'azure-infrastructure-automation'
    environment: 'dev'
    managed_by: 'bicep'
  }
}

resource blobContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2025-06-01' = {
  name: '${storageAccount.name}/default/${containerName}'

  properties: {
    publicAccess: 'None'
  }
}

output storageAccountName string = storageAccount.name
output containerName string = blobContainer.name
output blobEndpoint string = storageAccount.properties.primaryEndpoints.blob