#Seach for users
  Get-ADUser -Filter 'Name -like "*name*"'

#unlock user
  Unlock-ADAccount -Identity "username"
