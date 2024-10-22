# Define the parameters for the deployment
$resourceGroupName = "yourResourceGroupName"
$location = "yourLocation"
$templateFile = "path/to/your/arm.json"
$storageAccountName = "yourStorageAccountName"
$skuName = "Standard_LRS"
$accessTier = "Hot"

# Create the resource group if it doesn't exist
if (-not (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Define the template parameters
$templateParameters = @{
    "storageAccountName" = $storageAccountName
    "location" = $location
    "skuName" = $skuName
    "accessTier" = $accessTier
}

# Deploy the template
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile $templateFile -TemplateParameterObject $templateParameters