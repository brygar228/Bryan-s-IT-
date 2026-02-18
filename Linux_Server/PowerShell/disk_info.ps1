Get-Volume | Where-Object DriveLetter -match '^[A-Z]$' | ForEach-Object {
    $vol = $_
    # Link the Volume to the Physical Disk to get the SCSI Address
    $diskNum = (Get-Partition -DriveLetter $vol.DriveLetter).DiskNumber
    $location = (Get-Disk -Number $diskNum).Location
    
    # Clean the SCSI Address string (removing Device, Function, Adapter, Port)
    $cleanSCSI = $location -replace ' : Device \d+ : Function \d+ : Adapter \d+ : Port \d+', ''

    [PSCustomObject]@{
        Disk         = $diskNum
        Drive        = $vol.DriveLetter
        'Total (GB)' = [math]::Round($vol.Size / 1GB, 2)
        'Free (GB)'  = [math]::Round($vol.SizeRemaining / 1GB, 2)
        'Used (%)'   = [math]::Round((($vol.Size - $vol.SizeRemaining) / $vol.Size) * 100, 1)
        SCSI_Address = $cleanSCSI
    }
} | Format-Table -AutoSize
