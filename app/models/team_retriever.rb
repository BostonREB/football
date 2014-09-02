class TeamRetriever
  attr_reader :pro_team
  FFNERD_API_KEY = ENV.fetch('FFNERD_API_KEY')

  def get_teams
    teams = FFNerd.teams
    teams.map do |team|
      ProTeam.create(team_params(team))
    end
  end

  private

  def team_params(team)
    {
      code: team.code,
      full_name: team.fullName,
      location: team.shortName
    }
  end
end
