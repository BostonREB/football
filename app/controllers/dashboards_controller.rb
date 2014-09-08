class DashboardsController < ApplicationController

  def show
    @team = current_user.team
  end

end
