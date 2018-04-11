#Connect to Sharepoint Online
$adminUPN="@.onmicrosoft.com"
$orgName="gp"
$userCredential = Get-Credential -UserName $adminUPN -Message "Type the password."
Connect-SPOService -Url https://$orgName-admin.sharepoint.com -Credential $userCredential
