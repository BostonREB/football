class TeamPlayerRelationshipsController < ApplicationController

  def create
    team = current_user.team
    @player = Player.find(params[:id])
    team_player_relationship = team.pick(@player)
    render :change
  end

  def destroy
    team = current_user.team
    @player = Player.find(params[:id])
    team.drop(@player)
    render :change
  end

end
