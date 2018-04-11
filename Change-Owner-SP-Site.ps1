$tenant =  “https://.sharepoint.com“
$site = “https://.sharepoint.com/teams/test”
$user =”@.onmicrosoft.com” # This will be the UPN for the user who will be added as the administrator.
Set-SPOUser -Site $site -LoginName username@vigx.onmicrosoft.com -IsSiteCollectionAdmin $true
