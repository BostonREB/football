class PlayersController < ApplicationController

  def index
    @players = Player.all
    @rankings = Ranking.all
    @pro_teams = ProTeam.all
    @team = Team.find(params[:team_id] ||= current_user.teams.first)
  end

  def show
    @player = Player.find(params[:id])
  end
end
