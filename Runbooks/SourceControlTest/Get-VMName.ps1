workflow Get-VMName
{
    # By default, errors in PowerShell do not cause workflows to suspend, like exceptions do.
	# This means a runbook can still reach 'completed' state, even if it encounters errors
	# during execution. The below command will cause all errors in the runbook to be thrown as
	# exceptions, therefore causing the runbook to suspend when an error is hit.
	#$ErrorActionPreference = "Stop"
    
    # Grab the credential to use to authenticate to Azure. 
    # TODO: Fill in the -Name parameter with the name of the Automation PSCredential asset
    # that has access to your Azure subscription
    $Cred = Get-AutomationPSCredential -Name "Azure Automation Credential"
    
    # Connect to Azure
    Add-AzureAccount -Credential $Cred | Write-Verbose
    Write-Debug "It was updated on GitHub"
    # Select the Azure subscription you want to work against
    # TODO: Fill in the -SubscriptionName parameter with the name of your Azure subscription
    Select-AzureSubscription -SubscriptionName "Visual Studio Ultimate with MSDN" | Write-Verbose
    
    #Get all Azure VMs in the subscription, and output each VM's name
    Get-AzureVM | select InstanceName
}
