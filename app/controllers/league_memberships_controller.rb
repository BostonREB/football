class LeagueMembershipsController < ApplicationController

  def create
    @league = League.find(params[:id])
    league_membership = current_user.join(@league)
    render :change
  end

  def destroy
    @league = League.find(params[:id])
    current_user.leave(@league)
    render :change
  end

end
