class TeamPlayerRelationshipsController < ApplicationController

  def create
    @team = Team.find(params[:id])
    @player = Player.find(params[:player_id])
    team_player_relationship = TeamPlayerRelationship.create(selecting_team: @team, selected_player: @player)
    redirect_to team_path(@team)
  end

  def destroy
    @team = Team.find(params[:id])
    @player = Player.find(params[:player_id])
    team_player_relationship = @team.team_player_relationships.where(selected_player: @player)
    team_player_relationship.destroy_all
    redirect_to team_path(@team)
  end

end
