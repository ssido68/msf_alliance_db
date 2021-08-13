function Global:log () {
    param (
        $file = ("{0}\{1}.log.txt" -F $env:TEMP,($MyInvocation.ScriptName).split("\")[($MyInvocation.ScriptName).split("\").count - 1]) ,
        [Parameter(Mandatory = $true)] $text, 
        $ToConsole = $true,
        $ToFile = $true,
        [ValidateSet("info", "warning", "error")] [String[]] $type = "info",
        $Hierarchy = $false,
        $force = $false
    ) 
    $scriptName = ($MyInvocation.ScriptName).split("\")[($MyInvocation.ScriptName).split("\").count - 1]
    switch ( $type ) {
        "info" {
            $color = "darkgreen"
        }
        "warning" {
            $color = "darkyellow" 
        }
        "error" {
            $color = "darkred" 
        }
    }

    # Log to interface
    if ( $Global:Debug -or $force -eq $true) {
        if ($ToFile) {
            if (!$Hierarchy ) { $logTemplate = "{0}:{1}# {2}" } else { $logTemplate = "{0}:{1}#{3}# {2}" }
            $logTemplate -F (Get-Date -format "yyyyMMdd-HH:mm:ss"), $scriptName, $text, $Hierarchy | Out-File $file -Encoding utf8 -Append
        }

        if ($ToConsole) {
            Write-Host -ForegroundColor DarkGray (Get-Date -format "yyyyMMdd-HH:mm:ss") -NoNewline
            Write-Host -ForegroundColor White ":" -NoNewline
            Write-Host -ForegroundColor DarkCyan $scriptName -NoNewline
            if ($Hierarchy ) { Write-Host -ForegroundColor DarkMagenta ("#{0}" -F $Hierarchy) -NoNewline }
            Write-Host -ForegroundColor White "# " -NoNewline
            Write-Host -ForegroundColor $color $text
        }

        if ( $MainForm.ishandlecreated ) {
            $RichTextBoxLogs.selectioncolor = [Drawing.Color]::DarkGray 
            $RichTextBoxLogs.AppendText((Get-Date -format "yyyyMMdd-HH:mm:ss"))
            $RichTextBoxLogs.selectioncolor = [Drawing.Color]::White
            $RichTextBoxLogs.AppendText(":")
            $RichTextBoxLogs.selectioncolor = [Drawing.Color]::Magenta
            $RichTextBoxLogs.AppendText($Hierarchy)
            $RichTextBoxLogs.selectioncolor = [Drawing.Color]::White
            $RichTextBoxLogs.AppendText(":")
            switch ( $type ) {
                "info" {
                    $RichTextBoxLogs.selectioncolor = [Drawing.Color]::DarkGreen
                }
                "warning" {
                    $RichTextBoxLogs.selectioncolor = [Drawing.Color]::DarkOrange
                }
                "error" {
                    $RichTextBoxLogs.selectioncolor = [Drawing.Color]::DarkRed
                }
            }
            $RichTextBoxLogs.AppendText($text)
            $RichTextBoxLogs.AppendText("`n")
            $RichTextBoxLogs.ScrollToCaret()
        } 
    }
} 

 
function Global:ConvertTo-DataTable {
    <# https://fitch.tech/2014/08/09/convertto-datatable/
 .EXAMPLE
 $DataTable = ConvertTo-DataTable $Source
 .PARAMETER Source
 An array that needs converted to a DataTable object
 #>
    [CmdLetBinding(DefaultParameterSetName = "None")]
    param(
        [Parameter(Position = 0, Mandatory = $true)][System.Array]$Source,
        [Parameter(Position = 1, ParameterSetName = 'Like')][String]$Match = ".+",
        [Parameter(Position = 2, ParameterSetName = 'NotLike')][String]$NotMatch = ".+"
    )
    if ($NotMatch -eq ".+") {
        $Columns = $Source[0] | Select * | Get-Member -MemberType NoteProperty | Where-Object { $_.Name -match "($Match)" }
    }
    else {
        $Columns = $Source[0] | Select * | Get-Member -MemberType NoteProperty | Where-Object { $_.Name -notmatch "($NotMatch)" }
    }
    $DataTable = New-Object System.Data.DataTable
    foreach ($Column in $Columns.Name) {
        $DataTable.Columns.Add("$($Column)") | Out-Null
    }
    #For each row (entry) in source, build row and add to DataTable.
    foreach ($Entry in $Source) {
        $Row = $DataTable.NewRow()
        foreach ($Column in $Columns.Name) {
            $Row["$($Column)"] = if ($Entry.$Column -ne $null) { ($Entry | Select-Object -ExpandProperty $Column) -join ', ' }else { $null }
        }
        $DataTable.Rows.Add($Row)
    }
    #Validate source column and row count to DataTable
    if ($Columns.Count -ne $DataTable.Columns.Count) {
        throw "Conversion failed: Number of columns in source does not match data table number of columns"
    }
    else { 
        if ($Source.Count -ne $DataTable.Rows.Count) {
            throw "Conversion failed: Source row count not equal to data table row count"
        }
        #The use of "Return ," ensures the output from function is of the same data type; otherwise it's returned as an array.
        else {
            Return , $DataTable
        }
    }
}

Function Global:ConvertFrom-OperationType {
    param ([string] $OperationType)
    $Known = @{'%%14674' = 'Value Added'
        '%%14675'        = 'Value Deleted'
        '%%14676'        = 'Unknown'
    }
    foreach ($id in $OperationType) { if ($name = $Known[$id]) { return $name } }
    return $OperationType
}