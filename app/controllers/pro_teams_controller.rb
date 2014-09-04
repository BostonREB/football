class ProTeamsController < ApplicationController

  def index
    @pro_teams = ProTeam.all
    @divisions = @pro_teams.divisions
  end

  def show
    @pro_team = ProTeam.find(params[:id])
    @positions = @pro_team.players.positions
  end

end
