#Load VB
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') 
#variable to store the user from whom the membership is being copied
$copyfrom = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the UserName from whom to copy the Group Membership from", "Get Old Staff's LoginID", "") 
#variable to store the user to whom the membership is being copied
$copyto   = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the UserName who needs the membership to be copied to", "Get New Staff's LoginID", "") 
Get-ADUser -Identity $copyfrom -Properties memberof | Select-Object -ExpandProperty memberof | Add-ADGroupMember -Members $copyto
#VB Dialog Box
[Microsoft.VisualBasic.Interaction]::MsgBox("Thanks Guri! You just saved my day.", "OKOnly,SystemModal,Information", "Guri's Awesome.")
