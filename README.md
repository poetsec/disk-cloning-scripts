# disk-cloning-scripts
PowerShell scripts for cloning disks on Windows.

## cloning-station.ps1 (obsolete)
This script was meant to automate disk cloning on a cloning station that contained five external NVMe bays: one source and four targets. It uses Acronis Cyber Protect 15's command-line utility, ```acrocmd```, which I have not gotten to function correctly. I was planning on adding more custom options to the script to make it more convnient to use and make it give accurate success/fail messages, but unless I can get ```acrocmd``` to work as planned, this script likely won't get any updates.
