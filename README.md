## Create-Server-Profile-from-Template

The PowerShell script creates server profiles from templates

The script collects information from an Excel spreadsheet and generates server profiles.


## Prerequisites
* HPE ONeView PowerShell library : ```` install-module -name HPEOneView.800 ````
* Import-Excel module: ````install-module -name ImportExcel ````

## To run the script
````
Connect-OVMgmt -hostname <OV-IP> -credential <OV-credential>
.\newServerProfile.ps1 -profileXL .\Profiles.xlsx
````

Enjoy!