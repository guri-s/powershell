#Connect to Sharepoint Online
$adminUPN= Read-Host -Prompt "Enter Admin UPN"
$orgName= Read-Host -Prompt "Enter tenancy's name" 
$userCredential = Get-Credential -UserName $adminUPN -Message "Type your password."
Connect-SPOService -Url https://$orgName-admin.sharepoint.com -Credential $userCredential
