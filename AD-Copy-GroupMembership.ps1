Get-ADUser -Identity oldusername -Properties memberof | Select-Object -ExpandProperty memberof | Add-ADGroupMember -Members newusername
