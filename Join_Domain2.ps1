$domain = "----------"
$username = "---------"

$password = Read-Host -Prompt "Enter Password for $username" -AsSecureString

$credential = New-Object System.Management.Automation.PSCredential ("$doamin\$username", $password)

Write-Host "Joining $domain..." -ForegroundColor Cyan

Add-Computer -DomainName $domain -Credential $credential -Restart -Force



git tag powershell
