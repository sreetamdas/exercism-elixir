pub type Coach {
  Coach(name: String, former_player: Bool)
}

pub type Stats {
  Stats(wins: Int, losses: Int)
}

pub type Team {
  Team(name: String, coach: Coach, stats: Stats)
}

pub fn create_coach(name: String, former_player: Bool) -> Coach {
  Coach(name, former_player)
}

pub fn create_stats(wins: Int, losses: Int) -> Stats {
  Stats(wins, losses)
}

pub fn create_team(name: String, coach: Coach, stats: Stats) -> Team {
  Team(name, coach, stats)
}

pub fn replace_coach(team: Team, coach: Coach) -> Team {
  Team(coach: coach, name: team.name, stats: team.stats)
}

pub fn is_same_team(home_team: Team, away_team: Team) -> Bool {
  home_team == away_team
}

pub fn root_for_team(team: Team) -> Bool {
  case
    team.coach.name,
    team.coach.former_player,
    team.name,
    team.stats.wins,
    team.stats.losses
  {
    "Gregg Popovich", _, _, _, _ -> True
    _, True, _, _, _ -> True
    _, _, "Chicago Bulls", _, _ -> True
    _, _, _, wins, _ if wins >= 60 -> True
    _, _, _, wins, losses if losses > wins -> True

    _, _, _, _, _ -> False
  }
}
