class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.create(team_params)
    redirect_to dashboard_path
  end

  def show
    @team = Team.find(params[:id])
    players = @team.selected_players.all
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end


end
