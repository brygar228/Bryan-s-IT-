# 1. Configuration
$domain = "nam.zeomega.loc"  # Replace with your actual domain
$username = "adm.brodriguez"
$newName = Read-Host -Prompt "Enter the NEW computer name"

# 2. Get the password for 'ben'
$caption = "Domain Authentication"
$message = "Please enter the domain password for $username to authorize the rename."
$password = Read-Host -Prompt $message -AsSecureString

# 3. Create the Credential Object
$credential = New-Object System.Management.Automation.PSCredential ("$domain\$username", $password)

# 4. Execute the Rename
Write-Host "Communicating with Domain Controller to rename computer to $newName..." -ForegroundColor Cyan

try {
    # This command renames the local OS and updates the Active Directory record
    Rename-Computer -NewName $newName -DomainCredential $credential -Force -Restart
}
catch {
    Write-Host "Error: Could not rename computer. Check your credentials or connection to the DC." -ForegroundColor Red
    $PSItem.Exception.Message
}