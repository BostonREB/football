class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def create
    @user = current_user
    @team = Team.create(team_params)
    @user.team = @team
    redirect_to dashboard_path
  end

  def show
    @team = Team.find(params[:id])
    @players = @team.selected_players.all.sort
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end


end
