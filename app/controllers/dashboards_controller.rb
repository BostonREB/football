class DashboardsController < ApplicationController
  before_filter :fantasy_team_exists?

  def show
    @team = current_user.team
  end


  def fantasy_team_exists?
    if current_user.team.nil?
      redirect_to new_team_path
    end
  end

end
