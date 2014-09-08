class TeamPlayerRelationshipsController < ApplicationController

  def create
    team = current_user.team
    player = Player.find(params[:id])
    team_player_relationship = team.pick(player)
    redirect_to team_path(team)
  end

end
