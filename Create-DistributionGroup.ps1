################################################################################################################
#                                                                                                              #
# This Script is for creating O365 Email Distribution Group. You must be connected to Exchange Online          #
# Author: Gurinder Singh                                                                                       #
# Version: 1                                                                                                   #
# Date: 22-07-2016                                                                                             #  
#                                                                                                              #
################################################################################################################

$Error.Clear()
Write-Host("Script for Creating Office 365 Distribution Group")
Write-Host("----------------------------------")

#Create Groups

	$DGDisplayName = Read-Host -Prompt "Enter Distribution Group's Display Name"
	$Name = Read-Host -Prompt "Enter Distribution Group Alias" 
	$Email = "$Name@domain.com.au"
	$Exists = ""
	$Exists = Get-DistributionGroup $Name -ErrorAction SilentlyContinue
	If ($Exists) {
		Write-Host "Distribution Group $Name Already Exists" -ForegroundColor Yellow
		}
	ELSE {
		New-DistributionGroup -name $Name -Alias $DGDisplayName -DisplayName $Email -PrimarySmtpAddress $Email -MemberJoinRestriction Closed -MemberDepartRestriction Closed -ModeratedBy AddAdminEmail@.onmicrosoft.com -RequireSenderAuthenticationEnabled $false -ErrorAction SilentlyContinue
        Set-DistributionGroup -Identity $Email -HiddenFromAddressListsEnabled $false
		Write-Host "Distribution Group $Email has been created" -ForegroundColor Green
		}

 $Error | Out-File c:\scripts\logs\CreateDLErrorLog.txt
	
