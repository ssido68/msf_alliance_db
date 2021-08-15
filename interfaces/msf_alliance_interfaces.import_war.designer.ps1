$FormImportWar = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.OpenFileDialog]$OpenFileDialog1 = $null
[System.Windows.Forms.Button]$ButtonSelectCsv = $null
function InitializeComponent
{
$OpenFileDialog1 = (New-Object -TypeName System.Windows.Forms.OpenFileDialog)
$ButtonSelectCsv = (New-Object -TypeName System.Windows.Forms.Button)
$FormImportWar.SuspendLayout()
#
#OpenFileDialog1
#
$OpenFileDialog1.FileName = [System.String]'OpenFileDialog1'
#
#ButtonSelectCsv
#
$ButtonSelectCsv.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]61,[System.Int32]35))
$ButtonSelectCsv.Name = [System.String]'ButtonSelectCsv'
$ButtonSelectCsv.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]134,[System.Int32]38))
$ButtonSelectCsv.TabIndex = [System.Int32]0
$ButtonSelectCsv.Text = [System.String]'Select csv'
$ButtonSelectCsv.UseCompatibleTextRendering = $true
$ButtonSelectCsv.UseVisualStyleBackColor = $true
$ButtonSelectCsv.add_MouseClick($ButtonSelectCsv_MouseClick)
#
#FormImportWar
#
$FormImportWar.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]894,[System.Int32]733))
$FormImportWar.Controls.Add($ButtonSelectCsv)
$FormImportWar.Name = [System.String]'FormImportWar'
$FormImportWar.Text = [System.String]'Form1'
$FormImportWar.ResumeLayout($false)
Add-Member -InputObject $FormImportWar -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $FormImportWar -Name OpenFileDialog1 -Value $OpenFileDialog1 -MemberType NoteProperty
Add-Member -InputObject $FormImportWar -Name ButtonSelectCsv -Value $ButtonSelectCsv -MemberType NoteProperty
}
. InitializeComponent
