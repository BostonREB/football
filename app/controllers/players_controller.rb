class PlayersController < ApplicationController

  def index
    @players = Player.all
    @rankings = Ranking.all
    @pro_teams = ProTeam.all
  end

  def show
    @player = Player.find(params[:id])
  end
end
