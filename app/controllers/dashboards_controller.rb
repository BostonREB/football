class DashboardsController < ApplicationController
  # before_filter :fantasy_league_exists?

  def show
    @leagues = current_user.leagues
  end


  # def fantasy_league_exists?
  #   if current_user.team.nil?
  #     redirect_to new_team_path
  #   end
  # end

end
