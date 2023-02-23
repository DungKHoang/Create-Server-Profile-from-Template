[CmdletBinding ()]
Param
(
    [string]$profileXL
)

# ----- Read/format Excel file
$_list              = import-excel -path $profileXL  -dataonly


foreach ($_el in $_list)
{
    $profilename    = $_el.Profile
    $template       = $_el.Template
    $server         = $_el.Server

    if ($server -and $template -and $profilename)
    {
        write-host -foreground GREEN "Creating server profile $profilename for server $server using template $template "
        $spt    = Get-OVServerProfileTemplate -Name $Template
        $s      = Get-OVServer -Name $server
        if ($s.PowerState -eq 'On')
        {
            Stop-OVServer -InputObject $s -force:$True -confirm:$false | Wait-OVTaskComplete
        }
        New-OVServerProfile -server $s -name $profilename -ServerProfileTemplate $spt | Wait-OVTaskComplete 
    }
    else 
    {
        write-host -foreground Yellow " Either server or profile or template is not specified"
    }
}
