#Load VB#
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') 
#Asks about sitename
$Site = [Microsoft.VisualBasic.Interaction]::InputBox("Which site would you like add an admin to", "Site URL", "") 
$tenant =  “https://tenancyname.sharepoint.com“
##$site = “https://bob.sharepoint.com/teams/test”
$user = [Microsoft.VisualBasic.Interaction]::InputBox("Who do you want to add as Owner?", "Enter UPN", "") 
##$user =”@.onmicrosoft.com” # This will be the UPN for the user who will be added as the administrator.
Set-SPOUser -Site $site -LoginName $user -IsSiteCollectionAdmin $true
[Microsoft.VisualBasic.Interaction]::MsgBox("Owner Added!", "OKOnly,SystemModal,Information", "Don't forget to thank Gurinder!")
