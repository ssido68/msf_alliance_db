$FormMainMenu = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Button]$Button1 = $null
function InitializeComponent
{
$Button1 = (New-Object -TypeName System.Windows.Forms.Button)
$FormMainMenu.SuspendLayout()
#
#Button1
#
$Button1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]54,[System.Int32]51))
$Button1.Name = [System.String]'Button1'
$Button1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]141,[System.Int32]37))
$Button1.TabIndex = [System.Int32]0
$Button1.Text = [System.String]'Import war csv'
$Button1.UseCompatibleTextRendering = $true
$Button1.UseVisualStyleBackColor = $true
$Button1.add_MouseClick($Button1_MouseClick)
#
#FormMainMenu
#
$FormMainMenu.Controls.Add($Button1)
$FormMainMenu.Name = [System.String]'FormMainMenu'
$FormMainMenu.Text = [System.String]'Form1'
$FormMainMenu.ResumeLayout($false)
Add-Member -InputObject $FormMainMenu -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $FormMainMenu -Name Button1 -Value $Button1 -MemberType NoteProperty
}
. InitializeComponent
