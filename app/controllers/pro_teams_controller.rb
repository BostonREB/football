class ProTeamsController < ApplicationController

  def index
    @pro_teams = ProTeam.all
  end

  def show
    @pro_team = ProTeam.find(params[:id])
    @team_players = @pro_team.players
  end

  private

  def get_team_players(team)
    team_name = team.code.to_s
    team_players = Player.where(team: team_name)
  end

end
