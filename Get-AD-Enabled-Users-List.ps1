$Path = 'Define Path Here C:\\ListUsers.csv'
Get-ADUser -Filter * |
Select-Object Name,Enabled,UserPrincipalName | Export-Csv -Path $Path –notypeinformation
