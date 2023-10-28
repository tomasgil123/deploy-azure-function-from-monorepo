#!/bin/bash

# Check if the user is logged into Azure
if az account show &>/dev/null; then
  echo "Azure CLI is already logged in."
else
  echo "Azure CLI is not logged in. Please log in to your Azure account."
  az login
fi

# Ensure the script is always executable
chmod +x "$0"

# Install production dependencies using yarn
yarn install --force

# we create a dist folder if not present
mkdir -p build

# Create a deployment package (ZIP file) in the dist folder
zip -r build/azure-function-1.zip .

# Deploy the package to Azure Functions
az functionapp deployment source config-zip --src ./build/azure-function-1.zip --name {functionAppName} --resource-group {resourceGroup} --subscription {subscriptionId}