#Connect to Sharepoint Online
$adminUPN="@.onmicrosoft.com"
$orgName="your-SP-organisation-name e.g. mycompanyname.sharepoint.com " 
$userCredential = Get-Credential -UserName $adminUPN -Message "Type your password."
Connect-SPOService -Url https://$orgName-admin.sharepoint.com -Credential $userCredential
