namespace :get_data do

  desc "Get player bio data"
  task players: :environment do
    nfl_players = PlayerRetriever.new
    nfl_players.get_players
  end

  desc "Get NFL team data"
  task pro_teams: :environment do
    pro_teams = TeamRetriever.new
    pro_teams.get_teams
  end

  desc "Link players with NFL Teams"
  task link_players_to_teams: :environment do
    players = Player.all
    players.each do |player|
      team = player.team
      pro_team = ProTeam.find_by(code: team)
      player.pro_team_id = pro_team.id
      player.save
    end
  end
end

