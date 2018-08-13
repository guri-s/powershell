Import-Module ActiveDirectory 
$Domain = "ENTER AD DOMAIN" 
$DaysInactive = 90
$Time = (Get-Date).Adddays(-($DaysInactive))
# Get AD Users with lastLogonTimestamp less than time specified and is enabled
# "distinguishedname" will get OU in the export, remove it if you don't want it
Get-ADUser -Filter {LastLogonTimeStamp -lt $time -and enabled -eq $true} -Properties LastLogonTimeStamp | select-object Name,@{Name="Stamp"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp).ToString('yyyy-MM-dd')}},distinguishedName | export-csv C:\temp\Inactive_Users1.csv -notypeinformation
