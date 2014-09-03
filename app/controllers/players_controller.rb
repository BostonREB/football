class PlayersController < ApplicationController

  def index
    @players = Player.all
    @pro_teams = ProTeam.all
  end

  def show
    @player = Player.find(params[:id])
    @pro_team = get_player_team(@player)
  end

  private

  def get_player_team(player)
    team = player.team
    team = ProTeam.find_by(code: team)
  end

end
