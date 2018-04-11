#If On Prem user exists and says account is remote user but O365 does not have license and says account already exists when assigining license
#RUN ONLY FOR NEW USERS#
Get-MsolUser -UserPrincipalName "username@domain.com" | Select-Object *
# Copy Object ID & go through other attributes#
#Verifies same object ID for the user with name #
Get-MSoluser -ObjectID PasteObjectID-Here
#Removes the user from O365#
Remove-msoluser -ObjectID PasteObjectID-Here
Remove-Msoluser -objectID PasteObjectID-Here -removefromrecyclebin
#Removes the user from recycle bin#
#Try to provision the account again#
