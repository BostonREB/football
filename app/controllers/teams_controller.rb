class TeamsController < ApplicationController

  def new
    @league = League.find(params[:league_id])
    @team = Team.new
  end

  def create
    @league = current_user.leagues.find(params[:league_id])
    @team = @league.teams.new(team_params)
    if @team.save
      redirect_to @league
    else
      redirect_to :new
    end
  end

  def show
    @team = Team.find(params[:id])
    @players = @team.selected_players.all.sort
  end

  private

  def team_params
    params.require(:team).permit(:name).merge(user_id: current_user.id)
  end


end
