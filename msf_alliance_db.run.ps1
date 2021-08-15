#region # VERSION

#endregion

#region # CONFIGURATION
$GLobal:debug = $true
#endregion
Set-Location $PSScriptRoot
. "$PSScriptRoot\msf_alliance_db.utility.ps1"
Global:log -text "loaded utility file" -Hierarchy "INIT"

. "$PSScriptRoot\msf_alliance.definitions.ps1"
Global:log -text "loaded definitions file" -Hierarchy "INIT"

. "$PSScriptRoot\msf_alliance_db.sqllite.ps1"
Global:log -text "loaded sqllite file" -Hierarchy "INIT"

. "$PSScriptRoot\interfaces\msf_alliance_interfaces.main.ps1"
