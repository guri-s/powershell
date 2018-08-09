# This script does the below
# Create a Discovery Mailbox 
# Starts a Mailbox Search which will copy the emails of an ex employee to the discovery mailbox & send status email
# Created by Gurinder "Adroit Guri" Singh ! 04-06-2018
#
#
#Create the Search Mailbox where the  search results are to be copied to:
      $DiscoveryMailbox= Read-Host -Prompt "Enter the name for Discovery Mailbox to be created e.g. joe_blogs_search: "
        New-Mailbox -name $DiscoveryMailbox -Discovery
      Write-Host "Please wait for 15 seconds while O365 provisions the Discovery Mailbox"
        Start-Sleep -s 15
      $FormerStaff= Read-Host -Prompt "Enter the former staff's on hold email address: "
#
      $StatusRecipient= Read-Host -Prompt "Enter the email address to be notified when Search completes: "
#
#Hide the Search Mailbox from the GAL. It does not need to be visible.
        Set-Mailbox $DiscoveryMailbox -HiddenFromAddressListsEnabled $True
#
        Write-Host "Please Wait for 5 seconds while O365 works its magic to hide the mailbox"
          Start-Sleep -s 5
#
#Create an eDiscovery Search. There can be various different parameters used such as date range etc.
          New-MailboxSearch -name $DiscoveryMailbox -SourceMailboxes $FormerStaff -TargetMailbox $DiscoveryMailbox -StatusMailRecipients $StatusRecipient -LogLevel Full -ExcludeDuplicateMessages $true
#
#Below example with a date Range to search emails in 
#New-MailboxSearch -name $DiscoveryMailbox -SourceMailboxes $FormerStaff -startdate '01/01/2017' -enddate '07/02/2018' -TargetMailbox $DiscoveryMailbox -StatusMailRecipients $StatusRecipient -LogLevel Full -ExcludeDuplicateMessages $true
#
        Write-Host "Look O365 is not really that fast & be back in 60 seconds. In the meantime, you gasp @ Guri's awesomeness for writing this script!"
          Start-Sleep -s 60
#
#Start the new Search
        Start-mailboxsearch  $DiscoveryMailbox
#
#Check Status of Mailbox Search
#Get-MailboxSearch "MailboxSearchName"
#
#Once completed, grant access to the new Search Mailbox. I do this last as I have occasionally run into errors with the search if I grant access to it before it is finished.
#Add-MailboxPermission $DiscoveryMailbox -user UserWhoNeedsAccess@email.com -AccessRights FullAccess -InheritanceType All
