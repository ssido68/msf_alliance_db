$ButtonSelectCsv_MouseClick = {
}
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'msf_alliance_interfaces.import_war.designer.ps1')
$FormImportWar.ShowDialog()