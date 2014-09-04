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

  desc "Delete free agents and inactive players"
  task remove_inactives: :environment do
    players = Player.all
    players.each do |player|
      if player.active == 0 || player.team == "FA"
        player.destroy
      end
    end
  end

  desc "Add conferences to pro teams"
  task add_conferences: :environment do
    nfc = [1, 2, 5, 6, 9, 11, 12, 18, 19, 22, 24, 27, 28, 29, 30, 32]
    teams = ProTeam.all
    teams.each do |team|
      if nfc.include?(team.id)
        team.conference = "National Football Conference"
      else
        team.conference = "American Football Conference"
      end
      team.save
    end
  end

  desc "Add divisions to pro teams"
  task add_divisions: :environment do
    east = [4, 9, 17, 19, 20, 21, 24, 32]
    north = [3, 6, 7, 8, 11, 12, 18, 25]
    south = [2, 5, 13, 14, 15, 22, 30, 31]
    west = [1, 10, 16, 23, 26, 27, 28, 29]
    teams = ProTeam.all
    teams.each do |team|
      if east.include?(team.id)
        team.division = "East"
      elsif north.include?(team.id)
        team.division = "North"
      elsif south.include?(team.id)
        team.division = "South"
      elsif west.include?(team.id)
        team.division = "West"
      end
      team.save
    end
  end
end

