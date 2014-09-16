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

  desc "Get Weekly Projections"
  task weekly_projections: :environment do
    weekly_projections = ProjectionsRetriever.new
    weekly_projections.get_projections
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
        team.conference = "NFC"
      else
        team.conference = "AFC"
      end
      team.save
    end
  end

  desc "Add divisions to pro teams"
  task add_divisions: :environment do
    n_east = [9, 19, 24, 32]
    n_north = [6, 11, 12, 18]
    n_south = [2, 5, 15, 30]
    n_west = [1, 27, 28, 29]
    a_east = [4, 17, 20, 21]
    a_north = [3, 7, 8, 25]
    a_south = [13, 14, 22, 31]
    a_west = [10, 16, 23, 26]
    teams = ProTeam.all
    teams.each do |team|
      if n_east.include?(team.id)
        team.division = "NFC East"
      elsif n_north.include?(team.id)
        team.division = "NFC North"
      elsif n_south.include?(team.id)
        team.division = "NFC South"
      elsif n_west.include?(team.id)
        team.division = "NFC West"
      elsif a_east.include?(team.id)
        team.division = "AFC East"
      elsif a_north.include?(team.id)
        team.division = "AFC North"
      elsif a_south.include?(team.id)
        team.division = "AFC South"
      elsif a_west.include?(team.id)
        team.division = "AFC West"
      end
      team.save
    end
  end
end

