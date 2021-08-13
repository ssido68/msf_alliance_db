#region # VERSION

#endregion

#region # CONFIGURATION
$GLobal:debug = $true
#endregion
Set-Location $PSScriptRoot
. "$PSScriptRoot\msf_alliance_db.utility.ps1"
Global:log -text "loaded utility file" -Hierarchy "INIT"

. "$PSScriptRoot\msf_alliance_db.sqllite.ps1"
Global:log -text "loaded sqllite file" -Hierarchy "INIT"



#region # Database init
$Database = "{0}\MSF_Alliance_DB.SQLite" -F $PSScriptRoot
#$Database = "{0}\AmericanDadCast.SQLite" -F $PSScriptRoot

IF ( !(Test-Path -Path $Database) ) {
    # database file creation and connection init
    $Connection = New-SQLiteConnection -DataSource $Database
    Global:log -text ( "no database found, creating @ {0}"-F $Database ) -Hierarchy "DATABASE" -type warning

} ELSE {
    Global:log -text ( "Database found @ {0}"-F $Database ) -Hierarchy "DATABASE"
}

$Connection = New-SQLiteConnection -DataSource $Database
$query = "SELECT name FROM sqlite_master WHERE type ='table' AND name NOT LIKE 'sqlite_%';"
$data = Invoke-SqliteQuery -SQLiteConnection $Connection -Query $query
$data 



$a

exit
"CREATE TABLE [dbo].[members] (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name CHAR(50),
role CHAR(50),
join dt,
quit dt,
status CHAR(50));


CREATE TABLE [dbo].[member_matches] (
member_id INTEGER PRIMARY KEY AUTOINCREMENT,
match_string CHAR(50)
);



CREATE TABLE [dbo].[alliance_wars] (
member_id INTEGER PRIMARY KEY AUTOINCREMENT,
war_date dt,
war_attack_points int,
war_attacks int,
war_damage_points int,
war_defend_victories int,
war_defencse_boosts int,
war_mvp_points int
);


CREATE TABLE [dbo].[member_stats] (
member_id INTEGER PRIMARY KEY AUTOINCREMENT,
stats_date dt,
stats_tcp int,
stats_stp int,
stats_war_mvp int,
stats_total_characters int,
stats_max_star_rank int,
stats_all_time_arena_rank int,
stats_last_arena_rank int,
stats_latest_blitz_rank int,
stats_blitz_wins int
);"


#region # sandbox
Get-ChildItem "C:\Users\rhamb\OneDrive\Desktop\war" -Filter WarData*.csv | ForEach-Object {
    $RecordDate = $_.CreationTime.ToString("yyyy-MM-dd")
    $data = import-csv $_.FullName 
    $data
    
}
exit
Import-Csv -Path "C:\Users\rhamb\OneDrive\Desktop\war\WarData_2021-05-07.csv" | % {
    $_

}
#endregion

#endregion
exit
$query = "CREATE TABLE CastMembers (
            CastID INTEGER PRIMARY KEY AUTOINCREMENT,
            FirstName TEXT,
            Lastname TEXT,
            Gender TEXT,
            Age INT,
            Species TEXT
            );"
Invoke-SqliteQuery -SQLiteConnection $Connection -Query $query
# data input loop
$Queries = ""
$data | % {
    $Query = "INSERT INTO CastMembers ( FirstName,Lastname,Gender,Age,Species) VALUES ('{0}','{1}','{2}',{3},'{4}');" -F
    $_.Firstname, 
    $_.Lastname, 
    $_.Gender, 
    $_.Age, 
    $_.Species
    $Queries += $Query 
}
Invoke-SqliteQuery -SQLiteConnection $Connection -Query $Queries
    

#$Connection = New-SQLiteConnection -DataSource :MEMORY: 
    
# sample data output from sql processing
$query = "SELECT CAST(AVG(Age) AS INTEGER) as [Average age],Gender FROM CastMembers GROUP BY Gender; "
$data = Invoke-SqliteQuery -SQLiteConnection $Connection -Query $query
$data | ? { $_.Gender -eq "Female" }
    
#endregion
    