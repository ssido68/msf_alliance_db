$Button1_MouseClick = {
    $FormMainMenu.close()
    . (Join-Path $PSScriptRoot 'msf_alliance_interfaces.import_war.ps1')
    $FormMainMenu.ShowDialog()
    
}
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'msf_alliance_interfaces.main.designer.ps1')
$FormMainMenu.ShowDialog()