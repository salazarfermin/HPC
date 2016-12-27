[string]$SubscriptionId = 'a3031bbc-4497-4414-90df-e927b85922f9';
#[string]$SubscriptionId = '86e16eab-9149-438c-b23f-042a43311e1c';
[string]$ResourceGroupName = 'DCPNTI-GSPI-HPC';
[string]$Location = 'South Central US';

Login-AzureRmAccount -SubscriptionId $SubscriptionId;

New-AzureRmResourceGroup -Name $ResourceGroupName -Location $Location;

New-AzureRmResourceGroupDeployment -Name hpc-ctest-vnet -ResourceGroupName $ResourceGroupName -TemplateFile (Join-Path (Split-Path $myinvocation.mycommand.path) 'vnet\vnetdeploy.json') -TemplateParameterFile (Join-Path (Split-Path $myinvocation.mycommand.path) 'vnet\parameters.json') -Verbose;

New-AzureRmResourceGroupDeployment -Name hpc-ctest -ResourceGroupName $ResourceGroupName -TemplateFile (Join-Path (Split-Path $myinvocation.mycommand.path) 'HPCLinux.json') -Verbose;

Remove-AzureRmResourceGroup -Name $ResourceGroupName;
