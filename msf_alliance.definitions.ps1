## Define reports
$msf_alliance_app_definitions = [ordered] @{
    sqllite = @{
        tables = [ordered]@{
            members        = @{
                fields = [ordered]@{
                    id        = "INTEGER PRIMARY KEY AUTOINCREMENT"
                    name      = "CHAR(50)"
                    role      = "CHAR(50)"
                    join_date = "DT"
                    quit_date = "DT"
                    status    = "CHAR(50)"
                }
            }
            member_matches = @{
                fields = [ordered]@{
                    member_id    = "INT"
                    match_string = "CHAR(50)"
                }
            }
            alliance_wars  = @{
                fields = [ordered]@{
                    member_id            = "INTEGER PRIMARY KEY AUTOINCREMENT"
                    war_date             = "DT"
                    war_attack_points    = "INT"
                    war_attacks          = "INT"
                    war_damage_points    = "INT"
                    war_defend_victories = "INT"
                    war_defencse_boosts  = "INT"
                    war_mvp_points       = "INT"
                }
            }
            member_stats   = @{
                fields = [ordered]@{
                    member_id                 = "INT"
                    stats_date                = "dt"
                    stats_tcp                 = "INT"
                    stats_stp                 = "INT"
                    stats_war_mvp             = "INT"
                    stats_total_characters    = "INT"
                    stats_max_star_rank       = "INT"
                    stats_all_time_arena_rank = "INT"
                    stats_last_arena_rank     = "INT"
                    stats_latest_blitz_rank   = "INT"
                    stats_blitz_wins          = "INT"
                }
            }
        }

    }
}