Write-Host "Checking connected disks..."
Get-Disk
Write-Host " "
Write-Host "Check that the list looks correct. Drive (T:) will be the source disk inserted as disk 1 and will be cloned to drives"
Write-Host "(D:) through (G:) which should be inserted as disks 2 through 5. Drive (C:) is disk 0 and is the internal drive."
Write-Host "Important! The four disks listed as SSK are the disks that should be the target drives, and MUST be inserted as disks" -ForegroundColor Red
Write-Host "2 through 5 for the script to clone to the correct drives. KBG40ZNS is the source drive and MUST be insterted as disk 1." -ForegroundColor Red

Write-Host " "
Write-Host "Warning! This script must be run as admin to work properly." -ForegroundColor Red
$msg = 'Would you like to continue? [Y/N]'
do {
    $response = Read-Host -Prompt $msg
    if ($response -eq 'n') {
        Write-Host "Please exit the script and re-configure the drives."
		Start-Sleep 10
		Exit
    }
} until ($response -eq 'y')

Write-Host " "
Write-Host "Drives inserted as disks 2 through 5 will now be wiped."
Write-Host "Ensure your target drives are disks 2 through 5 and that your source drive is disk 1." -ForegroundColor Red
Read-Host -Prompt "`r`nPress any key to continue"

Write-Host " "
Write-Host "Removing all data from disk 2..."
Initialize-Disk -number 2
Clear-Disk -number 2 -removedata -removeOEM -Confirm:$false
Write-Host "Disk 2 has been wiped. " -ForegroundColor Green -NoNewline; Write-Host "Removing all data from disk 3..."
Initialize-Disk -number 3
Clear-Disk -number 3 -removedata -removeOEM -Confirm:$false
Write-Host "Disk 3 has been wiped. " -ForegroundColor Green -NoNewline; Write-Host "Removing all data from disk 4..."
Initialize-Disk -number 4
Clear-Disk -number 4 -removedata -removeOEM -Confirm:$false
Write-Host "Disk 4 has been wiped. " -ForegroundColor Green -NoNewline; Write-Host "Removing all data from disk 5..." 
Initialize-Disk -number 5
Clear-Disk -number 5 -removedata -removeOEM -Confirm:$false
Write-Host "Disk 5 has been wiped. " -ForegroundColor Green

Write-Host " "
Read-Host -Prompt "Target disks have been wiped. Press any key to begin cloning"

Write-Host " "
Write-Host "Starting cloning to disk 2..."
acrocmd clone disk --source=1 --target=2 --progress
Write-Host "Cloning to disk 2 complete. " -ForegroundColor Green -NoNewline; Write-Host "Now cloning to disk 3..."
acrocmd clone disk --source=1 --target=3 --progress
Write-Host "Cloning to disk 3 complete. " -ForegroundColor Green -NoNewline; Write-Host "Now cloning to disk 4..."
acrocmd clone disk --source=1 --target=4 --progress
Write-Host "Cloning to disk 4 complete. " -ForegroundColor Green -NoNewline; Write-Host "Now cloning to disk 5..."
acrocmd clone disk --source=1 --target=5 --progress
Write-Host "Cloning to disk 5 complete. " -ForegroundColor Green

Write-Host " "
Read-Host -Prompt "All disks have been successfully cloned. Press any key to exit"
Exit
